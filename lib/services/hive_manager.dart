import 'package:hive/hive.dart';

abstract class HiveManager<T> {
  String get boxName;

  T? getIfSaved(T m) {
    final box = Hive.box<T>(boxName);
    return box.values.firstWhere(
        (test) => (test as dynamic)?.id == (m as dynamic)?.id,
        orElse: () => m);
  }

  bool isSaved(T m) {
    final box = Hive.box<T>(boxName);
    return box.values.contains(m);
  }
}
