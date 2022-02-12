part of 'user.dart';

class Address {
  final String street;
  final String suite;
  final String city;
  final String zipcode;

  Address(
    this.street,
    this.suite,
    this.city,
    this.zipcode
  );

  factory Address.fromJson(Map<String, dynamic> json) {
    return Address(
      json['street'],
      json['suite'],
      json['city'],
      json['zipcode']
    );
  }
}