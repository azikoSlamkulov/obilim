import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:obilim/src/config/routes/router_utils.dart';
import 'package:obilim/src/config/util/app_constants/app_constants.dart';

import '../../../../config/util/app_widgets/bar/custom_app_bar.dart';
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
      // appBar: AppBar(
      //   title: Text('Course $courseNumber'),
      // ),
      // appBar: CustomAppBar(
      //   title: 'Course $courseNumber',
      // ),
      appBar: AppBar(
        title: Text('Course $courseNumber'),
        centerTitle: true,
      ),
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
                    //     builder: (context) => const LessonListView(),
                    //   ),
                    // );
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
