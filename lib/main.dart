import 'package:flutter/material.dart';
import 'package:flutter_linkify/flutter_linkify.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:url_launcher/url_launcher.dart';

void main() {
  runApp(QonfuseeApp());
}

class QonfuseeApp extends StatefulWidget {
  @override
  _QonfuseeAppState createState() => _QonfuseeAppState();
}

class _QonfuseeAppState extends State<QonfuseeApp> {
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: Size(360, 690),
      builder: () => MaterialApp(
        title: "Qonfusee",
        home: WelcomePage(),
      ),
    );
  }
}

class WelcomePage extends StatelessWidget {
  final style1 = TextStyle(
    color: Colors.white,
    fontWeight: FontWeight.bold,
    fontSize: 40,
  );
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF1A1B26),
      body: Center(
        child: Container(
          width: MediaQuery.of(context).size.width / 2,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "WELCOME TO QONFUSEE",
                style: style1,
                textAlign: TextAlign.center,
              ),
              SizedBox(
                height: 45,
              ),
              Text(
                "Do you confused why you seeing our brand name?, YES WE TOO.\nwe converted our confusion into a THING directly.\nNo More Time for confusing it, Just do it.",
                style:
                    style1.copyWith(fontSize: 16, fontWeight: FontWeight.w300),
                textAlign: TextAlign.center,
              ),
              SizedBox(
                height: 30,
              ),
              Text(
                "And thats our vision.",
                style:
                    style1.copyWith(fontSize: 20, fontWeight: FontWeight.w300),
                textAlign: TextAlign.center,
              ),
              SizedBox(
                height: 30,
              ),
              Container(
                width: MediaQuery.of(context).size.width / 5,
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    _buildLink("Davi", "https://github.com/mr687"),
                    _buildLink("Arby", "https://github.com/arbyazra123"),
                    _buildLink("Ilham", "https://github.com/arbyazra123"),
                    _buildLink("Candra", "https://github.com/arbyazra123"),
                    _buildLink("Lukman", "https://github.com/arbyazra123"),
                  ],
                ),
              ),
              SizedBox(
                height: 100,
              ),
              _buildLink(
                  "source code", "https://github.com/qonfusee/l.qonfusee.com",
                  isSmall: true),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildLink(String name, String link, {bool isSmall = false}) {
    return InkWell(
      onTap: () => _launchURL(link),
      child: Text(
        name,
        style: style1.copyWith(
            fontSize: isSmall ? 10 : 16,
            fontWeight: FontWeight.w300,
            decoration: TextDecoration.underline),
        textAlign: TextAlign.center,
      ),
    );
  }

  void _launchURL(String url) async =>
      await canLaunch(url) ? await launch(url) : throw 'Could not launch $url';
}
