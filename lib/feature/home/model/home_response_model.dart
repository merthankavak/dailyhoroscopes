import 'package:json_annotation/json_annotation.dart';
import 'package:vexana/vexana.dart';

part 'home_response_model.g.dart';

@JsonSerializable()
class HomeResponseModel extends INetworkModel<HomeResponseModel> {
  @JsonKey(name: 'date_range')
  final String? dateRange;
  @JsonKey(name: 'current_date')
  final String? currentDate;
  final String? description;
  final String? compatibility;
  final String? mood;
  final String? color;
  @JsonKey(name: 'lucky_number')
  final String? luckyNumber;
  @JsonKey(name: 'lucky_time')
  final String? luckyTime;

  HomeResponseModel(
      {this.dateRange,
      this.currentDate,
      this.description,
      this.compatibility,
      this.mood,
      this.color,
      this.luckyNumber,
      this.luckyTime});

  @override
  HomeResponseModel fromJson(Map<String, dynamic> json) {
    return _$HomeResponseModelFromJson(json);
  }

  @override
  Map<String, dynamic>? toJson() {
    return _$HomeResponseModelToJson(this);
  }
}
