import 'package:flutter/material.dart';

import '../../../../config/util/app_constants/app_constants.dart';
import '../../../../config/util/app_widgets/bar/custom_app_bar.dart';
import '../../../../config/drawer.dart';

class HomeView extends StatelessWidget {
  const HomeView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: CustomAppBar(
      //   title: 'Home View',
      // ),
      appBar: AppBar(
        title: Text('Home View'),
        centerTitle: true,
      ),
      endDrawer: const MainDrawer(),
      //backgroundColor: AppColors.bgColorMain,
      body: Center(
        child: Text(
          'Home View',
          //style: AppTextStyles.black16,
        ),
      ),
    );
  }
}
