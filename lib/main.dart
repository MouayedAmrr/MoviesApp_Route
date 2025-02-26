import 'package:bot_toast/bot_toast.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:provider/provider.dart';
import 'package:route_movies_app/core/routes/app_routes.dart';

import 'package:firebase_core/firebase_core.dart';
import 'package:route_movies_app/modules/layout/viewModel/movie_view_model.dart';

import 'firebase_options.dart';

GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(ChangeNotifierProvider(create: (BuildContext context) => MovieViewModel(),
  child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});


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
