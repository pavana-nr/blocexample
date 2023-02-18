import 'package:json_annotation/json_annotation.dart';

import 'address_model.dart';
import 'company_model.dart';

part 'user_model.g.dart';

@JsonSerializable()
class User {
  final String? name, userName, email, phone, website;
  Address address;
  Company company;

  User(
      {required this.name,
      required this.userName,
      required this.email,
      required this.phone,
      required this.website,
      required this.address,
      required this.company});

  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);

  Map<String, dynamic> toJson() => _$UserToJson(this);
}
