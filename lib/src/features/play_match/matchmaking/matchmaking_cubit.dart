import 'package:async_data_bloc/async_data_bloc.dart';
import 'package:fifa/src/common/domain/tournament/tournament.dart';
import 'package:fifa/src/common/utils.dart';
import 'package:fifa/src/features/tournaments/tournament_details/models/participant.dart';
import 'package:fifa/src/features/tournaments/tournament_repository.dart';

class MatchmakingCubit {
  final TournamentRepository _tournamentRepository;
  final int tournamentId;
  final int userId;

  late final AsyncCubit<TournamentParticipant> user;
  late final AsyncCubit<TournamentRef> tournament;

  MatchmakingCubit({
    required this.userId,
    required this.tournamentId,
    required TournamentRepository tournamentRepository,
  }) : _tournamentRepository = tournamentRepository {
    user = AsyncCubit(
      () async => _tournamentRepository
          .getTournamentParticipant(
            tournamentId: tournamentId,
            userId: userId,
          )
          .then(getOrThrow),
    );

    tournament = AsyncCubit(
      () async => _tournamentRepository
          .getTournament(
            id: tournamentId,
          )
          .then(getOrThrow),
    );
  }
}
