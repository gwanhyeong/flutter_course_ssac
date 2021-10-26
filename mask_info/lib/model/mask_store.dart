import 'package:json_annotation/json_annotation.dart';

part 'mask_store.g.dart';

class MaskStoreStock {
  static const plenty = 'plenty';
  static const some = 'some';
  static const few = 'few';
  static const empty = 'empty';
  static const none = 'empty';
}

@JsonSerializable()
class MaskStore {
  final String addr;
  final String code;
  final String name;
  final String type;
  final double lat;
  final double lng;

  @JsonKey(name: 'created_at')
  final String? createdAt;
  @JsonKey(name: 'remain_stat')
  final String? remainStat;
  @JsonKey(name: 'stock_at')
  final String? stockAt;

  MaskStore(this.addr, this.code, this.name, this.type, this.lat, this.lng,
      this.createdAt, this.remainStat, this.stockAt);

  factory MaskStore.fromJson(Map<String, dynamic> json) =>
      _$MaskStoreFromJson(json);

  Map<String, dynamic> toJson() => _$MaskStoreToJson(this);
}
