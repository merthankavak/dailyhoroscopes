import 'package:json_annotation/json_annotation.dart';
import 'package:vexana/vexana.dart';

part 'mood.g.dart';

@JsonSerializable()
class Mood extends INetworkModel<Mood> {
  String? vibe;
  String? success;

  Mood({
    this.vibe,
    this.success,
  });

  @override
  Mood fromJson(Map<String, dynamic> json) => Mood.fromJson(json);

  factory Mood.fromJson(Map<String, dynamic> json) => _$MoodFromJson(json);

  @override
  Map<String, dynamic>? toJson() => _$MoodToJson(this);

  Mood copyWith({
    String? vibe,
    String? success,
  }) {
    return Mood(
      vibe: vibe ?? this.vibe,
      success: success ?? this.success,
    );
  }
}
