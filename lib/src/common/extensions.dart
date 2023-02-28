import 'package:fifa/r.dart';
import 'package:fifa/src/app/dependency_injection.dart';
import 'package:fifa/src/authentication/authentication.dart';
import 'package:fifa/src/authentication/authentication_repository.dart';
import 'package:fifa/src/common/domain/user/user.dart';
import 'package:fifa/src/common/get_it_scoped_widget.dart';
import 'package:fifa/src/features/login/login/credentials/credential_repository.dart';
import 'package:fifa/src/features/login/login/cubit/login_form_cubit.dart';
import 'package:fifa/src/features/login/signup/cubit/signup_form_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:intl/intl.dart';
import 'package:routemaster/routemaster.dart';
import 'package:sized_context/sized_context.dart';

export 'package:collection/collection.dart';
export 'package:fifa/resources/l10n/l10n.dart';
export 'package:flutter_gen/gen_l10n/app_localizations.dart';
export 'package:quiver/iterables.dart';
export 'package:quiver/strings.dart';

///Used to trigger auto import and avoid
///[dart limitation of not importing extensions](https://github.com/dart-lang/sdk/issues/38894)
mixin ExtensionsMixin {}

typedef Json = Map<String, dynamic>;

extension FutureX<T> on Future<T> {
  Future<T> retry({int times = 3, Duration delay = Duration.zero}) async {
    try {
      return await this;
    } catch (e) {
      if (times > 1) {
        return Future<T>.delayed(delay).then((_) => retry(times: --times, delay: delay));
      } else {
        rethrow;
      }
    }
  }
}

/// Helper extension to set textstyle properties in a postfix manner
/// example `TextStyles.body.bold.italic.letterSpace(1.6)`
extension TextStyleX on TextStyle {
  TextStyle get bold => copyWith(fontWeight: FontWeight.bold);

  TextStyle get italic => copyWith(fontStyle: FontStyle.italic);

  TextStyle color(Color color) => copyWith(color: color);

  TextStyle letterSpace(double value) => copyWith(letterSpacing: value);
}

  extension StringX on String? {
    bool get isNotNullOrEmpty => this != null && this!.isNotEmpty;

    bool get isNullOrEmpty => this == null || this!.isEmpty;

  //for signup and login validations

  bool get isValidEmail =>
      (this?.length ?? 0) >= 5 &&
      isNotNullOrEmpty &&
      RegExp(
        r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+",
      ).hasMatch(
        this!,
      );

  bool get isValidYoutubeUrl =>
      isNotNullOrEmpty &&
      RegExp(
        r'http(?:s?):\/\/(?:www\.)?youtu(?:be\.com\/watch\?v=|\.be\/)([\w\-\_]*)(&(amp;)?‌​[\w\?‌​=]*)?',
      ).hasMatch(
        this!,
      );

  bool get isNumeric => RegExp(
        r'^[0-9]+$',
      ).hasMatch(
        this!,
      );

  bool get isValidUsername =>
      (this?.length ?? 0) >= 3 &&
      isNotNullOrEmpty &&
      RegExp(
        r'^[a-zA-Z0-9]+$',
      ).hasMatch(
        this!,
      );

  bool get isValidGamerTag => RegExp(
        r'^[a-zA-Z0-9-_ ]+$',
      ).hasMatch(
        this!,
      );
}

const List<int> _daysInMonth = <int>[31, -1, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31];

extension DateTimeX on DateTime {
  String format(DateFormat format) {
    return format.format(this);
  }

  int getDaysInMonth() {
    if (month == DateTime.february) {
      final isLeapYear = (year % 4 == 0) && (year % 100 != 0) || (year % 400 == 0);
      if (isLeapYear) {
        return 29;
      }
      return 28;
    }
    return _daysInMonth[month - 1];
  }

  DateTime specialCopyWith({
    int? year,
    int? month,
    int? day,
  }) {
    final _year = year ?? this.year;
    final _month = month ?? this.month;
    var _day = day ?? this.day;

    final dayCount = DateTime(_year, _month).getDaysInMonth();

    if (_day > dayCount) _day = dayCount;

    return DateTime(_year, _month, _day);
  }

  ///Calculates the age of an user comparing this [DateTime] to the current Date
  ///it takes into account the months and days for the calculation
  int calculateAge() {
    final currentDate = DateTime.now();
    var age = currentDate.year - year;
    final month1 = currentDate.month;
    final month2 = month;
    if (month2 > month1) {
      age--;
    } else if (month1 == month2) {
      final day1 = currentDate.day;
      final day2 = day;
      if (day2 > day1) {
        age--;
      }
    }
    return age;
  }
}

extension BuildContextX on BuildContext {
  ThemeData get theme {
    return Theme.of(this);
  }

  Size get size {
    return mediaQuery.size;
  }

  MediaQueryData get mediaQuery {
    return MediaQuery.of(this);
  }

  FocusScopeNode get focusScope {
    return FocusScope.of(this);
  }

  NavigatorState get navigator {
    return Navigator.of(this);
  }

