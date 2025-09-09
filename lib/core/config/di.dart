import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';
import 'package:route_movies_app/core/config/di.config.dart';

final getIt = GetIt.instance;

@InjectableInit(
  initializerName: 'init', // default
  preferRelativeImports: true, // default
  asExtension: true, // default
)
Future<void> configureDependencies() async => getIt.init();
