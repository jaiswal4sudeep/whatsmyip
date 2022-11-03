import 'dart:convert';

IpDataModel ipDataModelFromJson(String str) =>
    IpDataModel.fromJson(json.decode(str));

class IpDataModel {
  IpDataModel({
    required this.ip,
    required this.city,
    required this.region,
    required this.country,
    required this.loc,
    required this.org,
    required this.postal,
    required this.timezone,
  });

  String ip;
  String city;
  String region;
  String country;
  String loc;
  String org;
  String postal;
  String timezone;

  factory IpDataModel.fromJson(Map<String, dynamic> json) => IpDataModel(
        ip: json["ip"],
        city: json["city"],
        region: json["region"],
        country: json["country"],
        loc: json["loc"],
        org: json["org"],
        postal: json["postal"],
        timezone: json["timezone"],
      );
}
