import 'dart:convert';
import 'package:http/http.dart' as http;

part 'address.dart';
part 'company.dart';

class User {
  final int id;
  final String name;
  final String email;
  final Address address;
  final Company company;

  User(
    this.id,
    this.name,
    this.email,
    this.address,
    this.company
  );

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      json['id'],
      json['name'],
      json['email'],
      Address.fromJson(json['address']),
      Company.fromJson(json['company'])
    );
  }
}