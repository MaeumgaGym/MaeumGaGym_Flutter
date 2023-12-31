/// Package
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/flutter_svg.dart';

/// Core
import 'package:maeum_ga_gym_flutter/core/component/text/pretendard/ptd_text_widget.dart';
import 'package:maeum_ga_gym_flutter/config/maeumgagym_color.dart';

/// Screen
import 'package:maeum_ga_gym_flutter/pose/presentation/view/pose_part_screen.dart';
import 'package:maeum_ga_gym_flutter/pose/presentation/view/pose_recommend_screen.dart';
import 'package:maeum_ga_gym_flutter/pose/presentation/view/pose_search_screen.dart';
import '../provider/pose_search_controller.dart';
import '../widget/tab/tab_widget.dart';

class PoseTabScreen extends ConsumerStatefulWidget {
  const PoseTabScreen({super.key});

  @override
  ConsumerState<PoseTabScreen> createState() => _PoseTabScreenState();
}

class _PoseTabScreenState extends ConsumerState<PoseTabScreen>
    with SingleTickerProviderStateMixin {
  /// TabBar Controller
  late TabController tabController = TabController(
    initialIndex: 0,
    length: 9,
    vsync: this,
  );

  @override
  void dispose() {
    tabController.dispose();
    super.dispose();
  }

  /// TabBar
  Widget _tabBar() {
    return TabBar(
      controller: tabController,
      indicatorWeight: 2,
      indicatorSize: TabBarIndicatorSize.values.last,
      indicatorColor: MaeumgagymColor.blue500,
      dividerHeight: 2,
      dividerColor: MaeumgagymColor.gray50,
      isScrollable: true,
      tabAlignment: TabAlignment.start,
      labelPadding: const EdgeInsets.symmetric(horizontal: 8),
      overlayColor: MaterialStateProperty.all(MaeumgagymColor.white),
      tabs: const [
        TabWidget('추천'),
        TabWidget('가슴'),
        TabWidget('등'),
        TabWidget('어깨'),
        TabWidget('팔'),
        TabWidget('복근'),
        TabWidget('앞 허벅지'),
        TabWidget('뒷 허벅지'),
        TabWidget('종아리'),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: NestedScrollView(
          headerSliverBuilder: (context, innerBoxIsScrolled) {
            return <Widget>[
              SliverOverlapAbsorber(
                handle:
                    NestedScrollView.sliverOverlapAbsorberHandleFor(context),
                sliver: SliverAppBar(
                  title: SizedBox(
                    height: 52,
                    child: Padding(
                      padding: const EdgeInsets.only(right: 20),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          GestureDetector(
                            onTap: () async {
                              await Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) =>
                                      const PoseSearchScreen(),
                                ),
                              );

                              ref.read(poseSearchController.notifier).setText();
                            },
                            child: SvgPicture.asset(
                              'assets/image/pose_icon/search.svg',
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  bottom: PreferredSize(
                    preferredSize: const Size.fromHeight(48),
                    child: Padding(
                      padding: const EdgeInsets.only(left: 20),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          PtdTextWidget.titleLarge('자세', MaeumgagymColor.black),
                        ],
                      ),
                    ),
                  ),
                  pinned: false,
                  expandedHeight: 100,
                  forceElevated: innerBoxIsScrolled,
                ),
              ),
            ];
          },
          body: Column(
            children: [
              /// Tap Bar
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8),
                child: SizedBox(height: 56, child: _tabBar()),
              ),

              /// Tab Contents
              Expanded(
                child: TabBarView(
                  controller: tabController,
                  children: [
                    const PoseReCommendScreen(),
                    PosePartScreen(
                      tabContoller: tabController,
                      tabName: const ['상체', '가슴'],
                    ),
                    PosePartScreen(
                      tabContoller: tabController,
                      tabName: const ['상체', '등'],
                    ),
                    PosePartScreen(
                      tabContoller: tabController,
                      tabName: const ['상체', '어깨'],
                    ),
                    PosePartScreen(
                      tabContoller: tabController,
                      tabName: const ['상체', '팔'],
                    ),
                    PosePartScreen(
                      tabContoller: tabController,
                      tabName: const ['상체', '복근'],
                    ),
                    PosePartScreen(
                      tabContoller: tabController,
                      tabName: const ['하체', '앞 허벅지'],
                    ),
                    PosePartScreen(
                      tabContoller: tabController,
                      tabName: const ['하체', '뒷 허벅지'],
                    ),
                    PosePartScreen(
                      tabContoller: tabController,
                      tabName: const ['하체', '종아리'],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
