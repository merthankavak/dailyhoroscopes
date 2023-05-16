import 'package:json_annotation/json_annotation.dart';
import 'package:vexana/vexana.dart';

import 'matches.dart';
import 'mood.dart';

part 'horoscope.g.dart';

@JsonSerializable()
class Horoscope extends INetworkModel<Horoscope> {
  @JsonKey(name: 'current_date')
  String? currentDate;
  String? description;
  @JsonKey(name: 'date_range')
  String? dateRange;
  Matches? matches;
  Mood? mood;

  Horoscope({
    this.currentDate,
    this.description,
    this.dateRange,
    this.matches,
    this.mood,
  });

  @override
  Horoscope fromJson(Map<String, dynamic> json) => Horoscope.fromJson(json);

  factory Horoscope.fromJson(Map<String, dynamic> json) => _$HoroscopeFromJson(json);

  @override
  Map<String, dynamic>? toJson() => _$HoroscopeToJson(this);
}
