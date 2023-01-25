import 'package:easy_web_view/easy_web_view.dart';
import 'package:flutter/material.dart';
import '../utilities/colors.dart';

class LearnPageDetail extends StatelessWidget {
  String detailPageUrl;
  String detailImage;

  LearnPageDetail({required this.detailPageUrl, required this.detailImage});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Detail'),
        flexibleSpace: Image(
          image: NetworkImage(detailImage),
          fit: BoxFit.cover,
        ),
        backgroundColor: colorAppBarBackground,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            child: EasyWebView(
              src: detailPageUrl,
              isMarkdown: false,
              convertToWidgets: false,
              // width: 100,
              // height: 100,
            ),
          )
        ],
      ),
    );
  }
}
