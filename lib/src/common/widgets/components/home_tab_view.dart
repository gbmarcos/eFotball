import 'package:fifa/r.dart';
import 'package:fifa/resources/e_fotball_icons.dart';
import 'package:fifa/src/app/app.dart';
import 'package:fifa/src/app/keys.dart';
import 'package:fifa/src/common/extensions.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:routemaster/routemaster.dart';

/// Wrapper Class which holds the default tabbed UI for the home page with its bottom nav bar

class HomeTabViewPage extends StatefulWidget {
  const HomeTabViewPage({Key? key}) : super(key: key);

  @override
  State<HomeTabViewPage> createState() => _HomeTabViewPageState();
}

class _HomeTabViewPageState extends State<HomeTabViewPage> {
  @override
  Widget build(BuildContext context) => const AuthenticatedDependencies(child: HomeTabView());
}

class HomeTabView extends StatelessWidget {
  const HomeTabView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final tabPage = TabPage.of(context);

    return Scaffold(
      body: TabBarView(
        controller: tabPage.controller,
        physics: const NeverScrollableScrollPhysics(),
        children: [
          for (final stack in tabPage.stacks)
            HeroControllerScope(
              controller: MaterialApp.createMaterialHeroController(),
              child: PageStackNavigator(
                stack: stack,
              ),
            ),
        ],
      ),
      bottomNavigationBar: EFotballBottomBar(tabPage: tabPage),
    );
  }
}

class EFotballBottomBar extends StatelessWidget {
  const EFotballBottomBar({
    Key? key,
    required this.tabPage,
  }) : super(key: key);

  final TabPageState tabPage;

  @override
  Widget build(BuildContext context) {
    const iconPadding = EdgeInsets.only(bottom: 5);
    const labelStyle = TextStyle(fontSize: 10, fontWeight: FontWeight.w500);

    return Theme(
      data: context.theme.copyWith(
        canvasColor: R.colors.bottomMainBarColor,
      ),
      child: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        currentIndex: tabPage.index,
        selectedItemColor: context.theme.colorScheme.secondary,
        unselectedItemColor: Colors.white,
        showUnselectedLabels: true,
        showSelectedLabels: true,
        selectedLabelStyle: labelStyle,
        unselectedLabelStyle: labelStyle,
        elevation: 5,
        iconSize: 16,
        onTap: (pageIndex) {
          // pop routes until the number of routes into the routes list of the TabPageState is 2
          // all cases:
          // {'/','/home'}
          // {'/','/tournaments'}
          // {'/','/streams'}
          // {'/','/clubs'}
          // {'/','/profile/:id'}
          Routemaster.of(context).popUntil((routeData) {
            return tabPage.getCurrentPages().length == 2;
          }).then((_) => tabPage.controller.animateTo(pageIndex));
        },
        items: [
          BottomNavigationBarItem(
            label: context.l10n.homeLabel,
            icon: const Padding(
              key: Keys.bottomNavBarHome,
              padding: iconPadding,
              child: Icon(FontAwesomeIcons.home),
            ),
          ),
          BottomNavigationBarItem(
            label: context.l10n.tournamentsLabel,
            icon: const Padding(
              key: Keys.bottomNavBarTournaments,
              padding: iconPadding,
              child: Icon(EFotball.tournament),
            ),
          ),
          BottomNavigationBarItem(
            label: context.l10n.streamsLabel,
            icon: const Padding(
              key: Keys.bottomNavBarStreams,
              padding: iconPadding,
              child: Icon(EFotball.streams),
            ),
          ),
          BottomNavigationBarItem(
            label: context.l10n.clubsLabel,
            icon: const Padding(
              key: Keys.bottomNavBarClub,
              padding: iconPadding,
              child: Icon(EFotball.clubs),
            ),
          ),
          BottomNavigationBarItem(
            label: context.l10n.profileLabel,
            icon: const Padding(
              key: Keys.bottomNavBarProfile,
              padding: iconPadding,
              child: Icon(EFotball.profile),
            ),
          ),
        ],
      ),
    );
  }
}
