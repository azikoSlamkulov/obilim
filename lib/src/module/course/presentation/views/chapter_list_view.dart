import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:obilim/src/config/routes/router_utils.dart';

import '../../../../config/drawer.dart';

class ChapterListView extends StatelessWidget {
  const ChapterListView({
    required this.courseNumber,
    super.key,
  });

  final String courseNumber;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      endDrawer: const MainDrawer(),
      appBar: AppBar(
        title: Text('Course $courseNumber'),
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
                      AppPage.lessonList.toName,
                      pathParameters: {
                        'courseNumber': courseNumber,
                        'chapterNumber': index.toString(),
                      },
                    );
                  },
                  title: Text(
                    "Chapter $index",
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
