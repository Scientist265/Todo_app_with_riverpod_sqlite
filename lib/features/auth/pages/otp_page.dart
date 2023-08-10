import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pinput/pinput.dart';
import 'package:todo_app_withapi/common/utils/constants.dart';
import 'package:todo_app_withapi/common/widgets/height_spacer.dart';
import 'package:todo_app_withapi/common/widgets/reusable_text.dart';
import 'package:todo_app_withapi/common/widgets/text_style.dart';

class OtpPage extends StatelessWidget {
  const OtpPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            HeightSpacer(height: AppConst.kHeight * 0.12),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 30.h),
              child: Image.asset(
                "assets/images/onb_1.png",
                width: AppConst.kWidth * 0.5,
              ),
            ),
            const HeightSpacer(height: 26),
            ReusableText(
                text: "Enter Your Otp",
                style: appStyle(18, AppConst.kLight, FontWeight.bold)),
            const HeightSpacer(height: 26),
            Pinput(
              length: 6,
              showCursor: true,
              onCompleted: (value) {
                if (value.length == 6) {}
              },
              onSubmitted: (value) {
                if (value.length == 6) {}
              },
            )
          ],
        ),
      ),
    );
  }
}
