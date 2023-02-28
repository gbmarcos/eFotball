part of 'active_match_bloc.dart';

abstract class ActiveMatchEvent extends Equatable {
  const ActiveMatchEvent();
}

class AddMatch extends ActiveMatchEvent {
  final ActiveMatch match;

  const AddMatch(this.match);

  @override
  List<Object> get props => [match];
}

class RemoveMatch extends ActiveMatchEvent {
  final int matchId;

  const RemoveMatch(this.matchId);

  @override
  List<Object> get props => [matchId];
}

/// Sets the [matches] as the active matches, regardless of the current state
class SetMatches extends ActiveMatchEvent {
  final List<ActiveMatch> matches;

  const SetMatches(this.matches);

  @override
  List<Object> get props => [matches];
}

/// Checks if the [matches] are the same that in the bloc and updates only if different
class UpdateMatches extends ActiveMatchEvent {
  final List<ActiveMatch> matches;

  const UpdateMatches(this.matches);

  @override
  List<Object> get props => [matches];
}
