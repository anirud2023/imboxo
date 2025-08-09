import 'package:get/get.dart';
import 'package:get/get_navigation/src/routes/get_route.dart';
import 'package:untitled/config/routes/route_names.dart';
import 'package:untitled/domain/usecases/home/home_binding.dart';
import 'package:untitled/domain/usecases/login/login_binding.dart';
import 'package:untitled/domain/usecases/register_user/register_binding.dart';
import 'package:untitled/domain/usecases/splash/splash_binding.dart';
import 'package:untitled/presentation/pages/home_screen/home_activity_screen.dart';
import 'package:untitled/presentation/pages/login_screen/login_screen.dart';
import 'package:untitled/presentation/pages/register_user_screen/register_user_screen.dart';
import 'package:untitled/presentation/pages/splash_screen/splash_screen.dart';

class Routes {
  static appRoutes() => [
    GetPage(name: RoutesName.kSplash, page: () => const SplashScreen(), transition: Transition.rightToLeft,binding: SplashBinding()),
    GetPage(name: RoutesName.kLogin, page: () => const LoginScreen(), transition: Transition.rightToLeft,binding: LoginBinding()),
    GetPage(name: RoutesName.kRegister, page: () => const RegisterScreen(), transition: Transition.rightToLeft,binding: RegisterScreenBinding()),
    GetPage(name: RoutesName.kHome, page: () =>  HomeScreen(), transition: Transition.rightToLeft,binding: HomeBinding()),
  ];
}
