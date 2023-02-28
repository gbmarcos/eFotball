import 'dart:async';
import 'dart:developer';

import 'package:async_data_bloc/async_data_bloc.dart';
import 'package:collection/collection.dart';
import 'package:fifa/src/common/utils.dart';
import 'package:fifa/src/features/streams/model/stream.dart';
import 'package:fifa/src/features/streams/stream_repository.dart';

class StreamPageCubit {
  final StreamRepository _streamRepository;

  late final AsyncCubit<List<Stream>> liveStreamList;
  late final AsyncCubit<List<Stream>> archivedStreamList;
  late final AsyncCubit<List<Stream>> mockedLiveStreamList;

  final int? _orgId;
  final int streamRequestLimit = 20;

  StreamPageCubit({
    required StreamRepository streamRepository,
    int? orgId,
  })  : _streamRepository = streamRepository,
        _orgId = orgId {
    mockedLiveStreamList = AsyncCubit(
      () => _streamRepository.mockedListLiveStreams().then(getOrThrow),
    );

    liveStreamList = AsyncCubit(
      () => _streamRepository
          .listLiveStreams(
            orgId: _orgId,
            limit: streamRequestLimit,
          )
          .then(getOrThrow)
          .then((value) => value.sortedByCompare((it) => it.viewers, (int? a, int? b) => (b ?? 0).compareTo(a ?? 0))),
    );

    archivedStreamList = AsyncCubit(
      () => _streamRepository
          .listArchivedStreams(
            orgId: _orgId,
            limit: streamRequestLimit,
          )
          .then(getOrThrow),
    );
  }

  Future<void> loadMoreLiveStreams() async {
    final currentLiveStreamList = liveStreamList.state.valueOrNull ?? <Stream>[];

    final lastStreamId = currentLiveStreamList.lastOrNull?.tournamentId;

    await _streamRepository
        .listLiveStreams(
          orgId: _orgId,
          idOffset: lastStreamId,
          limit: streamRequestLimit,
        )
        .then(getOrThrow)
        .then(
      (moreStreams) {
        liveStreamList.emit(AsyncValue.data([...currentLiveStreamList, ...moreStreams]
            .sortedByCompare((it) => it.viewers, (int? a, int? b) => (b ?? 0).compareTo(a ?? 0))));
      },
      onError: (Object err, StackTrace stack) {
        log('$err');
      },
    );
  }

  Future<void> loadMoreArchivedStreams() async {
    final currentArchivedStreamList = archivedStreamList.state.valueOrNull ?? <Stream>[];

    final lastStreamId = currentArchivedStreamList.lastOrNull?.tournamentId;

    await _streamRepository
        .listArchivedStreams(
          orgId: _orgId,
          idOffset: lastStreamId,
          limit: streamRequestLimit,
        )
        .then(getOrThrow)
        .then(
      (moreStream) {
        archivedStreamList.emit(AsyncValue.data(currentArchivedStreamList + moreStream));
      },
      onError: (Object err, StackTrace stack) {
        log('$err');
      },
    );
  }
}
