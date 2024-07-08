// ignore_for_file: deprecated_member_use

import 'dart:io';
// import 'package:device_preview/device_preview.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gym_statistics/app_router.dart';
import 'package:gym_statistics/di.dart';
import 'package:gym_statistics/shared_data/core/app_routes.dart';
import 'package:gym_statistics/shared_data/core/app_themes.dart';
import 'package:gym_statistics/shared_data/core/observer.dart';
import 'package:gym_statistics/shared_data/databases/app_services_db_provider.dart';
import 'package:gym_statistics/shared_data/utils/app_database_keys.dart';
import 'package:gym_statistics/shared_data/utils/shared_pref_helper.dart';
import 'package:hive/hive.dart';
import 'package:path_provider/path_provider.dart' as path;

// FirebaseMessaging _messaging = FirebaseMessaging.instance;
// @pragma('vm:entry-point')
// Future<void> _firebaseMessagingBackgroundHandler(RemoteMessage message) async {
//   print("Handling a background message: ${message.messageId}");
//   await Firebase.initializeApp(
//     options: DefaultFirebaseOptions.currentPlatform,
//   );
// }

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();
  // tz.initializeTimeZones();
  // await Firebase.initializeApp(
  //   options: DefaultFirebaseOptions.currentPlatform,
  // );
  setup();
  // await FirebaseMessaging.instance.getToken().then((value) {
  //   print(value);
  // });
  if (kDebugMode) {
    try {
      // firebaseFirestoreInstance.useFirestoreEmulator('localhost', 8080);
      // await firebaseAuthInstance.useAuthEmulator('localhost', 9099);
    } catch (e) {
      // ignore: avoid_print
      print(e);
    }
  }
  Bloc.observer = MyBlocObserver();
  await SharedPrefHelper.init();
  await _initHiveBoxes();
  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(statusBarColor: Colors.transparent, statusBarIconBrightness: Brightness.dark));
  // await _messaging.setAutoInitEnabled(true);
  // await NotificationHelper.initialize();
  // FirebaseMessaging.onBackgroundMessage(_firebaseMessagingBackgroundHandler);
  // NotificationHelper.subscribeToTopic('all');
  // Upgrader.clearSavedSettings();
  // print(await _messaging.getToken());
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: AppServicesDBprovider.listenable(),
      builder: (context, value, child) {
        return EasyLocalization(
          supportedLocales: [Locale('en'), Locale('ar')],
          path: 'assets/lang',
          fallbackLocale: Locale('en'),
          startLocale: Locale(AppServicesDBprovider.currentLocale()),
          useOnlyLangCode: true,
          child: ScreenUtilInit(
            designSize: Size(360, 690),
            builder: (context, child) {
              return MyMaterialApp();
            },
          ),
        );
      },
    );
  }
}

class MyMaterialApp extends StatefulWidget {
  const MyMaterialApp({
    super.key,
  });

  @override
  State<MyMaterialApp> createState() => _MyMaterialAppState();
}

class _MyMaterialAppState extends State<MyMaterialApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'GuROW Refactored',
      supportedLocales: context.supportedLocales,
      localizationsDelegates: context.localizationDelegates,
      locale: context.locale,
      initialRoute: AppRoutes.home,
      onGenerateRoute: AppRouter().onGenerateRoute,
      themeMode: AppServicesDBprovider.isDark() ? ThemeMode.dark : ThemeMode.light,
      theme: AppServicesDBprovider.isDark() ? AppTheme.darkTheme(AppServicesDBprovider.currentLocale()) : AppTheme.lightTheme(AppServicesDBprovider.currentLocale()),
    );
  }
}

Future<void> _initHiveBoxes() async {
  final dbPath = await path.getApplicationDocumentsDirectory();
  Hive.init(dbPath.path);
  // Hive.registerAdapter(DahabCartModelAdapter());
  // await Hive.openBox<DahabCartModel>(AppDatabaseKeys.dahabKey).then((box) {
  //   box.put(1, DahabCartModel(id: 1, isSell: true, quantity: 5));
  // });
  await Hive.openBox<String>(AppDatabaseKeys.appServicesKey).then((box) {
    // box.put(AppDatabaseKeys.themeKey, '0');

    if (box.get(AppDatabaseKeys.tokenKey) != null) {
      // _initialRoute = AppRoutes.intro;
    }
    if (!box.containsKey(AppDatabaseKeys.localeKey)) {
      //if there is not any saved locale => save device locale
      box.put(AppDatabaseKeys.localeKey, Platform.localeName.substring(0, 2)); //"ar"-eg
      print(Platform.localeName.substring(0, 2));
    }
    if (!box.containsKey(AppDatabaseKeys.themeKey)) {
      //if there is not any saved theme => save device theme
      final isDark = SchedulerBinding.instance.window.platformBrightness == Brightness.dark ? '1' : '0';
      box.put(AppDatabaseKeys.themeKey, isDark);
    }
  });
  // await Hive.openBox<Achievement>(AppDatabaseKeys.achievementKey).then((box) {});
}
