import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class CurrentLocation extends StatelessWidget {
  final String currentLocation;

  const CurrentLocation({
    required this.currentLocation,
  });

  @override
  Widget build(BuildContext context) {
    String today = DateFormat('dd/MM/yyyy - HH:mm').format(DateTime.now());
    return Expanded(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            currentLocation,
            style: const TextStyle(
              fontSize: 30,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
          Text(
            today,
            style: const TextStyle(
              fontSize: 15,
              color: Colors.white,
            ),
          ),
        ],
      ),
    );
  }
}
