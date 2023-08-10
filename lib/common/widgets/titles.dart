import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:todo_app_withapi/common/utils/constants.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:todo_app_withapi/common/widgets/height_spacer.dart';
import 'package:todo_app_withapi/common/widgets/reusable_text.dart';
import 'package:todo_app_withapi/common/widgets/text_style.dart';
import 'package:todo_app_withapi/common/widgets/width_spacer.dart';

class BottomTitles extends StatelessWidget {
  const BottomTitles(
      {super.key, required this.text, required this.text2, this.clr});
  final String text;
  final String text2;
  final Color? clr;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: AppConst.kWidth,
      child: Padding(
        padding: EdgeInsets.all(8.h),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Consumer(
              builder: (context, ref, child) {
                return Container(
                  height: 80,
                  width: 5,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(
                        Radius.circular(AppConst.kRadius),
                      ),

                      /// TODO: Add dynamic color
                      color: AppConst.kGreen),
                );
              },
            ),
            const WidthSpacer(width: 15),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ReusableText(
                    text: text,
                    style: appStyle(24, AppConst.kLight, FontWeight.bold),
                  ),
                  const HeightSpacer(height: 10),
                  ReusableText(
                    text: text2,
                    style: appStyle(16, AppConst.kLight, FontWeight.w400),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
