import 'package:get/get.dart';
import 'package:geolocator/geolocator.dart';
import 'package:permission_handler/permission_handler.dart';

class HomeController extends GetxController {
  int currentPage = 0;
  late String _currentAddress;
  late Position _currentPosition;

  late Position position;

  // String img;

  void onPageChanged(int index) {
    currentPage = index;
  }

  @override
  void onInit() {
    // setPosition();

    super.onInit();
  }

  // void setPosition({Position? newPosition}) async {
  //   if (newPosition != null) {
  //     position = newPosition;
  //   } else if (await Permission.location.isGranted) {
  //     position = await Geolocator.getCurrentPosition();
  //   } else {
  //     position = null;
  //   }

  //   update();
  // }

  Position getCurrentLocation() {
    try {
      position =
          Geolocator.getCurrentPosition(desiredAccuracy: LocationAccuracy.high)
              .then((Position position) {
        _currentPosition = position;
        // _getAddressFromLatLng();
      }) as Position;

      print(position);

      update();

      return position;
    } catch (e) {
      print(e);

      return position;
    }
  }
}
