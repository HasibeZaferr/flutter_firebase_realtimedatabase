import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../models/lesson.dart';
import '../network_utils/firebase/lesson_list_data_manager.dart';
import '../utilities/colors.dart';
import '../utilities/constant.dart';

class LearnPage extends StatefulWidget {
  const LearnPage({Key? key}) : super(key: key);

  @override
  State<LearnPage> createState() => _LearnPageState();
}

class _LearnPageState extends State<LearnPage> {
  List<Lesson> lessonList = [];

  @override
  void initState() {
    super.initState();

    SystemChrome.setSystemUIOverlayStyle(
        const SystemUiOverlayStyle(statusBarColor: Colors.transparent));
    getLessonList(lessonList).whenComplete(() => {setState(() {})});
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
          style: TextStyle(color: Colors.black, fontSize: 25.0),
        ),
      ),
      body: SingleChildScrollView(
        child: Container(
            child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            header(),
            Padding(
              padding: const EdgeInsets.only(top: 10.0, left: 16.0),
              child: Text(
                '17 Days of Flutter',
                style: TextStyle(
                  fontSize: 22.0,
                  fontWeight: FontWeight.w600,
                ),
                textAlign: TextAlign.left,
              ),
            ),
            lessonList != null
                ? Padding(
                    padding:
                        EdgeInsets.symmetric(horizontal: 16.0, vertical: 10.0),
                    child: ListView.builder(
                      physics: const NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      itemCount: lessonList.length,
                      itemBuilder: (context, index) {
                        return lessonListItem(lessonList[index]);
                      },
                    ),
                  )
                : Container(),
          ],
        )),
      ),
    );
  }

  Widget header() {
    return Padding(
      padding: EdgeInsets.all(16.0),
      child: Column(
        children: [
          Container(
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
        ],
      ),
    );
  }

  Widget lessonListItem(Lesson lesson) {
    return GestureDetector(
      onTap: () {},
      child: Column(
        children: [
          Card(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15.0),
              //set border radius more than 50% of height and width to make circle
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.only(
                      topRight: Radius.circular(15.0),
                      topLeft: Radius.circular(15.0)),
                  child: Image(
                    fit: BoxFit.fitWidth,
                    width: double.infinity,
                    image: NetworkImage(lesson.lessonCoverImageUrl),
                    height: 150,
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(16.0),
                  child: Text(
                    lesson.lessonName,
                    textAlign: TextAlign.left,
                    style:
                        TextStyle(fontSize: 16.0, fontWeight: FontWeight.w500),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(16.0),
                  child: Row(
                    children: [
                      Container(
                        decoration: BoxDecoration(
                          color: colorDayBackground,
                          borderRadius: BorderRadius.circular(7.0),
                        ),
                        width: 80.0,
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(lesson.lessonDayText,style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.w600,color: colorDayText,),textAlign: TextAlign.center,),
                        ),
                      ),

                      Expanded(
                          child: Image.asset(
                            iconListDetail,
                            height: 20,
                            alignment: Alignment.bottomRight,
                          ),),
                    ],
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
            height: 10.0,
          )
        ],
      ),
    );
  }
}
