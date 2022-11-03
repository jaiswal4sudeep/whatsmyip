import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:whatsmyip/models/ip_data_model.dart';
import 'package:whatsmyip/screens/error_screen.dart';
import 'package:whatsmyip/screens/home_scaffold.dart';
import 'package:whatsmyip/screens/loading_screen.dart';
import 'package:whatsmyip/services/get_device_ip_address.dart';

class HomeScreen extends HookWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    const baseURL = 'https://ipinfo.io?token=5b4f759a748189';
    final ipDataModel = useState<List<IpDataModel>>([]);
    return FutureBuilder(
      future: getDeviceIpAddress(baseURL, ipDataModel),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const LoadingScreen();
        } else if (snapshot.hasData) {
          var data = ipDataModel.value[0];
          return HomeScaffold(
            data: data,
          );
        } else {
          return const ErrorScreen();
        }
      },
    );
  }
}
