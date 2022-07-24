import 'package:flutter/material.dart';
import 'package:flutter_linkify/flutter_linkify.dart';
import 'package:url_launcher/url_launcher_string.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Linkify',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Scaffold(
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                height: 100,
                width: 100,
                decoration: BoxDecoration(
                  image: const DecorationImage(
                    image: AssetImage(
                      "assets/aliebadi_logo.jpg",
                    ),
                  ),
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
              const SizedBox(height: 50),
              Linkify(
                onOpen: (link) async {
                  if (await canLaunchUrlString(link.url)) {
                    await launchUrlString(link.url);
                  } else {
                    throw 'Could not launch $link';
                  }
                },
                text: "INSTAGRAM: https://www.instagram.com/eb.app/",
              ),
              const SizedBox(height: 20),
              Linkify(
                onOpen: (link) async {
                  if (await canLaunchUrlString(link.url)) {
                    await launchUrlString(link.url);
                  } else {
                    throw 'Could not launch $link';
                  }
                },
                text:
                    "GITHUB: https://github.com/aliebdev/flutter-linkify-example",
              ),
            ],
          ),
        ),
      ),
    );
  }
}
