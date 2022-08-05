import 'package:hive_flutter/hive_flutter.dart';

abstract class CacheManagerInterface<T> {
  final String _boxName;
  Box<T>? box;

  CacheManagerInterface(this._boxName);

  void registerAdapters();

  Future<void> init() async {
    registerAdapters();
    if (!(box?.isOpen ?? false)) {
      box = await Hive.openBox(_boxName);
    }
  }

  Future<void> addItem(T item);
  Future<void> addAllItems(List<T> items);

  T? getItem(String boxName);
  T? getAtItem(int index);
  List<T>? getAllItems();

  Future<void> putItem(String boxName, T item);
  Future<void> putAtItem(int index, T item);
  Future<void> putAllItems(List<T> items);

  Future<void> deleteItem(String boxName);
  Future<void> deleteAtItem(int index);
  Future<void> deleteAllItems(List<T> items);
  Future<void> clear();
}
