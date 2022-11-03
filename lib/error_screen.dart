import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_phoenix/flutter_phoenix.dart';

Widget getErrorScreen(FlutterErrorDetails error) {
  return const ErrorScreen();
}

class ErrorScreen extends HookWidget {
  const ErrorScreen({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle.dark.copyWith(
        statusBarColor: Colors.transparent,
        statusBarIconBrightness: Brightness.dark,
        statusBarBrightness: Brightness.dark,
      ),
    );
    return Scaffold(
      body: Container(
        color: const Color(0xFFD0D2C8),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                'An error occured, Please try again!',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Color(0xFF263525),
                  fontWeight: FontWeight.w600,
                  letterSpacing: 1.2,
                  fontSize: 15,
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              SizedBox(
                width: 200,
                height: 50,
                child: ElevatedButton.icon(
                  onPressed: () {
                    Phoenix.rebirth(context);
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFF4F6C4E),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12.0),
                    ),
                  ),
                  icon: const Icon(
                    Icons.refresh_rounded,
                    color: Color(0xFFD0D2C8),
                  ),
                  label: const Text(
                    'Try Again',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Color(0xFFD0D2C8),
                      fontWeight: FontWeight.w600,
                      letterSpacing: 1.2,
                      fontSize: 20,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
