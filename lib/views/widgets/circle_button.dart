// ignore_for_file: use_key_in_widget_constructors

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

import '../../core/controllers/circle_button.dart';
import '../../utils/colors.dart';
import '../../utils/enums.dart';

class CostumCircleButton extends StatelessWidget {
  final double padding;
  final CostumCircleButtonEnum iconType;
  final Function? onTap;

  const CostumCircleButton({
    required this.iconType,
    this.onTap,
    this.padding = 20,
  });

  @override
  Widget build(BuildContext context) {
    Get.put(CircleButton(icon: iconType));

    return GetBuilder<CircleButton>(
      builder: (controller) {
        return ElevatedButton(
          child: controller.getIcon(iconType),
          onPressed: () {
            onTap ?? controller.getOnPressedFunction(iconType);
            HapticFeedback.lightImpact();
          },
          style: ElevatedButton.styleFrom(
            shape: const CircleBorder(),
            minimumSize: Size.zero,
            padding: EdgeInsets.all(padding),
            splashFactory: NoSplash.splashFactory,
            primary: AppColors.white.withOpacity(0.5),
          ),
        );
      },
    );
  }
}
