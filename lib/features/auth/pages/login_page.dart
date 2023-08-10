import 'package:country_picker/country_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:todo_app_withapi/common/utils/constants.dart';
import 'package:todo_app_withapi/common/widgets/custom_btn.dart';
import 'package:todo_app_withapi/common/widgets/height_spacer.dart';
import 'package:todo_app_withapi/common/widgets/reusable_text.dart';
import 'package:todo_app_withapi/common/widgets/text_style.dart';

import '../../../common/widgets/custom_text_field.dart';
import 'otp_page.dart';

class LoginPage extends ConsumerStatefulWidget {
  const LoginPage({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _LoginPageState();
}

class _LoginPageState extends ConsumerState<LoginPage> {
  final phoneNumberController = TextEditingController();
  Country country = Country(
      phoneCode: "1",
      countryCode: "US",
      e164Sc: 0,
      geographic: true,
      level: 1,
      name: "USA",
      example: "USA",
      displayName: "United State",
      displayNameNoCountryCode: "US",
      e164Key: "");
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 8.w),
        child: ListView(
          children: [
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 30.w),
              child: Image.asset(
                "assets/images/onb_1.png",
                width: 300,
              ),
            ),
            const HeightSpacer(height: 20),
            Container(
              alignment: Alignment.centerLeft,
              padding: EdgeInsets.only(left: 16.w),
              child: ReusableText(
                  text: "Please enter your phone number",
                  style: appStyle(17, AppConst.kLight, FontWeight.w500)),
            ),
            const HeightSpacer(height: 20),
            CustomTextField(
              preffixIcon: Container(
                padding: const EdgeInsets.all(4),
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: GestureDetector(
                    onTap: () {
                      showCountryPicker(
                          context: context,
                          countryListTheme: CountryListThemeData(
                              backgroundColor: AppConst.kLight,
                              bottomSheetHeight: AppConst.kHeight * 0.6,
                              borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(AppConst.kRadius),
                                  topRight: Radius.circular(AppConst.kRadius))),
                          onSelect: (code) {
                            setState(() {});
                          });
                    },
                    child: ReusableText(
                        text: "${country.flagEmoji}+${country.phoneCode}",
                        style: appStyle(18, AppConst.kBkDark, FontWeight.bold)),
                  ),
                ),
              ),
              controller: phoneNumberController,
              hintText: 'Enter your phone number',
              hintStyle: appStyle(16, AppConst.kBkDark, FontWeight.w600),
              keyBoardType: TextInputType.phone,
            ),
            const HeightSpacer(height: 20),
            Padding(
              padding: const EdgeInsets.all(2.0),
              child: CustomOtlnBtn(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const OtpPage()));
                  },
                  color: AppConst.kLight,
                  width: AppConst.kWidth * 0.85,
                  height: AppConst.kHeight * 0.07,
                  color2: AppConst.kBkDark,
                  text: "Send Code"),
            ),
          ],
        ),
      )),
    );
  }
}
