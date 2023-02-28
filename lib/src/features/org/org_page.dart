import 'dart:developer';

import 'package:async_data_bloc/async_data_bloc.dart';
import 'package:fifa/r.dart';
import 'package:fifa/src/app/dependency_injection.dart';
import 'package:fifa/src/common/exceptions.dart';
import 'package:fifa/src/common/extensions.dart';
import 'package:fifa/src/common/widgets/app_image.dart';
import 'package:fifa/src/common/widgets/custom_search_field.dart';
import 'package:fifa/src/common/widgets/custom_shimmer.dart';
import 'package:fifa/src/common/widgets/exception_widget.dart';
import 'package:fifa/src/features/club/model/club.dart';
import 'package:fifa/src/features/org/org_page_cubit.dart';
import 'package:fifa/src/notifications/notification_app_bar.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:routemaster/routemaster.dart';
import 'package:sentry_flutter/sentry_flutter.dart';

import '../../common/widgets/custom_search_field.dart';
import '../../common/widgets/exception_widget.dart';

class OrgPage extends StatelessWidget {
  const OrgPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return RepositoryProvider(
      create: (context) => OrgPageCubit(
        clubRepository: getIt(),
      ),
      child: const OrgView(),
    );
  }
}

class OrgView extends StatefulWidget {
  const OrgView({Key? key}) : super(key: key);
  static const pagePadding = EdgeInsets.only(left: 15, right: 13);

  @override
  State<OrgView> createState() => _OrgViewState();
}

class _OrgViewState extends State<OrgView> {
  late ValueNotifier<bool> isFetchingMore = ValueNotifier(false);

  @override
  void dispose() {
    isFetchingMore.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final pageState = context.read<OrgPageCubit>();

    return Scaffold(
      appBar: NotificationAppBar(title: Text(context.l10n.clubs)),
      body: NotificationListener<ScrollUpdateNotification>(
        onNotification: (notification) {
          loadMore(notification, pageState);
          return false;
        },
        child: RefreshIndicator(
          onRefresh: () async {
            pageState.clubList.refresh();
          },
          child: ListView(
            padding: OrgView.pagePadding,
            children: [
              const SizedBox(height: 32),
              _OrgViewContent(
                isFetchingMore: isFetchingMore,
              ),
            ],
          ),
        ),
      ),
    );
  }

  void loadMore(ScrollUpdateNotification notification, OrgPageCubit pageState) {
    if (notification.shouldLoadMoreFlag && !isFetchingMore.value) {
      pageState.clubList.state.maybeMap(
        orElse: () {},
        data: (data) {
          isFetchingMore.value = true;
          pageState.loadMoreClubs().then((_) => isFetchingMore.value = false);
        },
      );
    }
  }
}

class _OrgViewContent extends StatefulWidget {
  const _OrgViewContent({Key? key, required this.isFetchingMore}) : super(key: key);
  final ValueNotifier<bool> isFetchingMore;

  @override
  State<_OrgViewContent> createState() => _OrgViewContentState();
}

class _OrgViewContentState extends State<_OrgViewContent> {
  late final controller = TextEditingController();

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final pageState = context.read<OrgPageCubit>();
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        CustomSearchTextField(
          controller: controller,
          onChanged: (query) {
            pageState.searchClubs(query.isNullOrEmpty ? null : query);
          },
          hintText: context.l10n.searchClubs,
        ),
        const SizedBox(height: 20),
        AsyncCubitBuilder<List<Club>>(
          bloc: pageState.clubList,
          builder: (_, state) {
            return state.maybeMap(
              orElse: () => const SizedBox.shrink(),
              data: (club) => OrgList(clubs: club.value),
              loading: (_) => OrgList.loading(),
              error: (e) {
                final error = e.error;
                if (error is NetworkException) {
                  return error.map(
                    (value) => NetworkExceptionWidget(
                      refresh: pageState.clubList.refresh,
                    ),
                    noDataException: (value) => NoElementsExceptionWidget(
                      text: context.l10n.noClubs,
                      refresh: pageState.clubList.refresh,
                    ),
                  );
                } else {
                  if (kReleaseMode) {
                    Sentry.captureException(error, stackTrace: e.stackTrace);
                  } else {
                    log('${e.stackTrace}');
                    log('${e.error}');
                  }
                  return UnexpectedExceptionWidget(
                    refresh: pageState.clubList.refresh,
                  );
                }
              },
            );
          },
        ),
        ValueListenableBuilder<bool>(
          valueListenable: widget.isFetchingMore,
          builder: (context, isFetching, _) {
            return AnimatedSwitcher(
              duration: const Duration(milliseconds: 200),
              child: isFetching
                  ? Column(
                      children: [
                        OrgList.loading(count: 3),
                      ],
                    )
                  : const SizedBox.shrink(),
            );
          },
        ),
        const SizedBox(height: 10),
      ],
    );
  }
}

class OrgList extends StatelessWidget {
  final List<Club> clubs;

  const OrgList({Key? key, required this.clubs}) : super(key: key);

  static Widget loading({Key? key, int count = 5}) => _LoadingOrgList(count: count);

  @override
  Widget build(BuildContext context) {
    return AnimationLimiter(
      child: ListView.builder(

        shrinkWrap: true,
        itemCount: clubs.length,
        itemBuilder: (ctx, i) {
          return AnimationConfiguration.staggeredList(
            position: i,
            duration: const Duration(milliseconds: 325),
            delay: const Duration(milliseconds: 25),
            child: FadeInAnimation(
              child: OrgCard(club: clubs[i]),
            ),
          );
        },
      ),
    );
  }
}

class _LoadingOrgList extends StatelessWidget {
  const _LoadingOrgList({Key? key, this.count = 5}) : super(key: key);
  final int count;

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      shrinkWrap: true,
      itemCount: count,
      itemBuilder: (_, i) => CustomShimmer(
        child: ClipRRect(
          borderRadius: const BorderRadius.all(Radius.circular(4)),
          child: Container(
            color: Colors.black12.withOpacity(1),
            height: 54,
          ),
        ),
      ),
      separatorBuilder: (BuildContext context, int index) => const SizedBox(height: 4),
    );
  }
}

class OrgCard extends StatelessWidget {
  final Club club;

  const OrgCard({Key? key, required this.club}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    const iconPlaceholder = Icon(
      Icons.shield_outlined,
      color: Colors.white,
    );

    return Container(
      margin: const EdgeInsets.only(bottom: 4),
      child: InkWell(
        onTap: () {
          Routemaster.of(context).pushWithScope(
            R.routeNames.clubDetailsWithId('${club.id}'),
            value: club,
          );
        },
        borderRadius: R.shapes.radius_4,
        child: Container(
          padding: const EdgeInsets.only(left: 13, right: 23),
          height: 54,
          alignment: AlignmentDirectional.center,
          decoration: BoxDecoration(
            borderRadius: R.shapes.radius_4,
            color: R.colors.boxBackground,
          ),
          child: Row(
            children: [
              Hero(
                tag: club.slug,
                child: AppImage(
                  imageSize: const Size(35, 35),
                  image: club.logo,
                  error: (context) => iconPlaceholder,
                  placeholder: (_) => iconPlaceholder,
                ),
              ),
              const SizedBox(
                width: 25,
              ),
              Expanded(
                child: Text(
                  club.name,
                  style: const TextStyle(color: Colors.white, fontSize: 14, fontWeight: FontWeight.w500),
                ),
              ),
              Icon(
                Icons.arrow_forward_ios_sharp,
                color: R.colors.inputBoxTextInitiative,
                size: 15,
              )
            ],
          ),
        ),
      ),
    );
  }
}
