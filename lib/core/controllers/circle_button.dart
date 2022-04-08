import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';

import '../../utils/enums.dart';
import '../../utils/functions/location.dart';
import '../../views/pages/settings.dart';
import 'search.dart';

class CircleButton extends GetxController {
  final CostumCircleButtonEnum icon;

  CircleButton({required this.icon});

  Widget getIcon(CostumCircleButtonEnum icon) {
    switch (icon) {
      case CostumCircleButtonEnum.back_icon:
        return SvgPicture.asset('assets/icons/back-arrow.svg');

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

  Future<void> getOnPressedFunction(CostumCircleButtonEnum icon) async {
    switch (icon) {
      case CostumCircleButtonEnum.settings_icon:
        return Get.to(() => SettingsPage());

      case CostumCircleButtonEnum.back_icon:
        return Get.back();

      case CostumCircleButtonEnum.location_icon:
        Position position = await determinePosition();
        if (position != null) {
          Get.find<SearchController>().searchCity(
            currentLocation: true,
            lat: position.latitude.toString(),
            lon: position.longitude.toString(),
          );
        }

        return;

      default:
        return; //TODO: Navigate to specific page
    }
  }
}
