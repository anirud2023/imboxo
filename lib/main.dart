import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:get_storage/get_storage.dart';
import 'package:untitled/res/app_colors.dart';

import 'config/config.dart';
import 'config/routes/route_names.dart';
import 'config/routes/routes.dart';
import 'domain/app/appBinding/app_binding.dart';

void main() async {


  await dotenv.load(fileName:Config.local);
  await GetStorage.init();
  runApp( MyApp());
}


class MyApp extends StatelessWidget {


  @override
  Widget build(BuildContext context) {

    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);

    return GestureDetector(
      onTap: hideKeyboard,
      child: GetMaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
          textTheme: const TextTheme(
            displayMedium:
            TextStyle(color: AppColor.colorPrimaryText, fontFamily: 'Specimen', fontWeight: FontWeight.w400, fontSize:16),
          ),
        ),
        initialBinding: AppBinding(),
        initialRoute: RoutesName.kSplash,
        getPages: Routes.appRoutes(),
      ),
    );
  }
}

void hideKeyboard() {
  FocusScopeNode currentFocus = FocusScope.of(Get.context!);
  if (!currentFocus.hasPrimaryFocus && currentFocus.focusedChild != null) {
    FocusManager.instance.primaryFocus?.unfocus();
  }
}
