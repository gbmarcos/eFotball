import 'dart:developer';

import 'package:async_data_bloc/async_data_bloc.dart';
import 'package:collection/collection.dart';
import 'package:fifa/src/common/utils.dart';
import 'package:fifa/src/features/match/match_repository.dart';
import 'package:fifa/src/features/match/model/match.dart';
import 'package:fifa/src/features/profile/friend_repository.dart';
import 'package:fifa/src/features/profile/models/user_profile.dart';
import 'package:fifa/src/features/profile/profile_repository.dart';
import 'package:fifa/src/common/domain/user/user.dart';

class ProfilePageCubit {
  final ProfileRepository _profileRepository;
  final MatchRepository _matchRepository;
  final FriendRepository _friendRepository;

  final int userId;

  late final AsyncCubit<UserProfile> profile;
  late final AsyncCubit<List<Match>> userMatches;
  late final AsyncCubit<List<Friend>> friends;

  final int friendRequestLimit = 10;
  String? friendQuery;

  ProfilePageCubit({
    required ProfileRepository profileRepository,
    required MatchRepository matchRepository,
    required FriendRepository friendRepository,
    required this.userId,
  })  : _profileRepository = profileRepository,
        _matchRepository = matchRepository,
        _friendRepository = friendRepository {
    profile = AsyncCubit(() => _profileRepository.getOwnProfile(userId:  userId).then(getOrThrow));
    userMatches = AsyncCubit(
      () => _matchRepository.listMatches(userId: userId).then(getOrThrow),
      refreshPolicy: RefreshPolicy.noLoading,
    );
    friends = AsyncCubit(
      () => _friendRepository
          .getFriend(
            userId: userId,
            limit: friendRequestLimit,
            query: friendQuery,
          )
          .then(getOrThrow),
    );
  }

  Future<void> loadMoreFriends() async {
    final currentFriendList = friends.state.valueOrNull ?? <Friend>[];

    final lastFriendId = currentFriendList.lastOrNull?.id;

    await _friendRepository
        .getFriend(
          query: friendQuery,
          userId: userId,
          idOffset: lastFriendId,
          limit: friendRequestLimit,
        )
        .then(getOrThrow)
        .then(
      (moreFriends) {
        friends.emit(AsyncValue.data(currentFriendList + moreFriends));
      },
      onError: (Object err, StackTrace stack) {
        log('$err');
      },
    );
  }

  Future<void> searchFriends(String? query) async {
    //emit a loading state if there isn't one yet
    friends.state.maybeWhen(
      orElse: () {
        friends.emit(const AsyncValue.loading());
      },
      loading: (_) {},
    );

    friendQuery = query;

    //this method will be called every time the value of the search text field changes
    //therefore is necessary to avoid incomplete and unnecessary requests.
    await Future<void>.delayed(const Duration(milliseconds: 300));

    if (friendQuery != query) {
      //there are a new query and the current query will be cancelled
      return;
    }

    await _friendRepository
        .getFriend(
          query: friendQuery,
          userId: userId,
          limit: friendRequestLimit,
        )
        .then(getOrThrow)
        .then(
      (foundFriends) {
        friends.emit(AsyncValue.data(foundFriends));

        if (friendQuery != query) {
          //there are a new query and the current query will be cancelled
          return;
        }
      },
      onError: (Object err, StackTrace stack) {
        friends.emit(AsyncValue.error(err, stack));

        if (friendQuery != query) {
          //there are a new query and the current query will be cancelled
          return;
        }
      },
    );
  }
}

bool isTwitchConnected(User user) {
  return user.twitchUsername != null;
}

extension LoadMoreX<T> on AsyncCubit<Iterable<T>> {
  Future<Iterable<T>> loadMore(Future<Iterable<T>> Function() next) async {
    return state.maybeMap(
      orElse: () => [],
      data: (currentData) async {
        final nextPage = await next();
        currentData.value.last;
        final allPages = [...currentData.value, ...nextPage];
        emit(AsyncValue.data(allPages));
        return allPages;
      },
    );
  }
}
