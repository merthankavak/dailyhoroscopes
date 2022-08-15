import 'package:equatable/equatable.dart';
import 'package:hive_flutter/adapters.dart';

import '../../core/constants/cache/cache_constants.dart';

part 'app_cache_model.g.dart';

@HiveType(typeId: CacheConstants.appCacheTypeId)
class AppCacheModel extends Equatable {
  @HiveField(0)
  final int? id;
  @HiveField(1)
  final String? name;
  @HiveField(2)
  final String? birthDate;
  @HiveField(3, defaultValue: true)
  final bool? isFirstInit;
  @HiveField(4)
  final String? horoscopeSign;

  const AppCacheModel({this.id, this.name, this.birthDate, this.isFirstInit, this.horoscopeSign});

  AppCacheModel copyWith({
    int? id,
    String? name,
    String? birthDate,
    bool? isFirstInit,
    String? horoscopeSign,
  }) =>
      AppCacheModel(
        id: id ?? this.id,
        name: name ?? this.name,
        birthDate: birthDate ?? this.birthDate,
        isFirstInit: isFirstInit ?? this.isFirstInit,
        horoscopeSign: horoscopeSign ?? this.horoscopeSign,
      );

  @override
  List<Object?> get props => [id, name, birthDate, isFirstInit, horoscopeSign];
}
