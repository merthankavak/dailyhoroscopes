import 'package:hive_flutter/hive_flutter.dart';

abstract class CacheManagerInterface<T> {
  final String key;
  Box<T>? box;

  CacheManagerInterface(this.key);

  Future<void> init() async {
    registerAdapters();
    if (!(box?.isOpen ?? false)) {
      box = await Hive.openBox(key);
    }
  }

  void registerAdapters();
  Future<void> addItem(T item);
  Future<void> addAllItems(List<T> items);

  T? getItem(String key);
  T? getAtItem(int index);
  List<T>? getAllItems();

  Future<void> putItem(String key, T item);
  Future<void> putAtItem(int index, T item);
  Future<void> putAllItems(List<T> items);

  Future<void> deleteItem(String key);
  Future<void> deleteAtItem(int index);
  Future<void> deleteAllItems(List<T> items);
  Future<void> clear();
}
