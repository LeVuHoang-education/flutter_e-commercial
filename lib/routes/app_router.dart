import 'package:e_commercial_app/core/config/routers/router_path.dart';
import 'package:e_commercial_app/presentation/pages/home/home.dart';
import 'package:e_commercial_app/presentation/pages/login/login_screen.dart';
import 'package:e_commercial_app/presentation/pages/register/signup.dart';
import 'package:fluro/fluro.dart';

import '../presentation/widgets/layout/layout.dart';

class AppRouter {

  static final  FluroRouter router = FluroRouter();

  static void setupRouter() {
    router.define(
      MyRouterPath.home,
      handler: Handler(handlerFunc: (context, params) {
        return Layout();
      }),
      transitionType: TransitionType.fadeIn,
      transitionDuration: Duration(milliseconds: 1),
    );

    router.define(
      MyRouterPath.register,
      handler: Handler(handlerFunc: (context, params) {
        return SignupPage();
      }),
      transitionType: TransitionType.fadeIn,
      transitionDuration: Duration(milliseconds: 1),
    );

    router.define(
      MyRouterPath.login,
      handler: Handler(handlerFunc: (context, params) {
        return SigninPage();
      }),
      transitionType: TransitionType.fadeIn,
      transitionDuration: Duration(milliseconds: 1),
    );

  }
}