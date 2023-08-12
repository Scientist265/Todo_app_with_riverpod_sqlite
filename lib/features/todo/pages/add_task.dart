import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:todo_app_withapi/common/models/task_model.dart';
import 'package:todo_app_withapi/common/utils/constants.dart';
import 'package:todo_app_withapi/common/widgets/custom_btn.dart';
import 'package:todo_app_withapi/common/widgets/custom_text_field.dart';
import 'package:todo_app_withapi/common/widgets/height_spacer.dart';
import 'package:flutter_datetime_picker_plus/flutter_datetime_picker_plus.dart'
    as picker;
import 'package:todo_app_withapi/features/todo/controllers/dates/dates_provider.dart';
import 'package:todo_app_withapi/features/todo/controllers/todo/todo_provider.dart';

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
    var scheduleDate = ref.watch(dateStateProvider);
    var start = ref.watch(startTimeStateProvider);
    var end = ref.watch(finishStateProvider);
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
              onTap: () {
                picker.DatePicker.showDatePicker(
                  context,
                  showTitleActions: true,
                  minTime: DateTime(2023, 3, 5),
                  maxTime: DateTime(2025, 6, 7),
                  theme: picker.DatePickerTheme(
                      headerColor: AppConst.kGreyLight,
                      backgroundColor: AppConst.kBkDark,
                      itemStyle: TextStyle(
                          color: AppConst.kGreen,
                          fontWeight: FontWeight.bold,
                          fontSize: 18),
                      doneStyle: TextStyle(color: Colors.white, fontSize: 16)),
                  onChanged: (date) {
                    print('change $date in time zone ' +
                        date.timeZoneOffset.inHours.toString());
                  },
                  onConfirm: (date) {
                    ref
                        .read(dateStateProvider.notifier)
                        .setDate(date.toString());
                  },
                );
              },
              color2: AppConst.kLight,
              height: 52.h,
              text: scheduleDate == ''
                  ? 'Set Date'
                  : scheduleDate.substring(0, 11),
              width: AppConst.kWidth,
              color: AppConst.kBkDark,
            ),
            HeightSpacer(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                CustomOtlnBtn(
                  onTap: () {
                    picker.DatePicker.showDateTimePicker(context,
                        showTitleActions: true,
                        minTime: DateTime.now(),
                        maxTime: DateTime(2025, 6, 7, 05, 09),
                        onChanged: (date) {
                      print('change $date in time zone ' +
                          date.timeZoneOffset.inHours.toString());
                    }, onConfirm: (date) {
                      ref
                          .read(startTimeStateProvider.notifier)
                          .startTime(date.toString());
                    }, locale: picker.LocaleType.en);
                  },
                  color2: AppConst.kLight,
                  height: 52.h,
                  text: start == '' ? 'Start Time' : start.substring(10, 16),
                  width: AppConst.kWidth * 0.4,
                  color: AppConst.kBkDark,
                ),
                CustomOtlnBtn(
                  onTap: () {
                    picker.DatePicker.showDateTimePicker(context,
                        showTitleActions: true,
                        minTime: DateTime.now(),
                        maxTime: DateTime(2025, 6, 7, 05, 09),
                        onChanged: (date) {
                      print('change $date in time zone ' +
                          date.timeZoneOffset.inHours.toString());
                    }, onConfirm: (date) {
                      ref
                          .read(finishStateProvider.notifier)
                          .setFinish(date.toString());
                    }, locale: picker.LocaleType.en);
                  },
                  color2: AppConst.kLight,
                  height: 52.h,
                  text: end == '' ? 'End time' : end.substring(10, 16),
                  width: AppConst.kWidth * 0.4,
                  color: AppConst.kBkDark,
                ),
              ],
            ),
            HeightSpacer(height: 30),
            CustomOtlnBtn(
              onTap: () {
                if (titleController.text.isNotEmpty &&
                    descController.text.isNotEmpty &&
                    scheduleDate.isNotEmpty &&
                    start.isNotEmpty &&
                    end.isNotEmpty) {
                  TaskModel task = TaskModel(
                      title: titleController.text,
                      desc: descController.text,
                      isCompleted: 0,
                      date: scheduleDate,
                      startTime: start.substring(10, 16),
                      endTime: end.substring(10, 16),
                      remind: 0,
                      repeat: 'yes');

                  ref.read(todoStateProvider.notifier).addItem(task);

                  //Set back the date, start and finish time provider to empty
                  ref.read(dateStateProvider.notifier).setDate("");
                  ref.read(startTimeStateProvider.notifier).startTime("");
                  ref.read(finishStateProvider.notifier).setFinish("");

                  Navigator.pop(context);
                } else {
                  debugPrint('failed to add task');
                }
              },
              color2: AppConst.kBkDark,
              height: 52.h,
              text: 'Submit',
              width: AppConst.kWidth,
              color: AppConst.kGreen,
            ),
          ],
        ),
      ),
    );
  }
}
