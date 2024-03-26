import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mis_project/app/data/repositories/client_repository.dart';
import 'package:mis_project/app/data/repositories/company_repository.dart';
import 'package:mis_project/app/data/repositories/consignment_repository.dart';
import 'package:mis_project/app/data/services/auth_service.dart';

import 'app/data/repositories/auth_repository.dart';
import 'app/routes/app_pages.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await GetStorage.init();
  await dotenv.load(fileName: ".env");

  //Add services here
  Get.put<AuthService>(AuthService(), permanent: true);

  //Add repositories here
  Get.put<AuthRepository>(AuthRepository(), permanent: true);
  Get.put<CompanyRepository>(CompanyRepository(), permanent: true);
  Get.put<ClientRepository>(ClientRepository(), permanent: true);
  Get.put<ConsignmentRepository>(ConsignmentRepository(), permanent: true);

  SystemChrome.setSystemUIOverlayStyle(
    const SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
      statusBarIconBrightness: Brightness.dark,
      statusBarBrightness: Brightness.dark,
      systemNavigationBarColor: Colors.white,
      systemNavigationBarIconBrightness: Brightness.dark,
    ),
  );
  runApp(
    GetMaterialApp(
      title: "Application",
      initialRoute: AppPages.INITIAL,
      getPages: AppPages.routes,
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        scaffoldBackgroundColor: Colors.white,
        textTheme: GoogleFonts.poppinsTextTheme(),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            minimumSize: const Size(double.infinity, 50),
            padding: const EdgeInsets.symmetric(vertical: 15),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
            backgroundColor: const Color(0xFF1F41BB),
            foregroundColor: Colors.white,
          ),
        ),
        outlinedButtonTheme: OutlinedButtonThemeData(
          style: OutlinedButton.styleFrom(
            minimumSize: const Size(double.infinity, 50),
            padding: const EdgeInsets.symmetric(vertical: 15),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
          ),
        ),
        inputDecorationTheme: InputDecorationTheme(
          hintStyle: const TextStyle(
            color: Color(0xff626262),
            fontSize: 16,
          ),
          contentPadding: const EdgeInsets.symmetric(
            vertical: 18,
            horizontal: 20,
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: const BorderSide(
              color: Colors.transparent,
              width: 1.5,
            ),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: BorderSide(
              color: Get.theme.colorScheme.primary,
              width: 1.5,
            ),
          ),
          fillColor: const Color(0xffF1F4FF),
          filled: true,
        ),
        colorScheme: const ColorScheme.light(
          primary: Color(0xFF1F41BB),
        ),
      ),
    ),
  );
}
