import 'package:json_annotation/json_annotation.dart';

part 'geo_model.g.dart';

@JsonSerializable()
class Geo extends Object {
  final String lat, lng;
  Geo({required this.lat, required this.lng});
  factory Geo.fromJson(Map<String, dynamic> json) => _$GeoFromJson(json);
  Map<String, dynamic> toJson() => _$GeoToJson(this);
}
