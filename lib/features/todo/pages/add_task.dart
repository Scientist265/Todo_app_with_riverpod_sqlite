import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:todo_app_withapi/common/utils/constants.dart';
import 'package:todo_app_withapi/common/widgets/custom_btn.dart';
import 'package:todo_app_withapi/common/widgets/custom_text_field.dart';
import 'package:todo_app_withapi/common/widgets/height_spacer.dart';

import '../../../common/widgets/text_style.dart';

class AddTask extends ConsumerStatefulWidget {
  const AddTask({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _AddTaskState();
}

class _AddTaskState extends ConsumerState<AddTask> {
  final titleController = TextEditingController();
  final descController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20.w),
        child: ListView(
          children: [
            HeightSpacer(height: 20),
            CustomTextField(
              hintText: 'Title',
              controller: titleController,
              hintStyle: appStyle(16, AppConst.kBkDark, FontWeight.w600),
            ),
            HeightSpacer(height: 20),
            CustomTextField(
              hintText: 'Description',
              controller: descController,
              hintStyle: appStyle(16, AppConst.kBkDark, FontWeight.w600),
            ),
            HeightSpacer(height: 20),
            CustomOtlnBtn(
              color2: AppConst.kLight,
              height: 52.h,
              text: 'Set Date',
              width: AppConst.kWidth,
              color: AppConst.kBkDark,
            ),
            HeightSpacer(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                CustomOtlnBtn(
                  color2: AppConst.kLight,
                  height: 52.h,
                  text: 'Start  Timee',
                  width: AppConst.kWidth * 0.4,
                  color: AppConst.kBkDark,
                ),
                CustomOtlnBtn(
                  color2: AppConst.kLight,
                  height: 52.h,
                  text: 'End Time',
                  width: AppConst.kWidth * 0.4,
                  color: AppConst.kBkDark,
                ),
              ],
            ),
            HeightSpacer(height: 30),
            CustomOtlnBtn(
              color2: AppConst.kGreen,
              height: 52.h,
              text: 'Submit',
              width: AppConst.kWidth,
              color: AppConst.kBkDark,
            ),
           
          ],
        ),
      ),
    );
  }
}
