# Getting Started

This project contains 3 flavors:

- development
- staging
- production

To run the desired flavor either use the launch configuration in VSCode/Android Studio or use the following commands:

```sh
# Staging
$ flutter run --flavor staging --target lib/main_staging.dart

# Production
$ flutter run --flavor production --target lib/main_production.dart
```

Or you could use the makefile for convenience

```sh
# Staging
$ make staging

# Production
$ make prod
```

Each flavor communicates with a different backend server and has different tokens for 3rd party services, mainly staging and production are used.

## Structure

- The app's structure is  [packaged by feature](https://phauer.com/2020/package-by-feature/)

- The [packages](packages) sub-folder contains any package or plugin that is independent enough to make sense to separate
  from the main app
  
## Working with i18n

After modifying the `.arb` in order for flutter to generate the dart code for the new translations run

```sh
make dependencies
```

### Adding Translations

1. For each supported locale, add a new ARB file in `lib/l10n/arb`.

```none
├── l10n
│   ├── arb
│   │   ├── app_en.arb
│   │   └── app_sv.arb
```

## Adding Custom Icons

If you want to generate a custom icons package or add new Icons to the existing `EFotball` head to https://www.fluttericon.com
and drop all the SVG's from which you want to make an icon package from. Download and profit.

## FAQ

Q: Why my translations are giving errors eg(The argument type 'dynamic' can't be assigned to the parameter type 'String'.) when using `context.l10n.*`

A: Regenerate your translations

```sh
make dependencies
```

Q: How to use translations in the code?

A: Import `import 'package:usinus/src/shared/extensions.dart';` and use  `context.l10n.my_string_name`

## Navigation

The [routemaster](https://pub.dev/packages/routemaster) package is used (now a Flutter favorite!).

### Passing object through routes using Navigator 2.0

As navigator 2.0 works using by URL's only the only data you can pass to a child route is a string, as an id
for example. But that falls short when needing to pass Objects say for example in a Master/Detail view. In which you might
already have the object in memory after receiving it from an external service.

Re-downloading the same data in a child screen is not what phone users expect, so a workaround is in place.
[GetIt](https://pub.dev/packages/get_it) is used to pass data between views.

TLDR:


1. When pushing the route use the `pushWithScope` method. In which you will inject the needed dependencies
```dart
   Routemaster.of(context).pushWithScope('settings',
                                          value:ProfilePageCubit();
                                      });
```
2. The route itself in the `RouteMap` must be a child of `ScopedDependency` which will be in charge of disposing the dependencies
as soon as the page is disposed.
```dart
    'settings': (route) => MaterialPage<void>(
child: ScopedDependency(
scopeName: route.path,
child: const ProfileSettingsPage(),
)),
```
3. On the intended widget use as ```context.fromSacco<Club>();```
## Notifications

The app has two types of notification services push notifications via [fcm] (https://firebase.google.com/docs/cloud-messaging) used for urgent and important events, and websocket messages received via [pusher](https://pusher.com/channels) for updating the UI in real time.

### Push notifications

Push notifications are subscibed on user authentication and unsubscribed on user log-out, a user must only see its information and we should prevent it from leaking to others.

Topics are used to subscribe users to personal or general topics. The topics should always have the format:

```re
(staging|prod|dev)-(en|sv)-[\w-]+
```

The first group is to isolate notifications from one server leaking to another. The second group is for localization of the notifications themselves and then we specify to whic topic well subscribe to eg:

`prod-en-private-user-67`


There are mainly three ways of receiving a push notification :
Background
Foreground
MessageOpened the app

We can also check for pending messages received since the last time the app was opened via `FirebaseMessaging.instance.getInitialMessage()`

### Websocket notifications

See the [official docs](https://pusher.com/docs/channels/) for a lot of detailed info. Basically we subscribe to channels(strings), in wich we receive different types of messages (which we also need to subscribe to, and are also strings), those messages can carry data which well use to update our apps state.

TLDR :
You can subscribe to different channels which can have different topics.

Example

```dart
///Subscribe to channel
final channel = _client.subscribe('private-user-$userId');
///Bind to topics
    await channel.bind('notification', (event) async {
      if(event?.data!=null){
        final notification = PusherNotification.fromJson(jsonDecode(event!.data!) as Map<String, dynamic>);
        getIt<CheckInRepository>().checkInLobby(notification);
      
      }}


```

## CI/CD

The CI/CD pipeline is configured via [codemagic](https://codemagic.io) and with each push to master a new release of the app is released to testflight.

The account is bound to the `efotbollapp@doctype.se` mail.

## Emulator codes
```none
open -a Simulator

cd clone

flutter run --flavor staging --target lib/main_staging.dart

xcrun simctl openurl booted "https://fifa-staging.oneplace.club/reset_password/12/66/xHjbcqq70npa"

https://fifa-staging.oneplace.club/reset_password/12/66/xHjbcqq70npa
```
