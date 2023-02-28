part of 'active_match_bloc.dart';

class ActiveMatchState extends Equatable {
  final List<ActiveMatch> activeMatches;

  const ActiveMatchState(this.activeMatches);

  @override
  List<Object> get props => [activeMatches];
}
