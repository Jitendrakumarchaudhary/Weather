import 'package:permission_handler/permission_handler.dart';
import 'package:geolocator/geolocator.dart';

class Location {
  double latitude;
  double longitude;
  void getCurrentLocation() async {
    try {
      var status = await Permission.location.request();

      if (status.isGranted) {
        Position position = await Geolocator.getCurrentPosition(
            desiredAccuracy: LocationAccuracy.low);
        latitude = position.latitude;
        longitude = position.longitude;
        // We didn't ask for permission yet or the permission has been denied before but not permanently.
      } else {
        print('parmission denid');
      }
    } catch (e) {
      print(e);
    }
  }
}
