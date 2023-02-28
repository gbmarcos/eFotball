import 'package:fifa/src/common/extensions.dart';
import 'package:flutter/services.dart' show PlatformException;
import 'package:uni_links/uni_links.dart';

Future<String?> getInitialExternalAndValidLink() async {
  try {
    final initialLink = await getInitialLink();
    if (isLinkValid(initialLink)) return initialLink;
  } on PlatformException {
    // return?
  }
}

/// Checks if the given [link] is valid
/// the expected format looks like "*efotboll.se/reset_password/<forgotPasswordID>/<userID>/<forgotPasswordToken>"
///only the last 3 values are needed to performing pass reset
bool isLinkValid(String? link) {
  if (link != null) {
    try {
      //check link data

      //to get [reset_password, <forgotPasswordID>, <userID>, <forgotPasswordToken>] list
      final linkData = link.split('/').skipWhile((value) => value != 'reset_password');

      final allValuesReceived = linkData.length == 4;
      final allValuesNotNullOrEmpty = linkData.every((element) => element.isNotNullOrEmpty);
      final isValidForgotPasswordIDValue = int.tryParse(linkData.elementAt(1)) != null;
      final isValidUserID = int.tryParse(linkData.elementAt(2)) != null;

      return allValuesReceived && allValuesNotNullOrEmpty && isValidForgotPasswordIDValue && isValidUserID;
    } catch (e) {
      print(e);
      return false;
    }
  } else {
    return false;
  }
}
