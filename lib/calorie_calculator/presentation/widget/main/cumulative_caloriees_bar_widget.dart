import 'package:flutter/material.dart';

import '../../../../config/maeumgagym_color.dart';

class CumulativeCaloriesBarWidget extends StatelessWidget {
  final int caloriesState, maxCaloriesState;

  const CumulativeCaloriesBarWidget(
      {super.key, required this.caloriesState, required this.maxCaloriesState});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 30,
      child: Padding(
        padding: const EdgeInsets.all(10),
        child: Center(
          child: Stack(
            children: [
              /// 회색 Bar
              Container(
                width: MediaQuery.of(context).size.width - 60,
                height: 10,
                decoration: BoxDecoration(
                  color: MaeumgagymColor.gray100,
                  borderRadius: BorderRadius.circular(100),
                ),
              ),

              /// 파란색 Bar
              Container(
                width: caloriesState /
                    maxCaloriesState *
                    (MediaQuery.of(context).size.width - 60),
                height: 10,
                decoration: BoxDecoration(
                  color: MaeumgagymColor.blue400,
                  borderRadius: BorderRadius.circular(100),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
