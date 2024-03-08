import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';
import 'package:vendor_airurban/components/common_size/common_hight_width.dart';
import 'package:vendor_airurban/general_binding/common_binding.dart';
import 'package:vendor_airurban/routes/routes.dart';
import 'package:vendor_airurban/theme/get_theme.dart';


Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
  ]);
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {

  @override
  Widget build(BuildContext context) {
    return Sizer(builder: (context, orientation, deviceType) {
      AppDimensions.createInstance(context, SizerUtil.boxConstraints);
      AppDimensions.instance!.orientation =
          AppDimensions.update(context, SizerUtil.boxConstraints).orientation;
      AppDimensions.instance!.height =
          AppDimensions.update(context, SizerUtil.boxConstraints).height;
      AppDimensions.instance!.width =
          AppDimensions.update(context, SizerUtil.boxConstraints).width;
      return GetMaterialApp(
        theme: NkGetXTheme.lightTheme,
        darkTheme: NkGetXTheme.lightTheme,
        getPages: AppRoutes.generateRoutes,
         initialRoute: AppRoutes.splashScreen,
       // initialRoute: AppRoutes.homeMain,
        themeMode: ThemeMode.system,
        initialBinding: CommonBinding(),
        debugShowCheckedModeBanner: false,
      );
    });
  }
}
