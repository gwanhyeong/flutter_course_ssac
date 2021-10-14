import 'package:json_annotation/json_annotation.dart';

part 'seoul_subway_arrival_data.g.dart';

@JsonSerializable()
class SeoulSubwayArrivalData {
  String barvlDt;
  String subwayId;
  String trainLineNm;
  String subwayHeading;
  String arvlMsg2;
  String arvlMsg3;

  SeoulSubwayArrivalData(this.barvlDt, this.subwayId, this.trainLineNm,
      this.subwayHeading, this.arvlMsg2, this.arvlMsg3);

  factory SeoulSubwayArrivalData.fromJson(Map<String, dynamic> json) =>
      _$SeoulSubwayArrivalDataFromJson(json);
  Map<String, dynamic> toJson() => _$SeoulSubwayArrivalDataToJson(this);
}
