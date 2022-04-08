import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';

import '../../utils/enums.dart';
import '../../utils/functions/location.dart';
import '../../views/pages/see_all.dart';
import 'search.dart';

class CircleButton extends GetxController {
  final CostumCircleButtonEnum icon;

  CircleButton({required this.icon});

  Widget getIcon(CostumCircleButtonEnum icon) {
    switch (icon) {
      case CostumCircleButtonEnum.settings_icon:
        return SvgPicture.asset('assets/icons/settings.svg');

      case CostumCircleButtonEnum.location_icon:
        return SvgPicture.asset('assets/icons/location.svg');

      default:
        return SvgPicture.asset('assets/icons/back-arrow.svg');
    }
  }

  Future<void> getOnPressedFunction(CostumCircleButtonEnum icon) async {
    switch (icon) {
      case CostumCircleButtonEnum.settings_icon:
        return Get.to(() => SeeAllPage());

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
        return Get.back();
    }
  }
}
