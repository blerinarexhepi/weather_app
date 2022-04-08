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
                controller: controller.searchController
                  ..addListener(
                    () => controller
                        .hasValue(controller.searchController.text.length > 2),
                  ),
                textCapitalization: TextCapitalization.sentences,
                style: const TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.w400,
                ),
                decoration: InputDecoration(
                  hintText: 'Search your city',
                  isDense: true,
                  contentPadding: const EdgeInsets.only(
                    left: 10,
                    top: 11,
                    right: 15,
                  ),
                  hintStyle: const TextStyle(
                    fontSize: 17,
                    fontWeight: FontWeight.w200,
                    color: AppColors.grey4,
                    fontStyle: FontStyle.italic,
                  ),
                  focusedBorder: const UnderlineInputBorder(
                    borderSide: BorderSide(color: Colors.white),
                  ),
                  enabledBorder: const UnderlineInputBorder(
                    borderSide: BorderSide(
                      color: Colors.white,
                    ),
                  ),
                  suffixIcon: IconButton(
                    onPressed: () => controller.searchCity(),
                    icon: const Icon(
                      Icons.search,
                      color: Colors.white,
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
