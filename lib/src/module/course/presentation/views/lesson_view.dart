import 'package:flutter/material.dart';

import '../../../../config/drawer.dart';

class LessonView extends StatelessWidget {
  const LessonView({
    required this.courseNumber,
    required this.chapterNumber,
    required this.lessonNumber,
    super.key,
  });

  final String courseNumber;
  final String chapterNumber;
  final String lessonNumber;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      endDrawer: const MainDrawer(),
      appBar: AppBar(
        title: Text('Lesson $lessonNumber'),
        centerTitle: true,
      ),
      body: Center(
        child: Text(
          'Lesson $lessonNumber',
          //style: Theme.of(context).textTheme.displaySmall,
        ),
      ),
    );
  }
}
