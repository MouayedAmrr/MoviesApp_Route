import 'package:bot_toast/bot_toast.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:route_movies_app/core/routes/app_routes.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';

import 'firebase_options.dart';

GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      navigatorKey: navigatorKey,
      builder: EasyLoading.init(builder: BotToastInit()),
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        splashColor: Colors.transparent,
        highlightColor: Colors.transparent,
      ),
      onGenerateRoute: AppRoutes.onGeneratedRoute,
    );
  }
}
