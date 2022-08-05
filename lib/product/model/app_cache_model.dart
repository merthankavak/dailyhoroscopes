import 'package:hive_flutter/adapters.dart';

import '../../core/constants/cache/cache_constants.dart';

part 'app_cache_model.g.dart';

@HiveType(typeId: CacheConstants.appCacheTypeId)
class AppCacheModel {
  @HiveField(0)
  int? id;
  @HiveField(1)
  String? name;
  @HiveField(2)
  String? birthDate;
  @HiveField(3, defaultValue: true)
  bool? isFirstInit;
  @HiveField(4)
  String? horoscopeSign;

  AppCacheModel({this.id, this.name, this.birthDate, this.isFirstInit, this.horoscopeSign});
}
