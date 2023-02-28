import 'dart:developer';

import 'package:async_data_bloc/async_data_bloc.dart';
import 'package:collection/collection.dart';
import 'package:fifa/src/common/utils.dart';
import 'package:fifa/src/features/club/club_repository.dart';
import 'package:fifa/src/features/club/model/club.dart';

class OrgPageCubit {
  final ClubRepository _clubRepository;
  late final AsyncCubit<List<Club>> clubList;

  final int clubRequestLimit = 10;
  String? clubQuery;

  OrgPageCubit({
    required ClubRepository clubRepository,
  }) : _clubRepository = clubRepository {
    clubList = AsyncCubit(() => _clubRepository.listClubs(query: clubQuery).then(getOrThrow));
  }

  Future<void> loadMoreClubs() async {
    final currentClubList = clubList.state.valueOrNull ?? <Club>[];

    final lastClubId = currentClubList.lastOrNull?.id;

    await _clubRepository
        .listClubs(
          query: clubQuery,
          idOffset: lastClubId,
          limit: clubRequestLimit,
        )
        .then(getOrThrow)
        .then(
      (moreClubs) {
        clubList.emit(AsyncValue.data(currentClubList + moreClubs));
      },
      onError: (Object err, StackTrace stack) {
        log('$err');
      },
    );
  }

  Future<void> searchClubs(String? query) async {
    //emit a loading state if there isn't one yet
    clubList.state.maybeWhen(
      orElse: () {
        clubList.emit(const AsyncValue.loading());
      },
      loading: (_) {},
    );

    clubQuery = query;

    //this method will be called every time the value of the search text field changes
    //therefore is necessary to avoid incomplete and unnecessary requests.
    await Future<void>.delayed(const Duration(milliseconds: 300));

    if (clubQuery != query) {
      //there are a new query and the current query will be cancelled
      return;
    }

    await _clubRepository
        .listClubs(
          query: clubQuery,
          limit: clubRequestLimit,
        )
        .then(getOrThrow)
        .then(
      (foundClubs) {
        if (clubQuery != query) {
          //there are a new query and the current query will be cancelled
          return;
        }

        clubList.emit(AsyncValue.data(foundClubs));
      },
      onError: (Object err, StackTrace stack) {
        if (clubQuery != query) {
          //there are a new query and the current query will be cancelled
          return;
        }

        clubList.emit(AsyncValue.error(err, stack));
      },
    );
  }
}
