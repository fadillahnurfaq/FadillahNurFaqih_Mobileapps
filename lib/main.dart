import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:food_app_test/utils/constant.dart';
import 'package:food_app_test/utils/main_storage.dart';
import 'package:food_app_test/utils/state_util.dart';
import 'package:food_app_test/views/home/home_view.dart';
import 'package:hive/hive.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:path_provider/path_provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await dotenv.load(fileName: ".env");
  var path = await getTemporaryDirectory();
  Hive.init(path.path);
  mainStorage = await Hive.openBox("mainStorage");
  initializeDateFormatting();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Alan Creative',
      debugShowCheckedModeBanner: false,
      navigatorKey: Get.navigatorKey,
      scrollBehavior: NoSplashColor(),
      theme: ThemeData(
        progressIndicatorTheme:
            const ProgressIndicatorThemeData(color: kPrimaryColor),
        appBarTheme: AppBarTheme(
          elevation: 3.0,
          backgroundColor: Colors.white,
          titleTextStyle: kHeading6.copyWith(color: Colors.black),
          centerTitle: true,
          iconTheme: const IconThemeData(
            color: kBlueSoftColor,
            size: 20.0,
          ),
        ),
      ),
      home: const HomeView(),
    );
  }
}

class NoSplashColor extends ScrollBehavior {
  @override
  Widget buildOverscrollIndicator(
      BuildContext context, Widget child, ScrollableDetails details) {
    return child;
  }
}
