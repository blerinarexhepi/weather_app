import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

import '../colors.dart';

void successSnackbar({
  String title = '',
  String message = '',
}) {
  if (title.isEmpty) title = 'success.title'.tr;
  if (message.isEmpty) message = 'success.default'.tr;

  Get.snackbar(
    title,
    message,
    backgroundColor: AppColors.white,
    icon: Padding(
      padding: const EdgeInsets.only(left: 10),
      child: SvgPicture.asset('assets/icons/party.svg'),
    ),
    boxShadows: <BoxShadow>[
      const BoxShadow(
        blurRadius: 15,
        spreadRadius: 3,
        offset: Offset(0, 2),
        color: AppColors.blueLinkWater,
      ),
    ],
  );
}

void errorSnackbar({
  String title = '',
  String message = '',
}) {
  if (title.isEmpty) title = 'error.title'.tr;
  if (message.isEmpty) message = 'error.general'.tr;

  Get.snackbar(
    '❌ ' + title,
    message,
    backgroundColor: Colors.red.withOpacity(0.5),
  );
}
