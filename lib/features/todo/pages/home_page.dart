import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:todo_app_withapi/common/models/task_model.dart';
import 'package:todo_app_withapi/common/utils/constants.dart';
import 'package:todo_app_withapi/common/widgets/custom_text_field.dart';
import 'package:todo_app_withapi/common/widgets/expansion_tile.dart';
import 'package:todo_app_withapi/common/widgets/height_spacer.dart';
import 'package:todo_app_withapi/common/widgets/reusable_text.dart';
import 'package:todo_app_withapi/common/widgets/text_style.dart';
import 'package:todo_app_withapi/common/widgets/width_spacer.dart';
import 'package:todo_app_withapi/features/todo/controllers/todo/todo_provider.dart';
import 'package:todo_app_withapi/features/todo/pages/add_task.dart';
import 'package:todo_app_withapi/features/todo/widgets/todo_tile.dart';

import '../controllers/xpansion_provider.dart';

class HomePage extends ConsumerStatefulWidget {
  const HomePage({super.key});

  @override
  ConsumerState<HomePage> createState() => _HomePageState();
}

class _HomePageState extends ConsumerState<HomePage>
    with TickerProviderStateMixin {
  late final TabController tabController =
      TabController(length: 2, vsync: this);
  final searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    ref.watch(todoStateProvider.notifier).refresh();
    return Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          backgroundColor: Colors.transparent,
          bottom: PreferredSize(
              preferredSize: const Size.fromHeight(85),
              child: Column(
                children: [
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 20.w),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        ReusableText(
                            text: "Dashboard",
                            style:
                                appStyle(18, AppConst.kLight, FontWeight.bold)),
                        Container(
                          width: 25.w,
                          height: 25.h,
                          decoration: const BoxDecoration(
                              color: AppConst.kLight,
                              borderRadius:
                                  BorderRadius.all(Radius.circular(9))),
                          child: GestureDetector(
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => const AddTask()));
                            },
                            child: const Icon(
                              Icons.add,
                              color: AppConst.kBkDark,
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                  const HeightSpacer(height: 20),
                  CustomTextField(
                    hintText: "Search",
                    controller: searchController,
                    preffixIcon: Container(
                      padding: EdgeInsets.all(14.h),
                      child: GestureDetector(
                        onTap: () {},
                        child: const Icon(
                          AntDesign.search1,
                          color: AppConst.kGreyLight,
                        ),
                      ),
                    ),
                    suffixIcon: const Icon(
                      FontAwesome.sliders,
                      color: AppConst.kGreyLight,
                    ),
                  ),
                  const HeightSpacer(height: 15),
                ],
              )),
        ),
        body: SafeArea(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.w),
            child: ListView(
              padding: EdgeInsets.only(bottom: 20.h),
              children: [
                const HeightSpacer(height: 15),
                Row(
                  children: [
                    const Icon(
                      FontAwesome.tasks,
                      color: AppConst.kLight,
                    ),
                    const WidthSpacer(width: 5),
                    ReusableText(
                      text: "Today's Task",
                      style: appStyle(18, AppConst.kLight, FontWeight.bold),
                    ),
                  ],
                ),
                const HeightSpacer(height: 25),
                Container(
                  decoration: BoxDecoration(
                      color: AppConst.kLight,
                      borderRadius:
                          BorderRadius.all(Radius.circular(AppConst.kRadius))),
                  child: TabBar(
                      indicatorSize: TabBarIndicatorSize.label,
                      indicator: BoxDecoration(
                          color: AppConst.kGreyLight,
                          borderRadius: BorderRadius.all(
                              Radius.circular(AppConst.kRadius))),
                      labelPadding: EdgeInsets.zero,
                      isScrollable: false,
                      labelColor: AppConst.kBlueLight,
                      labelStyle:
                          appStyle(24, AppConst.kBlueLight, FontWeight.w700),
                      unselectedLabelColor: AppConst.kLight,
                      controller: tabController,
                      tabs: [
                        Tab(
                          child: SizedBox(
                            width: AppConst.kWidth * 0.5,
                            child: Center(
                              child: ReusableText(
                                  text: "Pending",
                                  style: appStyle(
                                      16, AppConst.kBkDark, FontWeight.w600)),
                            ),
                          ),
                        ),
                        Tab(
                          child: Container(
                            padding: EdgeInsets.only(left: 30.w),
                            width: AppConst.kWidth * 0.5,
                            child: Center(
                              child: ReusableText(
                                  text: "Completed Task",
                                  style: appStyle(
                                      16, AppConst.kBkDark, FontWeight.w600)),
                            ),
                          ),
                        )
                      ]),
                ),
                const HeightSpacer(height: 20),
                SizedBox(
                  height: AppConst.kHeight * 0.3,
                  width: AppConst.kWidth,
                  child: ClipRRect(
                    borderRadius:
                        BorderRadius.all(Radius.circular(AppConst.kRadius)),
                    child: TabBarView(controller: tabController, children: [
                      Container(
                          color: AppConst.kBklight,
                          height: AppConst.kHeight * 0.3,
                          child: TodayTask()),
                      Container(
                        color: AppConst.kBklight,
                        height: AppConst.kHeight * 0.3,
                      ),
                    ]),
                  ),
                ),
                const HeightSpacer(height: 20),
                XpansionTile(
                  text: "Tomorrow's Task",
                  text2: "I will be study Dart tomorrow",
                  trailing: ref.watch(xpansionStateProvider)
                      ? Padding(
                          padding: EdgeInsets.only(right: 12.w),
                          child: Icon(
                            AntDesign.circledown,
                            color: AppConst.kLight,
                          ),
                        )
                      : Padding(
                          padding: EdgeInsets.only(right: 12.w),
                          child: Icon(
                            AntDesign.closecircleo,
                            color: AppConst.kBlueLight,
                          ),
                        ),
                  onExpansionChanged: (bool expanded) {
                    ref
                        .read(xpansionStateProvider.notifier)
                        .setStart(!expanded);
                  },
                  children: [
                    TodoTile(
                      start: "03:00",
                      end: "05:00",
                      switcher: Switch(value: false, onChanged: (value) {}),
                    )
                  ],
                ),
                const HeightSpacer(height: 20),
                XpansionTile(
                  text: DateTime.now()
                      .add(const Duration(days: 2))
                      .toString()
                      .substring(0, 10),
                  text2: "Day After Tomorrow's task",
                  trailing: ref.watch(xpansionState0Provider)
                      ? Padding(
                          padding: EdgeInsets.only(right: 12.w),
                          child: Icon(
                            AntDesign.circledown,
                            color: AppConst.kLight,
                          ),
                        )
                      : Padding(
                          padding: EdgeInsets.only(right: 12.w),
                          child: Icon(
                            AntDesign.closecircleo,
                            color: AppConst.kBlueLight,
                          ),
                        ),
                  onExpansionChanged: (bool expanded) {
                    ref
                        .read(xpansionState0Provider.notifier)
                        .setStart(!expanded);
                  },
                  children: [
                    TodoTile(
                      start: "03:00",
                      end: "05:00",
                      switcher: Switch(value: false, onChanged: (value) {}),
                    )
                  ],
                )
              ],
            ),
          ),
        ));
  }
}

class TodayTask extends ConsumerWidget {
  const TodayTask({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    List<TaskModel> listData = ref.watch(todoStateProvider);
    String today = ref.read(todoStateProvider.notifier).getToday();
    var todayList = listData
        .where((element) =>
            element.isCompleted == 0 && element.date!.contains(today))
        .toList();
    debugPrint(todayList.toString());
    return ListView.builder(
        itemCount: todayList.length,
        itemBuilder: (context, index) {
          final data = todayList[index];
          return TodoTile(
            title: data.title,
            description: data.desc,
            start: data.startTime,
            end: data.endTime,
            color: AppConst.kGreen,
          );
        });
  }
}
