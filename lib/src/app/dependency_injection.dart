import 'dart:async';
import 'dart:convert';

import 'package:fifa/src/authentication/authentication.dart';
import 'package:fifa/src/authentication/authentication_hive_adapter.dart';
import 'package:fifa/src/authentication/authentication_repository.dart';
import 'package:fifa/src/features/club/club_repository.dart';
import 'package:fifa/src/features/home/home_page_cubit.dart';
import 'package:fifa/src/features/login/login/credentials/credential_hive_adapter.dart';
import 'package:fifa/src/features/login/login/credentials/credential_repository.dart';
import 'package:fifa/src/features/login/login/credentials/model/credential.dart';
import 'package:fifa/src/features/match/active_match_bloc/active_match_bloc.dart';
import 'package:fifa/src/features/match/match_repository.dart';
import 'package:fifa/src/features/news/news_repository.dart';
import 'package:fifa/src/features/org/org_repository.dart';
import 'package:fifa/src/features/play_match/match/check_in_repository.dart';
import 'package:fifa/src/features/play_match/match/dispute/dispute_repository.dart';
import 'package:fifa/src/features/play_match/match_bloc/match_lobby_bloc.dart';
import 'package:fifa/src/features/profile/friend_repository.dart';
import 'package:fifa/src/features/profile/profile_repository.dart';
import 'package:fifa/src/features/profile/settings_cubit.dart';
import 'package:fifa/src/features/streams/stream_repository.dart';
import 'package:fifa/src/features/tournaments/collection/tournament_collection_repository.dart';
import 'package:fifa/src/features/tournaments/tournament_repository.dart';
import 'package:fifa/src/common/data/network_service.dart';
import 'package:fifa/src/common/environment.dart';
import 'package:fifa/src/common/exceptions.dart';
import 'package:fifa/src/common/get_it_scoped_widget.dart';
import 'package:fifa/src/common/services/dialog_cubit/dialog_cubit.dart';
import 'package:fifa/src/common/services/shared_preferences.dart';
import 'package:fifa/src/notifications/notification_cubit/notification_cubit.dart';
import 'package:fifa/src/notifications/notification_repository.dart';
import 'package:fifa/src/notifications/realtime_notifications_service/realtime_notifications.dart';
import 'package:fifa/src/notifications/realtime_notifications_service/realtime_notifications_service.dart';
import 'package:fifa/src/push_notification/push_notification.dart';
import 'package:get_it/get_it.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:sentry_flutter/sentry_flutter.dart';
import 'package:timeago/timeago.dart' as timeago;

GetIt getIt = GetIt.instance;

Future<void> registerGlobalDependencies({required Environment environment}) async {
  timeago.setLocaleMessages('sv', timeago.SvMessages());
  await initHive();
  final preferences = Preferences();
  await preferences.initPrefs();
  final pushNotifications =
      platformDependantPushNotificationService(preferences: preferences, environment: environment);

  getIt
    ..registerSingleton(environment)
    ..registerSingleton(pushNotifications)
    ..registerSingleton(NetworkService(environment: environment))
    ..registerSingleton(AuthenticationRepository(client: getIt()))
    ..registerSingleton(UserCredentialRepository())
    ..registerSingleton(SettingsCubit(preferences: preferences), dispose: (SettingsCubit it) => it.close())
    ..registerSingleton(
      AuthenticationBloc(authenticationRepository: getIt(), credentialRepository: getIt())..getAppAuthenticationState(),
      dispose: (AuthenticationBloc it) => it.close(),
    );

  if (environment.isTestMode) await registerTestingGlobalDependencies(environment: environment);
}

