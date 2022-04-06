import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:weather_app/views/pages/settings.dart';

import '../../utils/enums.dart';
import '../../utils/functions/location.dart';

class CircleButton extends GetxController {
  final CostumCircleButtonEnum icon;

  CircleButton({required this.icon});

  Widget getIcon(CostumCircleButtonEnum icon) {
    switch (icon) {
      case CostumCircleButtonEnum.back_icon:
        return SvgPicture.asset('assets/icons/logout.svg');

      case CostumCircleButtonEnum.close_icon:
        return SvgPicture.asset('assets/icons/close.svg');

      case CostumCircleButtonEnum.location_icon:
        return SvgPicture.asset('assets/icons/location.svg');

      case CostumCircleButtonEnum.settings_icon:
        return SvgPicture.asset('assets/icons/settings.svg');

      default:
        return SvgPicture.asset('assets/icons/settings.svg');
    }
  }

  void getOnPressedFunction(CostumCircleButtonEnum icon) {
    switch (icon) {
      case CostumCircleButtonEnum.settings_icon:
        Get.to(() => SettingsPage());

        return;

      case CostumCircleButtonEnum.back_icon:
        Get.back();
        return;

      // case CostumCircleButtonEnum.close_icon:
      //   if (Get.currentRoute.contains('/searchHistory') ||
      //       (Get.currentRoute == '/filter' &&
      //           Get.find<FilterController>().filtered.isEmpty))
      //     Get
      //       ..find<FilterController>().clearFilters()
      //       ..back();
      //   Get.back();
      //   return;

      case CostumCircleButtonEnum.location_icon:
        determinePosition();
        return;

      default:
        return; //TODO: Navigate to specific page
    }
  }
}
