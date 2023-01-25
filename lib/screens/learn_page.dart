import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../utilities/colors.dart';
import '../utilities/constant.dart';

class LearnPage extends StatefulWidget {
  const LearnPage({Key? key}) : super(key: key);

  @override
  State<LearnPage> createState() => _LearnPageState();
}

class _LearnPageState extends State<LearnPage> {
  @override
  void initState() {
    super.initState();

    SystemChrome.setSystemUIOverlayStyle(
        const SystemUiOverlayStyle(statusBarColor: Colors.transparent));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0.9,
        backgroundColor: Colors.white,
        iconTheme: IconThemeData(
          color: Colors.black54,
        ),
        title: Text(
          "Learn Flutter 😎",
          style: TextStyle(color: Colors.black,fontSize: 25.0),
        ),
      ),
      body: Container(
          child: Column(
        children: [
          header(),
        ],
      )),
    );
  }

  Widget header() {
    return Padding(
      padding: EdgeInsets.all(16.0),
      child: Container(
        decoration: BoxDecoration(
            color: colorHeaderBackground,
            borderRadius: new BorderRadius.all(
              const Radius.circular(15.0),
            )),
        child: Row(
          children: [
            Expanded(
                child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Text(
                'Learn Flutter any way you want',
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.w500),
              ),
            )),
            Expanded(
              child: Image(
                image: AssetImage(imageHeader),
                height: 200,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
