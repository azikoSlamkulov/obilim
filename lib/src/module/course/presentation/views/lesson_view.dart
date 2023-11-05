import 'package:flutter/material.dart';
import 'package:obilim/src/config/util/app_constants/text_styles/text_styles.dart';

import '../../../../config/util/app_widgets/bar/custom_app_bar.dart';
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
      // appBar: CustomAppBar(
      //   title: 'Lesson $lessonNumber',
      // ),
      body: Center(
        child: Text(
          'Lesson $lessonNumber',
          //style: AppTextStyles.black16,
          style: Theme.of(context).textTheme.displaySmall,
        ),
      ),
    );
  }
}
