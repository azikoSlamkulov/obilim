import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:obilim/src/util/app_constants/app_constants.dart';

import '../../module/auth/presentation/logic/auth/auth_bloc.dart';
import '../../module/profile/presentation/views/users_view.dart';

class MainDrawer extends StatelessWidget {
  const MainDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Drawer(
        elevation: 5.0,
        child: ListView(
          children: [
            Container(
              //color: Colors.blueAccent,
              //color: AppBarTheme.of(context).backgroundColor,
              child: const Center(
                child: DrawerHeader(
                  padding: EdgeInsets.zero,
                  decoration: BoxDecoration(),
                  child: Text('fdfd'),
                  //child: Image.asset('assets/images/load/logo.png')
                ),
              ),
            ),
            Card(
              child: ListTile(
                title: const Text(
                  'Users',
                  //style: AppTextStyles.black14,
                ),
                trailing: const Icon(Icons.keyboard_arrow_right),
                onTap: () {
                  Navigator.pop(context);
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const UsersView(),
                    ),
                  );
                },
              ),
            ),
            Card(
              child: ListTile(
                title: const Text(
                  'Выход',
                  //style: AppTextStyles.black14,
                ),
                trailing: const Icon(Icons.keyboard_arrow_right),
                onTap: () {
                  BlocProvider.of<AuthBloc>(context).add(
                    SignOutEvent(),
                  );
                },
              ),
            ),
            // Card(
            //   child: ListTile(
            //     title: const Text('Сообщение'),
            //     trailing: const Icon(Icons.keyboard_arrow_right),
            //     onTap: () {
            //       Navigator.pop(context);
            //       showDialog(
            //         context: context,
            //         builder: (BuildContext context) {
            //           return AlertDialogWidget(
            //             title: 'Сообщение',
            //             textFormFieldOne: CustomTextFormField(
            //               onChanged: (value) {
            //                 //provider.countTextController = value;
            //               },
            //               textEditingController:
            //                   provider.messageTextController,
            //               autofocus: true,
            //               hintText: 'Сообщение',
            //             ),
            //             function: () {
            //               //Navigator.pop(context);
            //               provider.getMessage(context);
            //               // ShowSnackBar().showSnackBar(
            //               //   context,
            //               //   Text(
            //               //       'Другое: ${provider.othersTextController.text}'),
            //               // );
            //             },
            //           );
            //         },
            //       );
            //     },
            //   ),
            // ),
            // Card(
            //   child: ListTile(
            //     title: const Text('Расход'),
            //     trailing: const Icon(Icons.keyboard_arrow_right),
            //     onTap: () {
            //       // Navigator.pop(context);
            //       // showDialog(
            //       //   context: context,
            //       //   builder: (BuildContext context) {
            //       //     return AlertDialogWidget();
            //       //   },
            //       // );
            //     },
            //   ),
            // ),
            // Card(
            //   child: ExpansionTile(
            //     //leading: ,
            //     title: const Text('План'),
            //     children: [
            //       ListTile(
            //         leading: const SizedBox(width: 50),
            //         title: const Text('Дроугое'),
            //         trailing: Text('${provider.othersTextController.text}'),
            //         onTap: () {
            //           Navigator.pop(context);
            //           showDialog(
            //             context: context,
            //             builder: (BuildContext context) {
            //               return AlertDialogWidget(
            //                 title: 'Другое число',
            //                 numberTextFormFieldOne: CustomTextFormField(
            //                   onChanged: (value) {
            //                     //provider.countTextController = value;
            //                   },
            //                   keyboardType: TextInputType.number,
            //                   textEditingController:
            //                       provider.othersTextController,
            //                   autofocus: true,
            //                   hintText: 'Число',
            //                 ),
            //                 function: () {
            //                   //Navigator.pop(context);
            //                   provider.getOthers(context);
            //                   ShowSnackBar().showSnackBar(
            //                     context,
            //                     Text(
            //                         'Другое: ${provider.othersTextController.text}'),
            //                   );
            //                 },
            //               );
            //             },
            //           );
            //         },
            //       ),
            //       ListTile(
            //         title: const Text('Выключено'),
            //         leading: Radio(
            //             value: Planes.planeFalse,
            //             groupValue: provider.plane,
            //             onChanged: (Planes value) {
            //               provider.addPlane(value);
            //             }),
            //       ),
            //       ListTile(
            //         title: const Text('План - 1700'),
            //         leading: Radio(
            //             value: Planes.plane1700,
            //             groupValue: provider.plane,
            //             onChanged: (Planes value) {
            //               provider.addPlane(value);
            //             }),
            //       ),
            //       ListTile(
            //         title: const Text('План - 800'),
            //         leading: Radio(
            //             value: Planes.plane700,
            //             groupValue: provider.plane,
            //             onChanged: (Planes value) {
            //               provider.addPlane(value);
            //             }),
            //       ),
            //     ],
            //   ),
            // )
          ],
        ),
      ),
    );
  }
}
