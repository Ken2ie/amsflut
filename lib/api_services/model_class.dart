import 'dart:convert';

List<UserModel> userModelFromJson(String str) =>
    List<UserModel>.from(json.decode(str).map((x) => UserModel.fromJson(x)));

String userModelToJson(List<UserModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class UserModel {
  UserModel({
    required this.id,
    required this.profilePicture,
    required this.username,
    // required this.email,
    required this.contact,
    required this.firstName,
    required this.lastName,
    required this.program,
    required this.year,
    required this.rep
  });

  String id;
  String profilePicture;
  String username;
  // String email;
  // Address address;
  String contact;
  String firstName;
  String lastName;
  String program;
  String year;
  bool rep;

  factory UserModel.fromJson(Map<String, dynamic> json) => UserModel(
        id: json["id"],
        profilePicture: json["profilePicture"],
        username: json["username"],
        // email: json["email"],
        // address: Address.fromJson(json["address"]),
        contact: json["contact"],
        firstName: json["firstName"],
        lastName: json["lastName"],
        program: json["program"],
        year: json["year"],
        rep: json["Rep"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "profilePicture": profilePicture,
        "username": username,
        // "email": email,
        // "address": address.toJson(),
        "contact": contact,
        "firstName": firstName,
        "lastName": lastName,
        "program": program,
        "year": year,
        "Rep": rep,
      };
}

class Address {
  Address({
    required this.street,
    required this.suite,
    required this.city,
    required this.zipcode,
    required this.geo,
  });

  String street;
  String suite;
  String city;
  String zipcode;
  Geo geo;

  factory Address.fromJson(Map<String, dynamic> json) => Address(
        street: json["street"],
        suite: json["suite"],
        city: json["city"],
        zipcode: json["zipcode"],
        geo: Geo.fromJson(json["geo"]),
      );

  Map<String, dynamic> toJson() => {
        "street": street,
        "suite": suite,
        "city": city,
        "zipcode": zipcode,
        "geo": geo.toJson(),
      };
}

class Geo {
  Geo({
    required this.lat,
    required this.lng,
  });

  String lat;
  String lng;

  factory Geo.fromJson(Map<String, dynamic> json) => Geo(
        lat: json["lat"],
        lng: json["lng"],
      );

  Map<String, dynamic> toJson() => {
        "lat": lat,
        "lng": lng,
      };
}

class Company {
  Company({
    required this.name,
    required this.catchPhrase,
    required this.bs,
  });

  String name;
  String catchPhrase;
  String bs;

  factory Company.fromJson(Map<String, dynamic> json) => Company(
        name: json["name"],
        catchPhrase: json["catchPhrase"],
        bs: json["bs"],
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "catchPhrase": catchPhrase,
        "bs": bs,
      };
}