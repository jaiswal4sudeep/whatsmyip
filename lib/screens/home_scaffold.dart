import 'package:flutter/material.dart';
import 'package:whatsmyip/models/ip_data_model.dart';
import 'package:whatsmyip/services/copy_ip_address.dart';

class HomeScaffold extends StatelessWidget {
  const HomeScaffold({
    Key? key,
    required this.data,
  }) : super(key: key);

  final IpDataModel data;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFD0D2C8),
      appBar: AppBar(
        backgroundColor: const Color(0xFF4F6C4E),
        centerTitle: true,
        title: const Text(
          'WhatsMyIP',
        ),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15),
          child: InkWell(
            onTap: () {
              copyIpAddress(data.ip);
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
                      title: 'IP Address: ',
                      content: data.ip,
                    ),
                    Content(
                      title: 'City: ',
                      content: data.city,
                    ),
                    Content(
                      title: 'Region: ',
                      content: data.region,
                    ),
                    Content(
                      title: 'Country: ',
                      content: data.country,
                    ),
                    Content(
                      title: 'Location: ',
                      content: data.loc,
                    ),
                    Content(
                      title: 'Organition: ',
                      content: data.org,
                    ),
                    Content(
                      title: 'Postal Code: ',
                      content: data.postal,
                    ),
                    Content(
                      title: 'Timezone: ',
                      content: data.timezone,
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class Content extends StatelessWidget {
  const Content({
    Key? key,
    required this.title,
    required this.content,
  }) : super(key: key);

  final String title;
  final String content;

  @override
  Widget build(BuildContext context) {
    return RichText(
      textAlign: TextAlign.left,
      text: TextSpan(
        text: title,
        style: const TextStyle(
          color: Color(0xFF263525),
          fontWeight: FontWeight.w500,
          fontSize: 16,
        ),
        children: <TextSpan>[
          TextSpan(
            text: content,
            style: const TextStyle(
              color: Color(0xFF263525),
              fontWeight: FontWeight.bold,
              fontSize: 16,
            ),
          ),
        ],
      ),
    );
  }
}