  ScaffoldState get scaffold {
    return Scaffold.of(this);
  }

  T? args<T>() {
    return ModalRoute.of(this)?.settings.arguments as T;
  }

  AuthenticationRepository get authenticationRepository {
    return getIt<AuthenticationRepository>();
  }

  UserCredentialRepository get userCredentialRepository {
    return getIt<UserCredentialRepository>();
  }

  AuthenticationState get currentAuthenticationState {
    return read<AuthenticationBloc>().state;
  }

  AuthenticationBloc get authenticationBloc {
    return read<AuthenticationBloc>();
  }

  LoginFormCubit get loginFormCubit {
    return read<LoginFormCubit>();
  }

  SignupFormCubit get signupFormCubit {
    return read<SignupFormCubit>();
  }

  User get currentUser {
    return getIt<AuthenticationBloc>().state.user!;
  }

  void unfocusAll() {
    final currentScope = FocusScope.of(this);
    if (!currentScope.hasPrimaryFocus && currentScope.hasFocus) {
      FocusManager.instance.primaryFocus?.unfocus();
    }
  }

  Routemaster get routeMaster => Routemaster.of(this);

  bool get isMobile => sizePx.shortestSide <= Breakpoint.md;

  bool get isTablet => sizePx.shortestSide < Breakpoint.lg && sizePx.shortestSide >= Breakpoint.md;

  bool get isTabletOrLarger => sizePx.shortestSide >= Breakpoint.md;

  bool get isDesktop => sizePx.shortestSide >= Breakpoint.lg;

  bool get isKeyboardVisible => MediaQuery.of(this).viewInsets.bottom > 100;

  T? fromSacco<T>() {
    return ScopedDependency.of(this).fromSacco<T>();
  }

  String get selectedTabRoute {
    switch (TabPage.of(this).index) {
      case 1:
        return R.routeNames.tournamentsSection;
      case 2:
        return R.routeNames.streamsSection;
      case 3:
        return R.routeNames.clubsSection;
      case 4:
        return R.routeNames.profileSection;
      default:
        return R.routeNames.homeSection;
    }
  }
}

extension TabControllerX on TabController {
  bool get isLastTab => index >= length - 1;
}

extension IntX on int {
  String get toMonthAbbr {
    if (this > 12 || this < 1) return '-';
    return DateFormat.MMM().format(DateTime(0, this));
  }
}

extension EnumX on Enum {
  String get name {
    return toString().split('.').last;
  }
}

extension E<X extends Object?> on X {
  bool get isNullOrEmptyList {
    final isEmptyList = this is List<dynamic> && (this as List<dynamic>?)!.isEmpty;
    return this == null || isEmptyList;
  }
}

Iterable<T> _interleave<T>(List<T> list, T element) sync* {
  for (var i = 0; i < list.length; i++) {
    yield list[i];
    if (i != list.length - 1) {
      yield element;
    }
  }
}

extension ListUtils<T> on List<T> {
  List<T> interleave(T element) {
    return _interleave(this, element).toList();
  }
}

extension DoubleX on double {
  double truncateToDecimals([int decimals = 2]) => double.parse(toStringAsFixed(decimals));
}

extension CosnoleX on Console? {
  IconData get icon {
    switch (this) {
      case Console.xbox:
        return FontAwesomeIcons.xbox;
      case Console.playstation:
        return FontAwesomeIcons.playstation;
      default:
        return FontAwesomeIcons.question;
    }
  }
}

extension ScrollUpdateNotificationX on ScrollUpdateNotification {
  bool get shouldLoadMoreFlag {
    late final itIsOnLoadingMoreZone =
        metrics.pixels > metrics.maxScrollExtent - 30 && metrics.pixels <= metrics.maxScrollExtent;

    late final itIsScrollingDown = (scrollDelta ?? 0.0) > 0.0;

    late final isPixelsPositive = metrics.pixels > 0;

    return isPixelsPositive && itIsScrollingDown && itIsOnLoadingMoreZone;
  }
}

extension RoutemasterXDependencies on Routemaster {
  NavigationResult<T> pushWithScope<T extends Object>(
    String path, {
    Map<String, String>? queryParameters,
    required T value,
  }) {
    late String scope;
    if (path.startsWith('/')) {
      scope = path;
    } else {
      scope = '${currentRoute.fullPath}/$path';
    }

    getIt<Sacco>().add<T>(scope, value);
    return push(
      scope,
      queryParameters: queryParameters,
    );
  }

  void replaceWithScope<T extends Object>(
    String path, {
    Map<String, String>? queryParameters,
    required String selectedTabRoute,
    required T value,
  }) {
    late String scope;
    if (path.startsWith('/')) {
      scope = path;
    } else {
      scope = '$selectedTabRoute/$path';
    }

    getIt<Sacco>().add<T>(scope, value);
    return replace(
      scope,
      queryParameters: queryParameters,
    );
  }
}

extension NumX on num? {
  bool get isNullOrZero => this == null || this == 0;
}
