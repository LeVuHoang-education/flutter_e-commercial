import 'package:e_commercial_app/presentation/widgets/button_state_cubit.dart';
import 'package:e_commercial_app/presentation/widgets/layout/layout.dart';
import 'package:e_commercial_app/presentation/widgets/layout/layout_bloc.dart';
import 'package:e_commercial_app/routes/app_router.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';
import 'core/config/auth/auth_state.dart';
import 'core/config/auth/auth_state_cubit.dart';
import 'core/config/routers/router_path.dart';
import 'core/config/themes/app_theme.dart';
import 'data/repositories/auth_repository.dart';
import 'data/repositories/repositoryImp/auth.dart';
import 'di/service_locator.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setSystemUIOverlayStyle(
      const SystemUiOverlayStyle(
          statusBarBrightness: Brightness.light,
          systemNavigationBarColor: Colors.black
      )
  );

  setupServiceLocator();
  AppRouter.setupRouter();

  runApp(
    MultiProvider(
      providers: [
        Provider<AuthRepository>(create: (context) => AuthRepositoryImpl()),
        BlocProvider(create: (context) => ButtonStateCubit()),
        BlocProvider(create: (context) => sl<AuthStateCubit>()..appStarted()),
        BlocProvider(create: (context) => LayoutBloc())
      ],
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    SystemChrome.setEnabledSystemUIMode(
        SystemUiMode.manual, overlays: [SystemUiOverlay.bottom]);
    return MaterialApp(
          onGenerateRoute: AppRouter.router.generator,
          initialRoute: _getInitialRoute(),
          theme: AppTheme.appTheme,
          debugShowCheckedModeBanner: false,
      );
  }
}

String _getInitialRoute() {
  final AuthState state = sl<AuthStateCubit>().state;
  if (state is Authenticated) {
    return MyRouterPath.home;
  } else {
    return MyRouterPath.login;
  }
}