Future<void> registerAuthenticatedDependenciesScope() async {
  getIt.pushNewScope(
    scopeName: 'auth',
    init: (getIt) {
      final user = getIt<AuthenticationBloc>().state.user!;

      getIt
        ..registerSingleton(AuthenticatedNetworkService(environment: getIt(), userId: user.id, token: user.token))
        ..registerSingleton(Sacco())
        ..registerSingleton(OrgRepository(client: getIt()))
        ..registerSingleton(ClubRepository(client: getIt()))
        ..registerSingleton(NewsRepository(client: getIt()))
        ..registerSingleton(TournamentRepository(client: getIt()))
        ..registerSingleton(TournamentCollectionRepository(client: getIt()))
        ..registerSingleton(MatchRepository(client: getIt()))
        ..registerSingleton(ProfileRepository(client: getIt()))
        ..registerSingleton(CheckInRepository(client: getIt()))
        ..registerSingleton(DisputeRepository(client: getIt()))
        ..registerSingleton(FriendRepository(client: getIt()))
        ..registerSingleton(NotificationRepository(client: getIt()))
        ..registerSingleton(StreamRepository(environment: getIt()))
        ..registerSingleton<RealTimeClient>(
          platformDependantRealtimeNotifications(environment: getIt(), id: user.id, token: user.token),
        )
        ..registerSingleton<HomePageCubit>(
          HomePageCubit(
            newsRepository: getIt(),
            clubRepository: getIt(),
            tournamentRepository: getIt(),
            tournamentCollectionRepository: getIt(),
            matchRepository: getIt(),
          ),
        )
        /////////////////////////////////////////////////////////////////////////////////////////////
        ..registerSingleton(
          NotificationCubit(getIt(), NotificationState(user.notifications ?? [])),
          dispose: (NotificationCubit it) => it.close(),
        )
        ..registerSingleton<MatchLobbyBloc>(
          MatchLobbyBloc(getIt(), getIt(), getIt()),
          dispose: (MatchLobbyBloc it) => it.close(),
        )
        ..registerSingleton<DialogCubit>(DialogCubit(), dispose: (DialogCubit it) => it.close())
        ..registerSingleton<ActiveMatchBloc>(
          ActiveMatchBloc()..add(SetMatches(user.activeMatches ?? [])),
          dispose: (ActiveMatchBloc it) => it.close(),
        );
    },
  );
  if (getIt<Environment>().isTestMode) await registerAuthenticatedTestDependenciesScope();
}

Future<void> registerTestingGlobalDependencies({required Environment environment}) async {
  getIt.pushNewScope(
    scopeName: 'testing',
    init: (getIt) {
      getIt
        ..registerSingleton<AuthenticationRepository>(FakeAuthenticationRepository(client: getIt()))
        ..registerSingleton(
          AuthenticationBloc(authenticationRepository: getIt(), credentialRepository: getIt())
            ..getAppAuthenticationState(),
          dispose: (AuthenticationBloc it) => it.close(),
        );
    },
  );
}

Future<void> registerAuthenticatedTestDependenciesScope() async {
  getIt.pushNewScope(
    scopeName: 'auth-testing',
    init: (getIt) {
      final fakeCheckInRepo = FakeCheckInRepository(client: getIt());
      final fakeTournamentRepository = FakeTournamentRepository(client: getIt());
      final fakeMatchRepo = FakeMatchRepository(client: getIt());

      getIt
        ..registerSingleton<CheckInRepository>(FakeCheckInRepository(client: getIt()))
        ..registerSingleton<TournamentRepository>(FakeTournamentRepository(client: getIt()))
        ..registerSingleton<MatchRepository>(FakeMatchRepository(client: getIt()))
        ..registerSingleton<MatchLobbyBloc>(
          MatchLobbyBloc(fakeCheckInRepo, fakeTournamentRepository, fakeMatchRepo),
          dispose: (MatchLobbyBloc it) => it.close(),
        );
    },
  );
}

  ///initialize hive store, user box and authentication box
  Future<void> initHive() async {
    try {
      bool compactionStrategy(int entries, int deletedEntries) => deletedEntries > 50;
      Hive
        ..registerAdapter(UserCredentialAdapter())
        ..registerAdapter(AuthenticationStatusAdapter());

      final encryptionKey = utf8.encode(UserCredential.hiveEncryptionKeyString);

      await Hive.initFlutter();

      await Hive.openBox<UserCredential>(
        UserCredential.hiveBoxName,
        compactionStrategy: compactionStrategy,
        encryptionCipher: HiveAesCipher(encryptionKey),
      );

      await Hive.openBox<AuthenticationStatus>(
        AuthenticationRepository.authHiveBoxName,
        compactionStrategy: compactionStrategy,
      );

      await Hive.openBox<UserCredential>(
        AuthenticationRepository.loggedUserHiveBoxName,
        compactionStrategy: compactionStrategy,
        encryptionCipher: HiveAesCipher(encryptionKey),
      );
    } catch (e) {
      await Sentry.captureException(HiveException(message: e.toString()));
    }
  }
