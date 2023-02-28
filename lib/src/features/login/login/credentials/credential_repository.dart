import 'package:fifa/r.dart';
import 'package:fifa/src/common/exceptions.dart';
import 'package:fifa/src/features/login/login/credentials/model/credential.dart';
import 'package:sentry_flutter/sentry_flutter.dart';

class UserCredentialRepository {
  List<UserCredential> credentialList = [];
  int savedCredentialLimit = 5;

  List<UserCredential> getCredentials() {
    try {
      return credentialList
        ..clear()
        ..addAll(R.hiveBoxes.userCredential.values);
    } catch (e) {
      Sentry.captureException(HiveException(message: e.toString()));

      return [];
    }
  }

  //this function will keep only the last 5 saved credentials
  Future<void> addCredential(UserCredential newCredential) async {
    try {
      final credentialBox = R.hiveBoxes.userCredential;

      //strategy not to repeat credential into the box

      final savedCredentials = credentialBox.toMap().values.toList()
        ..removeWhere((credential) => credential.username == newCredential.username)
        ..insert(0, newCredential);

      final newList = savedCredentials.take(savedCredentialLimit);
      await credentialBox.clear();
      await credentialBox.putAll(Map<int, UserCredential>.fromIterable(
        newList,
        key: (dynamic element) => element.hashCode,
      ));
    } catch (e) {
      await Sentry.captureException(HiveException(message: e.toString()));
    }
  }
}
