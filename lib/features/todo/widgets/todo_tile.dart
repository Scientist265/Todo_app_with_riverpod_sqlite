import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:todo_app_withapi/common/utils/constants.dart';
import 'package:todo_app_withapi/common/widgets/height_spacer.dart';
import 'package:todo_app_withapi/common/widgets/reusable_text.dart';
import 'package:todo_app_withapi/common/widgets/text_style.dart';
import 'package:todo_app_withapi/common/widgets/width_spacer.dart';

class TodoTile extends StatelessWidget {
  const TodoTile(
      {super.key,
      this.color,
      this.title,
      this.description,
      this.start,
      this.end,
      this.editWidget,
      this.delete,
      this.switcher});
  final Color? color;
  final String? title;
  final String? description;
  final String? start;
  final String? end;
  final Widget? editWidget;
  final void Function()? delete;
  final Widget? switcher;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(bottom: 8.h),
      child: Stack(
        children: [
          Container(
            padding: EdgeInsets.all(8.h),
            width: AppConst.kWidth,
            decoration: BoxDecoration(
                color: AppConst.kGreyLight,
                borderRadius:
                    BorderRadius.all(Radius.circular(AppConst.kRadius))),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Container(
                      height: 80,
                      width: 5,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.all(
                            Radius.circular(AppConst.kRadius),
                          ),

                          /// TODO: Add dynamic color
                          color: color ?? AppConst.kRed),
                    ),
                    const WidthSpacer(width: 15),
                    Padding(
                      padding: EdgeInsets.all(8.h),
                      child: SizedBox(
                        width: AppConst.kWidth * 0.6,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            ReusableText(
                              text: title ?? "Title",
                              style: appStyle(
                                18,
                                AppConst.kLight,
                                FontWeight.bold,
                              ),
                            ),
                            const HeightSpacer(height: 3),
                            ReusableText(
                              text: description ?? "Description of Todo",
                              style: appStyle(
                                12,
                                AppConst.kLight,
                                FontWeight.w400,
                              ),
                            ),
                            const HeightSpacer(height: 10),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Container(
                                  width: AppConst.kWidth * 0.3,
                                  height: 25.h,
                                  decoration: BoxDecoration(
                                      border: Border.all(
                                        width: 0.3,
                                        color: AppConst.kGreyDk,
                                      ),
                                      borderRadius: BorderRadius.all(
                                        Radius.circular(AppConst.kRadius),
                                      ),
                                      color: AppConst.kBkDark),
                                  child: Center(
                                    child: ReusableText(
                                      text: "$start | $end",
                                      style: appStyle(
                                        12,
                                        AppConst.kLight,
                                        FontWeight.normal,
                                      ),
                                    ),
                                  ),
                                ),
                                const WidthSpacer(width: 20),
                                Row(
                                  children: [
                                    SizedBox(
                                      child: editWidget,
                                    ),
                                    const WidthSpacer(width: 20),
                                    GestureDetector(
                                      onTap: delete,
                                      child: const Icon(
                                        MaterialCommunityIcons.delete_circle,
                                      ),
                                    )
                                  ],
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
                Container(
                  padding: EdgeInsets.only(bottom: 0.h),
                  child: switcher,
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
