import 'package:fifa/src/app/dependency_injection.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:quiver/collection.dart';
import 'package:routemaster/routemaster.dart';
import 'package:sentry_flutter/sentry_flutter.dart';

class ScopedDependency extends StatefulWidget {
  static _ScopedDependencyState of(BuildContext context, {bool root = false}) => root
      ? context.findRootAncestorStateOfType<_ScopedDependencyState>()!
      : context.findAncestorStateOfType<_ScopedDependencyState>()!;

  final String scopeName;
  final Widget child;

  ScopedDependency({Key? key, required this.scopeName, required this.child}) : super(key: ValueKey(scopeName));

  @override
  _ScopedDependencyState createState() => _ScopedDependencyState();
}

class _ScopedDependencyState extends State<ScopedDependency> {
  /// Accesses the cache from the widget tree itself
  T? fromSacco<T>() {
    if (pageState is T) {
      return pageState as T;
    } else {
      final message =
          '${pageState.runtimeType} is not of type $T. Did you forgot to add a _ScopedDependencyState above the wanted widget ?[$pageState}]';
      if (kDebugMode) {
        print(Exception(message));
      } else {
        Sentry.captureMessage(message);
      }
    }
  }

  // Cache the object that is accessed on the first time its accessed. This means not hitting the map every time the widget
  //builds and not accessing wrong objects in the transition from a page to another when the routes are changed
  late final Object pageState = getIt<Sacco>()(Routemaster.of(context).currentRoute.path);
  @override
  Widget build(BuildContext context) {
    return widget.child;
  }
}

/// Simple "Service locator" that evicts older entries from cache.
class Sacco {
  final LruMap<String, Object> map;

  Sacco({int? maximumSize = 100}) : map = LruMap(maximumSize: maximumSize);

  T call<T extends Object>(String? key) {
    if (key != null) {
      final value = map[key];
      if (value != null) return value as T;
    }
    throw Exception('Key $key not found in Sacco');
  }

  T get<T extends Object>([String? key]) => call<T>(key);

  bool isRegistered<T>([String? key]) {
    if (key != null) {
      return map[key] != null;
    }
    return map.values.whereType<T>().last != null;
  }

  void add<T extends Object>(String key, T instance) {
    map[key] = instance;
  }

  T? remove<T extends Object>(String key) {
    final removed = map.remove(key) as T?;
    return removed;
  }

  ///Deletes all entries from the map that its keys start with [prefix]
  void removePrefixed<T extends Object>(String prefix) {
    return map.removeWhere((key, value) => key.startsWith(prefix));
  }

  @override
  String toString() {
    final buffer = StringBuffer()
      ..write('${map.length}')
      ..writeAll(map.entries.map<String>((e) => '[${e.key}]=${e.value.runtimeType}'));
    return buffer.toString();
  }
}
