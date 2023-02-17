import 'package:json_annotation/json_annotation.dart';

part 'address_model.g.dart';

@JsonSerializable()
class Address extends Object {
  final String street, suite, city, zipcode;
  Address(
      {required this.city,
      required this.street,
      required this.suite,
      required this.zipcode});

  factory Address.fromJson(Map<String, dynamic> json) =>
      _$AddressFromJson(json);
  Map<String, dynamic> toJson() => _$AddressToJson(this);
}
