import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:maeum_ga_gym_flutter/config/maeumgagym_color.dart';
import 'package:maeum_ga_gym_flutter/core/component/text/pretendard/ptd_text_widget.dart';

class SelfCareDefaultAppBar extends StatelessWidget
    implements PreferredSizeWidget {
  final String? title;
  final String iconPath;

  const SelfCareDefaultAppBar({
    Key? key,
    this.title,
    required this.iconPath,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: PreferredSize(
        preferredSize: preferredSize,
        child: AppBar(
          automaticallyImplyLeading: false,
          scrolledUnderElevation: 0,
          backgroundColor: MaeumgagymColor.white,
          title: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              GestureDetector(
                onTap: () => Navigator.pop(context),
                child: Container(
                  alignment: Alignment.center,
                  child: SvgPicture.asset(
                    iconPath,
                    width: 28,
                    height: 28,
                  ),
                ),
              ),
              const SizedBox(width: 24),
              PtdTextWidget.labelLarge(
                title ?? "",
                /// title이 null이라면 공백처리
                MaeumgagymColor.black,
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(52);
}
