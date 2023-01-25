import 'dart:convert';
import 'package:http/http.dart' as http;
import '../../models/lesson.dart';

Future<void> getLessonList(List<Lesson> lessonList) async {
  var url = Uri.parse('https://learn-flutter-22998-default-rtdb.firebaseio.com/lessonList.json?');
  final response = await http.get(url);
  final extractedData = json.decode(response.body) as Map<String, dynamic>;

  extractedData.forEach((lessonId, lesson) {
    lessonList.add(
      Lesson(
        lessonCoverImageUrl: lesson['lessonCoverImageUrl'],
        lessonDayText: lesson['lessonDayText'],
        lessonDetailLink: lesson['lessonDetailLink'],
        lessonName: lesson['lessonName'],
      ),
    );
  });
}