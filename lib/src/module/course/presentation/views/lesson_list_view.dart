import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:obilim/src/config/routes/router_utils.dart';
import 'package:obilim/src/config/util/app_constants/app_constants.dart';

import '../../../../config/util/app_widgets/bar/custom_app_bar.dart';
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
      // appBar: CustomAppBar(
      //   title: 'Chapter $chapterNumber',
      // ),
      //backgroundColor: AppColors.bgColorMain,
      body: Center(
        child: Padding(
          padding: REdgeInsets.all(10.0),
          child: ListView.builder(
            itemCount: 5,
            itemBuilder: (BuildContext context, int index) {
              return Card(
                child: ListTile(
                  //leading: const Icon(Icons.list),
                  // trailing: const Text(
                  //   "GFG",
                  //   style: TextStyle(color: Colors.green, fontSize: 15),
                  // ),
                  onTap: () {
                    // Navigator.push(
                    //   context,
                    //   MaterialPageRoute(
                    //     builder: (context) => LessonView(
                    //       lessonNumber: index.toString(),
                    //     ),
                    //   ),
                    // );
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
                    //style: AppTextStyles.black14,
                    style: Theme.of(context).textTheme.bodyMedium,
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
