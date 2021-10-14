import 'package:json_annotation/json_annotation.dart';
import 'package:subway_info/model/seoul_subway_arrival_data.dart';

part 'seoul_subway_result.g.dart';

@JsonSerializable()
class SeoulSubwayResult {
  int? status;
  String? code;
  String? message;
  List<SeoulSubwayArrivalData>? realtimeArrivalList;

  SeoulSubwayResult(
      this.status, this.code, this.message, this.realtimeArrivalList);

  factory SeoulSubwayResult.fromJson(Map<String, dynamic> json) =>
      _$SeoulSubwayResultFromJson(json);
  Map<String, dynamic> toJson() => _$SeoulSubwayResultToJson(this);
}
