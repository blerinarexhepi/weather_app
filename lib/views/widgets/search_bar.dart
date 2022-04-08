// ignore_for_file: use_key_in_widget_constructors

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../core/controllers/search.dart';
import '../../utils/colors.dart';
import '../../utils/enums.dart';
import 'circle_button.dart';

class SearchBar extends StatelessWidget {
  const SearchBar({
    this.seeAllButton = false,
  });

  final bool seeAllButton;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: GetBuilder<SearchController>(
            init: SearchController(),
            builder: (controller) {
              return TextFormField(
                textCapitalization: TextCapitalization.sentences,
                style: const TextStyle(
                  color: AppColors.white,
                  fontWeight: FontWeight.w400,
                ),
                decoration: InputDecoration(
                  isDense: true,
                  hintText: 'Search your city',
                  contentPadding: const EdgeInsets.only(
                    left: 10,
                    top: 11,
                    right: 15,
                  ),
                  hintStyle: const TextStyle(
                    fontSize: 17,
                    color: AppColors.grey4,
                    fontWeight: FontWeight.w200,
                    fontStyle: FontStyle.italic,
                  ),
                  focusedBorder: const UnderlineInputBorder(
                    borderSide: BorderSide(color: AppColors.white),
                  ),
                  enabledBorder: const UnderlineInputBorder(
                    borderSide: BorderSide(
                      color: AppColors.white,
                    ),
                  ),
                  suffixIcon: IconButton(
                    onPressed: () => controller.searchCity(),
                    icon: const Icon(
                      Icons.search,
                      color: AppColors.white,
                    ),
                  ),
                ),
                onFieldSubmitted: (text) => controller.searchCity(),
              );
            },
          ),
        ),
        const CostumCircleButton(
          padding: 10,
          iconType: CostumCircleButtonEnum.location_icon,
        ),
        if (seeAllButton)
          const CostumCircleButton(
            padding: 10,
            iconType: CostumCircleButtonEnum.settings_icon,
          ),
      ],
    );
  }
}
