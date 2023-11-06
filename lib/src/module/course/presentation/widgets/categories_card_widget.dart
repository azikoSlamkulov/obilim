import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:obilim/src/core/data/remote/api/base_api.dart';

class CategoriesCardWidget extends StatelessWidget {
  const CategoriesCardWidget({
    required this.onTap,
    required this.imageUrl,
    required this.token,
    required this.name,
    super.key,
  });

  final VoidCallback onTap;
  final String imageUrl;
  final String token;
  final String name;

  @override
  Widget build(BuildContext context) {
    TextTheme textTheme = Theme.of(context).textTheme;
    return InkWell(
      onTap: onTap,
      child: Card(
        //color: Colors.blue,
        clipBehavior: Clip.hardEdge,
        //elevation: 10,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.0.r),
        ),

        //color: Colors.redAccent.shade100,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            CachedNetworkImage(
              imageUrl: '${BaseAPI.base}$imageUrl',
              httpHeaders: {
                "Authorization": "Bearer $token",
              },
              placeholder: (context, url) => Container(
                height: 110.h,
                width: 120.h,
                child: const Center(
                  child: CircularProgressIndicator(),
                ),
              ),
              imageBuilder: (context, imageProvider) => Container(
                height: 110.h,
                width: 120.h,
                decoration: BoxDecoration(
                  //borderRadius: BorderRadius.circular(10),
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(10.r),
                    bottomLeft: Radius.circular(10.r),
                  ),

                  image: DecorationImage(
                    image: imageProvider,
                    fit: BoxFit.fill,
                  ),
                ),
              ),
              errorWidget: (context, url, error) => Icon(Icons.error),
              // errorWidget: (context, url, error) => Container(
              //   height: 110.h,
              //   width: 120.h,
              //   decoration: BoxDecoration(
              //     borderRadius: BorderRadius.circular(10),
              //     color: Colors.red,
              //     boxShadow: const [
              //       BoxShadow(
              //         color: Colors.white,
              //         spreadRadius: 3,
              //       ),
              //     ],
              //   ),
              // ),
            ),
            Expanded(
              child: Center(
                child: Text(
                  name,
                  style: textTheme.bodyLarge,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
