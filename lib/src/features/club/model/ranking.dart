import 'package:fifa/src/common/domain/user/user.dart';
import 'package:fifa/src/features/club/model/user_ranked.dart';
import 'package:fpdart/fpdart.dart';

/// An array of [UserRanked] for each [Console].
/// A `Club` may have a ranking for each [Game]
class Ranking {
  final List<List<UserRanked>?> ranking;

  const Ranking({required this.ranking});

  int get amountOfConsoles {
    return ranking.where((element) => element != null).length;
  }

  bool hasRankingForConsole(Console console) {
    return ranking[console.index] != null;
  }

  factory Ranking.fromJson(List<dynamic> json) {
    return Ranking(
        ranking: json
            .map((dynamic e) =>
                (e as List<dynamic>?)?.map((dynamic e) => UserRanked.fromJson(e as Map<String, dynamic>)).toList())
            .toList());
  }

  List<UserRanked>? getRankingForConsole(Console console) {
    if (console.index > ranking.length) {
      return null;
    } else {
      return ranking[console.index];
    }
  }

  @override
  String toString() {
    return 'Ranking{ranking: $ranking}';
  }
}

class GameRanking {
  final List<Ranking?> rankings;

  const GameRanking({required this.rankings});

  Ranking? getRankingForGame(Game game) {
    if (game.index > rankings.length) {
      return null;
    } else {
      return rankings[game.index];
    }
  }

  Option<Tuple2<Game, Ranking>> getFirstRankingNotNull() {
    for (var i = 0; i < rankings.length; i++) {
      if (rankings[i] != null) return Some(Tuple2(Game.values[i], rankings[i]!));
    }
    return const None();
  }

  bool hasAnyNonNullRanking() {
    final hasAnyNonNullRanking =
        rankings.any((element) => element != null && element.ranking.any((element) => element != null));
    return hasAnyNonNullRanking;
  }
}
