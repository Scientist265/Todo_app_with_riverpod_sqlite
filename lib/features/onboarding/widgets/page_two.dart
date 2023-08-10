import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:todo_app_withapi/common/utils/constants.dart';
import 'package:todo_app_withapi/common/widgets/custom_btn.dart';
import 'package:todo_app_withapi/common/widgets/height_spacer.dart';

import '../../auth/pages/login_page.dart';

class PageTwo extends StatelessWidget {
  const PageTwo({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: AppConst.kHeight,
      width: AppConst.kWidth,
      color: AppConst.kBkDark,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 30.w),
            child: Image.asset("assets/images/onb_1.png"),
          ),
          const HeightSpacer(height: 50),
          CustomOtlnBtn(
              width: AppConst.kWidth * 0.9,
              height: AppConst.kHeight * 0.06,
              color2: AppConst.kLight,
              onTap: () {
                Navigator.pushReplacement(context,
                    MaterialPageRoute(builder: (context) => const LoginPage()));
              },
              text: "Login With a Phone Number"),
        ],
      ),
    );
  }
}
