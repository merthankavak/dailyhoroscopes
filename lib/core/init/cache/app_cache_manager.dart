import 'package:hive_flutter/hive_flutter.dart';

import '../../../product/model/app_cache_model.dart';
import '../../constants/cache/cache_constants.dart';
import 'cache_manager_interface.dart';

class AppCacheManager extends CacheManagerInterface<AppCacheModel> {
  AppCacheManager(super.boxName);

  @override
  Future<void> addAllItems(List<AppCacheModel> items) async => await box?.addAll(items);

  @override
  Future<void> addItem(AppCacheModel item) async => await box?.add(item);

  @override
  Future<void> deleteAllItems(List<AppCacheModel> items) async => await box?.deleteAll(items);

  @override
  Future<void> deleteAtItem(int index) async => await box?.deleteAt(index);

  @override
  Future<void> deleteItem(String boxName) async => await box?.delete(boxName);

  @override
  List<AppCacheModel>? getAllItems() => box?.values.toList();

  @override
  AppCacheModel? getAtItem(int index) => box?.getAt(index);

  @override
  AppCacheModel? getItem(String boxName) => box?.get(boxName);

  @override
  Future<void> putAllItems(List<AppCacheModel> items) async =>
      await box?.putAll(Map.fromEntries(items.map((e) => MapEntry(e.id, e))));

  @override
  Future<void> putAtItem(int index, AppCacheModel item) async => await box?.putAt(index, item);

  @override
  Future<void> putItem(String boxName, AppCacheModel item) async => await box?.put(boxName, item);

  @override
  Future<void> clear() async => await box!.clear();

  @override
  void registerAdapters() {
    if (!Hive.isAdapterRegistered(CacheConstants.appCacheTypeId)) {
      Hive.registerAdapter(AppCacheModelAdapter());
    }
  }
}
