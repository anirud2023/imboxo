import 'package:flutter_dotenv/flutter_dotenv.dart';

class Config {
  Config._();

  static final String env = dotenv.env['ENVIRONMENT'] ?? '';

  static const String prod = "assets/env/.env.prod";
  static const String uat = "assets/env/.env.uat";
  static const String local = "assets/env/.env";

  static bool isUAT() => (env=="uat");

}
