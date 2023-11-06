import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:obilim/src/config/routes/router_utils.dart';

import '../../../../config/drawer.dart';

class LessonListView extends StatelessWidget {
  const LessonListView({
    required this.courseNumber,
    required this.chapterNumber,
    super.key,
  });

  final String courseNumber;
  final String chapterNumber;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      endDrawer: const MainDrawer(),
      appBar: AppBar(
        title: Text('Chapter $chapterNumber'),
        centerTitle: true,
      ),
      body: Center(
        child: Padding(
          padding: REdgeInsets.all(10.0),
          child: ListView.builder(
            itemCount: 5,
            itemBuilder: (BuildContext context, int index) {
              return Card(
                child: ListTile(
                  onTap: () {
                    context.goNamed(
                      AppPage.lesson.toName,
                      pathParameters: {
                        'courseNumber': courseNumber,
                        'chapterNumber': index.toString(),
                        'lessonNumber': index.toString(),
                      },
                    );
                  },
                  title: Text(
                    "Lesson $index",
                    //style: Theme.of(context).textTheme.bodyMedium,
                  ),
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
