part of 'dialog_cubit.dart';

@immutable
abstract class DialogState {}

class DialogInitial extends DialogState {}

///TODO convert [dialog] to a  Queue<DialogType> so we can enqueue several dialog
class DisplayDialog extends DialogState with EquatableMixin {
  final DialogType dialog;

  DisplayDialog(this.dialog);

  @override
  List<Object> get props => [dialog];
}

///Sealed class used to model the different types of dialogs that can be shown in the app globally
@immutable
abstract class DialogType implements Equatable {}

class CheckInDialog extends DialogType with ExtensionsMixin {
  final LobbyCheckIn lobbyCheckIn;

  CheckInDialog(this.lobbyCheckIn);

  @override
  List<Object> get props => [lobbyCheckIn.id];

  @override
  bool get stringify => true;
}

class DisputeDialog extends DialogType {
  final MatchLobbyData matchLobbyData;
  final MatchScores results;

  DisputeDialog({required this.matchLobbyData, required this.results});

  @override
  List<Object> get props => [matchLobbyData, results];

  @override
  bool get stringify => true;
}
