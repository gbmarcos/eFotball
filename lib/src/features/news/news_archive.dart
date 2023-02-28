import 'package:async_data_bloc/async_data_bloc.dart';
import 'package:fifa/r.dart';
import 'package:fifa/src/app/dependency_injection.dart';
import 'package:fifa/src/app/keys.dart';
import 'package:fifa/src/common/exceptions.dart';
import 'package:fifa/src/common/extensions.dart';
import 'package:fifa/src/common/utils.dart';
import 'package:fifa/src/common/widgets/exception_widget.dart';
import 'package:fifa/src/features/club/club_repository.dart';
import 'package:fifa/src/features/club/model/club.dart';
import 'package:fifa/src/features/club/widgets/club_card.dart';
import 'package:fifa/src/features/news/model/news.dart';
import 'package:fifa/src/features/news/news_list.dart';
import 'package:fifa/src/features/news/news_repository.dart';
import 'package:fifa/src/notifications/notification_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fpdart/fpdart.dart' show Either;
import 'package:routemaster/routemaster.dart';

class NewsArchiveCubit {
  final NewsRepository _newsRepository;
  late AsyncCubit<List<News>> news;
  int? _selectedOrgId;

  set selectedOrg(int? id) {
    if (_selectedOrgId != id) {
      _selectedOrgId = id;

      news.changeFuture = () => _newsRepository.listNews(orgId: _selectedOrgId).then(getOrThrow);
    }
  }

  int? get selectedOrg => _selectedOrgId;

  NewsArchiveCubit({required NewsRepository newsRepository, int? selectedOrgId})
      : _newsRepository = newsRepository,
        _selectedOrgId = selectedOrgId {
    news = AsyncCubit(
      () => _newsRepository.listNews(orgId: _selectedOrgId).then(getOrThrow),
      refreshPolicy: RefreshPolicy.reset,
    );
  }
}

class NewsArchivePage extends StatefulWidget {
  const NewsArchivePage({
    Key? key,
  }) : super(key: key);

  @override
  State<NewsArchivePage> createState() => _NewsArchivePageState();
}

class _NewsArchivePageState extends State<NewsArchivePage> {
  late final Either<Club, List<Club>>? clubParameter = context.fromSacco<Either<Club, List<Club>>>();
  late final selectedClubId = clubParameter?.fold((l) => l.id, (r) => null) ??
      int.tryParse(Routemaster.of(context).currentRoute.queryParameters['clubId'] ?? '');
  late final _club = _hydrateDependencies();

  AsyncCubit<Either<Club, List<Club>>> _hydrateDependencies() {
    final clubId = Routemaster.of(context).currentRoute.queryParameters['clubId'];
    // If dependencies were injected, use it
    if (clubParameter != null) {
      return AsyncCubit.stub(initialValue: AsyncData(clubParameter!));
      // If they weren't but there is a clubId in the URL restore using a club
    } else if (clubId != null) {
      return AsyncCubit(() => getIt<ClubRepository>().get(id: clubId).then((value) {
            return Either<Club, List<Club>>.left(getOrThrow(value));
          }));
    }
//else restore using no clubs
    return AsyncCubit(() => getIt<ClubRepository>().listClubs().then((value) {
          return Either<Club, List<Club>>.right(getOrThrow(value));
        }));
  }

  @override
  Widget build(BuildContext context) {
    return AsyncCubitBuilder<Either<Club, List<Club>>>(
      key: Keys.newsPageArchive,
      bloc: _club,
      builder: (BuildContext context, state) {
        return state.maybeMap(
            orElse: () {
              print('Club is ${_club.state}');
              print('Club.value is ${_club.state.valueOrNull}');
              return const Scaffold(body: Center(child: CircularProgressIndicator()));
            },
            data: (d) => RepositoryProvider(
                  create: (_) => NewsArchiveCubit(newsRepository: getIt(), selectedOrgId: selectedClubId),
                  child: NewsArchiveView(club: d.value),
                ));
      },
    );
  }
}

class NewsArchiveView extends StatelessWidget {
  final Either<Club, List<Club>> club;

  const NewsArchiveView({Key? key, required this.club}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final pageState = context.read<NewsArchiveCubit>();
    String? selectedClub;

    final clubFilterWidget = club.fold(
        // If there is a club, show a tile with its image
        (l) => Padding(
              padding: const EdgeInsets.only(top: 25, left: 17, right: 17, bottom: 25),
              child: ClubListTile(club: l),
            ),
        // If there is NOT a club, show a dropdown with the club names
        (r) => Padding(
              padding: const EdgeInsets.only(top: 32, left: 17, right: 17, bottom: 25),
              child: _ClubFilterDropdown(
                key: Keys.newsPageArchiveClubDropdown,
                clubList: r,
                onChanged: (club) {
                  pageState.selectedOrg = club?.id;
                  selectedClub = club?.name;
                },
              ),
            ));

    return Scaffold(
      appBar: NotificationAppBar(title: Text(context.l10n.news)),
      body: CustomScrollView(
        slivers: [
          AsyncCubitBuilder<List<News>>(
              bloc: pageState.news,
              builder: (_, cubit) {
                return SliverList(
                    delegate: SliverChildListDelegate([
                  clubFilterWidget,
                  cubit.maybeMap(
                      error: (e) {
                        if (e.error is NoDataException) {
                          return NoElementsExceptionWidget(
                              text: selectedClub != null ? context.l10n.noNewsClub(selectedClub!) : null);
                        }
                        return const Center(child: NetworkExceptionWidget());
                      },
                      loading: (_) => NewsList.loading(),
                      orElse: () => const SizedBox.shrink()),
                  if (pageState.news.state.valueOrNull != null)
                    for (final news in pageState.news.state.valueOrNull!)
                      Padding(
                        padding: NewsList.getPadding(Axis.vertical).add(const EdgeInsets.symmetric(horizontal: 14)),
                        child: NewsCard(
                          onTap: () {
                            Routemaster.of(context).pushWithScope(
                              R.routeNames.newsDetailsWithId(news.id),
                              value: news,
                            );
                          },
                          news: news,
                        ),
                      ),
                ]));
              })
        ],
      ),
    );
  }
}

class _ClubFilterDropdown extends StatefulWidget {
  final List<Club> clubList;
  final ValueChanged<Club?>? onChanged;

  const _ClubFilterDropdown({Key? key, required this.clubList, this.onChanged}) : super(key: key);

  @override
  _ClubFilterDropdownState createState() => _ClubFilterDropdownState();
}

class _ClubFilterDropdownState extends State<_ClubFilterDropdown> {
  @override
  Widget build(BuildContext context) {
    return DropdownButtonFormField<Club>(
      decoration: const InputDecoration(
        contentPadding: EdgeInsets.symmetric(horizontal: 15),
      ),
      hint: Text(
        context.l10n.selectClubDropdown,
        style: TextStyles.listTileTrailing.copyWith(color: Colors.white),
      ),
      onChanged: widget.onChanged,
      items: [
        for (final club in widget.clubList)
          DropdownMenuItem(
            value: club,
            child: Text(
              club.name,
              style: const TextStyle(fontSize: 13),
            ),
          ),
      ],
      dropdownColor: R.colors.textBoxBG,
      elevation: 0,
    );
  }
}
