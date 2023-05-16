import 'package:json_annotation/json_annotation.dart';
import 'package:vexana/vexana.dart';

part 'matches.g.dart';

@JsonSerializable()
class Matches extends INetworkModel<Matches> {
  String? love;
  String? friendship;
  String? career;

  Matches({
    this.love,
    this.friendship,
    this.career,
  });

  @override
  Matches fromJson(Map<String, dynamic> json) => Matches.fromJson(json);

  factory Matches.fromJson(Map<String, dynamic> json) => _$MatchesFromJson(json);

  @override
  Map<String, dynamic>? toJson() => _$MatchesToJson(this);

  Matches copyWith({
    String? love,
    String? friendship,
    String? career,
  }) {
    return Matches(
      love: love ?? this.love,
      friendship: friendship ?? this.friendship,
      career: career ?? this.career,
    );
  }
}
