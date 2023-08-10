import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:todo_app_withapi/common/widgets/text_style.dart';
import 'package:todo_app_withapi/features/auth/controllers/code_provider.dart';

import '../../../common/utils/constants.dart';
import '../../../common/widgets/reusable_text.dart';

class TestPage extends ConsumerWidget {
  const TestPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final String codeValue = ref.watch(codeStateProvider);
    return Scaffold(
      appBar: AppBar(),
      body: Center(
          child: Column(
        children: [
          ReusableText(
            text: codeValue,
            style: appStyle(30, AppConst.kLight, FontWeight.w500),
          ),
          TextButton(
            onPressed: () {
              ref.read(codeStateProvider.notifier).setStart("Hello Scientist");
            },
            child: Text("Press Me"),
          ),
        ],
      )),
    );
  }
}
