import 'package:fifa/r.dart';
import 'package:fifa/resources/resources.dart';
import 'package:fifa/src/common/extensions.dart';
import 'package:fifa/src/common/widgets/form_text_button.dart';
import 'package:flutter/material.dart';
import 'package:routemaster/routemaster.dart';

class CheckYourInboxPage extends StatefulWidget {
  const CheckYourInboxPage({Key? key}) : super(key: key);

  @override
  _CheckYourInboxPageState createState() => _CheckYourInboxPageState();
}

class _CheckYourInboxPageState extends State<CheckYourInboxPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: R.colors.background,
      body: SafeArea(
        child: SingleChildScrollView(
          physics: const ClampingScrollPhysics(),
          child: Column(
            children: [
              Container(
                alignment: AlignmentDirectional.center,
                width: double.infinity,
                padding: const EdgeInsets.symmetric(vertical: 50),
                child: Image.asset(Images.appLogo),
              ),
              Text(
                context.l10n.checkYourInboxPageTitle,
                style:
                    const TextStyle(color: Colors.white, fontWeight: FontWeight.w500, fontSize: 20),
              ),
              const SizedBox(
                height: 19,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 40),
                child: Text(
                  context.l10n.checkYourInboxIndicationText,
                  textAlign: TextAlign.center,
                  style: const TextStyle(color: Colors.white, fontSize: 12),
                ),
              ),
              const SizedBox(
                height: 19,

              ),
              FormTextButton(
                  text: context.l10n.backToLogin,
                  onPressed: () {
                    Routemaster.of(context).pop();
                  }),
            ],
          ),
        ),
      ),
    );
  }
}
