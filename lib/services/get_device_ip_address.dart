import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:whatsmyip/models/ip_data_model.dart';
import 'package:http/http.dart' as http;

Future<List<IpDataModel>> getDeviceIpAddress(
  String baseURL,
  ValueNotifier<List<IpDataModel>> ipDataModel,
) async {
  final response = await http.get(
    Uri.parse(baseURL),
  );
  var data = jsonDecode(response.body);
  if (response.statusCode == 200) {
    IpDataModel user = IpDataModel(
      ip: data["ip"].toString(),
      city: data["city"].toString(),
      region: data["region"].toString(),
      country: data["country"].toString(),
      loc: data["loc"].toString(),
      org: data["org"].toString(),
      postal: data["postal"].toString(),
      timezone: data["timezone"].toString(),
    );
    ipDataModel.value.add(user);
    return ipDataModel.value;
  } else {
    return ipDataModel.value;
  }
}
