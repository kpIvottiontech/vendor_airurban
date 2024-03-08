import 'package:flutter/material.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:location/location.dart' as loc;
import 'package:vendor_airurban/dio_api_handler/api_worker.dart';
import 'package:vendor_airurban/routes/routes.dart';
import 'package:vendor_airurban/utils/session/sessionmanager.dart';

Placemark? placemarkLocation;

class AllowLocationController extends GetxController {
  ApiWorker apiWorker = ApiWorker();
  RxBool isLogin = false.obs;

  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onClose() {
    super.onClose();
  }

  updateScreen(String value) {
    update([value]);
  }

  getIsLogin() async {
    await SessionManager.getBoolValue("isLogin").then((value) {
      print('>>>print isLogin $value');
        isLogin.value = value;
    });
  }

  getNavigationPage() {
    if (isLogin.value) {
      Get.offAllNamed(AppRoutes.homeMain);
    } else {
      Get.offAllNamed(AppRoutes.login);
    }
  }

  Future<void> getCurrentPosition() async {
    final hasPermission = await handleLocationPermission();

    if (!hasPermission) return;

    await Geolocator.getCurrentPosition(desiredAccuracy: LocationAccuracy.high)
        .then((Position position) async {
      List<Placemark> placemark = await placemarkFromCoordinates(
          position.latitude, position.longitude);
      if (placemark != null && placemark.isNotEmpty) {
        placemarkLocation = placemark.first;
        print('placemark ${placemarkLocation}');
        String country = placemark.first.country ?? 'Unknown Country';
        String city = placemark.first.locality ?? 'Unknown City';
        String place = placemark.first.name ?? 'Unknown Place';
        print('Country: $country, City: $city, Place: $place');
        getNavigationPage();
      }
      else {
        Get.snackbar('Something went wrong', 'No location details found',
            snackPosition: SnackPosition.BOTTOM,
            backgroundColor: Colors.red.withOpacity(0.3));
        print('No location details found');
      }
    })
        .catchError((e) async {
      debugPrint(e);
    });
  }

  Future<bool> handleLocationPermission() async {
    bool serviceEnabled;
    LocationPermission permission;

    loc.Location location = loc.Location();
    serviceEnabled = await Geolocator.isLocationServiceEnabled();

    if (!serviceEnabled) {
      Get.snackbar('Alert', 'Location services are disabled. Please enable the services',
          snackPosition: SnackPosition.BOTTOM);

      final serviceRequestedResult = await location.requestService();
      if (!serviceRequestedResult) {
        return false;
      } else {
        return true;
      }

      // return false;
    }

    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        Get.snackbar('Alert', 'Location permissions are denied',
            snackPosition: SnackPosition.BOTTOM);
        return false;
      }
    }
    if (permission == LocationPermission.deniedForever) {
      Get.snackbar('Alert', 'Location permissions are permanently denied, we cannot request permissions.',
          snackPosition: SnackPosition.BOTTOM);
      return false;
    }
    return true;
  }

  getLocationPermission(BuildContext context) async {
    print('allow location>>>');
    PermissionStatus status = await Permission.location.status;
    print('test >>>$status');
    if (status.isDenied || status.isPermanentlyDenied || status.isRestricted) {
      Permission.location.request().then((value) {
        if (value.isGranted) {
          fetchLocationAndNavigate();
        } else {
          print('permission request denied: $value');
        }
      });
    } else if (status.isGranted) {
      fetchLocationAndNavigate();
    }
  }

  void fetchLocationAndNavigate() async {
    LocationPermission permission;
   // permission = await Geolocator.checkPermission();
    permission = await Geolocator.requestPermission();

    if (permission == LocationPermission.denied) {
      // Handle denied permission case
      print('Location permission denied');
      return;
    }
    if (permission == LocationPermission.whileInUse ||
        permission == LocationPermission.always) {
      try {
        Position position = await Geolocator.getCurrentPosition(
            desiredAccuracy: LocationAccuracy.high);
        List<Placemark> placemark = await placemarkFromCoordinates(
            position.latitude, position.longitude);
        if (placemark != null && placemark.isNotEmpty) {
          placemarkLocation = placemark.first;
          print('placemark ${placemarkLocation}');
          String country = placemark.first.country ?? 'Unknown Country';
          String city = placemark.first.locality ?? 'Unknown City';
          String place = placemark.first.name ?? 'Unknown Place';
          print('Country: $country, City: $city, Place: $place');
          getNavigationPage();
        }
        else {
          Get.snackbar('Something went wrong', 'No location details found',
              snackPosition: SnackPosition.BOTTOM,
              backgroundColor: Colors.red.withOpacity(0.3));
          print('No location details found');
        }
      } catch (e) {
        Get.snackbar('Something went wrong', 'Error fetching location: $e',
            snackPosition: SnackPosition.BOTTOM,
            backgroundColor: Colors.red.withOpacity(0.3));
        print('Error fetching location: $e');
      }
    }
  }
}
