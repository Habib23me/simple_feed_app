import 'package:adaptive_theme/adaptive_theme.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/route_manager.dart';
import 'package:simple_feed/src/data/auth/bloc/auth_bloc.dart';
import 'package:simple_feed/src/ui/screens/feed_screen/feed_screen.dart';
import 'package:simple_feed/src/ui/screens/login_screen/login_screen.dart';
import 'package:simple_feed/src/ui/screens/splash_screen/splash_screen.dart';
import 'package:simple_feed/src/ui/theme/app_theme.dart';
import 'package:simple_feed/src/util/setup/dependency_injector.dart';
import 'src/ui/screens/post_screen/post_screen.dart';
import 'package:firebase_core/firebase_core.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  final savedThemeMode = await AdaptiveTheme.getThemeMode();
  DependencyInjector.registerDependencies();
  runApp(GetMaterialApp(
    home: MainApp(savedThemeMode: savedThemeMode),
  ));
}

class MainApp extends StatelessWidget {
  final AdaptiveThemeMode savedThemeMode;

  const MainApp({Key key, this.savedThemeMode}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return AdaptiveTheme(
      light: AppTheme.lightTheme,
      dark: AppTheme.darkTheme,
      initial: savedThemeMode ?? AdaptiveThemeMode.system,
      builder: (theme, darkTheme) => MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Simple Feed',
          theme: theme,
          darkTheme: darkTheme,
          home: BlocBuilder(
            cubit: getIt<AuthenticationBloc>(),
            builder: (BuildContext context, state) {
              if (state == AuthState.authenticated) {
                return FeedScreen();
              } else if (state == AuthState.unAuthenticated) {
                return LoginScreen();
              }
              return SplashScreen();
            },
          )),
    );
  }
}
