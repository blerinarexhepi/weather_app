import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class Temperature extends StatelessWidget {
  final double temp;

  // ignore: use_key_in_widget_constructors
  const Temperature({required this.temp});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          '${temp.round()}\u2103',
          style: const TextStyle(
            fontSize: 50,
            color: Colors.white,
          ),
        ),
        SvgPicture.asset(
          'assets/images/moon.svg',
          color: Colors.white,
          width: 25,
        ),
      ],
    );
  }
}
