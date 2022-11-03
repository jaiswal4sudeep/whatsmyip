import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:whatsmyip/error_screen.dart';
import 'package:whatsmyip/ip_data_model.dart';
import 'package:http/http.dart' as http;
import 'package:whatsmyip/loading_screen.dart';

class HomeScreen extends HookWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    const baseURL = 'https://ipinfo.io?token=5b4f759a748189';
    List<IpDataModel> ipDataModel = [];

    Future<List<IpDataModel>> getDeviceIpAddress() async {
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
        ipDataModel.add(user);
        return ipDataModel;
      } else {
        return ipDataModel;
      }
    }

    void copyIpAddress() {
      Clipboard.setData(ClipboardData(text: ipDataModel[0].ip))
          .onError(
            (error, stackTrace) => Fluttertoast.showToast(
              msg: error.toString(),
            ),
          )
          .then(
            (value) => Fluttertoast.showToast(
              msg: 'Ip Address Copied!',
            ),
          );
    }

    useEffect(() {
      getDeviceIpAddress();
      return null;
    });
    return FutureBuilder(
      future: getDeviceIpAddress(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const LoadingScreen();
        } else if (snapshot.hasData) {
          return Scaffold(
            backgroundColor: const Color(0xFFD0D2C8),
            appBar: AppBar(
              backgroundColor: const Color(0xFF4F6C4E),
              centerTitle: true,
              title: const Text(
                'WhatsMyIp',
              ),
              actions: [
                IconButton(
                  onPressed: () {
                    getDeviceIpAddress();
                  },
                  icon: const Icon(
                    Icons.refresh_rounded,
                  ),
                ),
              ],
            ),
            body: Center(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15),
                child: InkWell(
                  onTap: () {
                    copyIpAddress();
                  },
                  child: Ink(
                    decoration: BoxDecoration(
                      color: const Color(0xFFD0D2C8),
                      borderRadius: BorderRadius.circular(5),
                      boxShadow: const [
                        BoxShadow(
                          color: Colors.grey,
                          offset: Offset(0.0, 1.0),
                          blurRadius: 6.0,
                        ),
                      ],
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(12.0),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Content(
                            text: 'IP Address: ${ipDataModel[0].ip}',
                          ),
                          Content(
                            text: 'City: ${ipDataModel[0].city}',
                          ),
                          Content(
                            text: 'Region: ${ipDataModel[0].region}',
                          ),
                          Content(
                            text: 'Country: ${ipDataModel[0].country}',
                          ),
                          Content(
                            text: 'Location: ${ipDataModel[0].loc}',
                          ),
                          Content(
                            text: 'Organition: ${ipDataModel[0].org}',
                          ),
                          Content(
                            text: 'Postal Code: ${ipDataModel[0].postal}',
                          ),
                          Content(
                            text: 'Timezone: ${ipDataModel[0].timezone}',
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),
          );
        } else {
          return const ErrorScreen();
        }
      },
    );
  }
}

class Content extends StatelessWidget {
  const Content({
    Key? key,
    required this.text,
  }) : super(key: key);

  final String text;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      textAlign: TextAlign.left,
      style: const TextStyle(
        color: Color(0xFF263525),
        fontWeight: FontWeight.w600,
        letterSpacing: 1.2,
        fontSize: 15,
      ),
    );
  }
}
