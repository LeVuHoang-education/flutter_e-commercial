import 'package:e_commercial_app/core/config/routers/router_path.dart';
import 'package:flutter/cupertino.dart';
import '../../../routes/app_router.dart';

class RouterHandle {
  static void navigateToHome(BuildContext context) {
    AppRouter.router.navigateTo(context, MyRouterPath.home,
        replace: true, clearStack: true);
  }

  static void navigateToLogin(BuildContext context) {
    AppRouter.router.navigateTo(context, MyRouterPath.login,
        replace: true, clearStack: true);
  }

  static void navigateToRegister(BuildContext context) {
    AppRouter.router.navigateTo(context, MyRouterPath.register,
        replace: true, clearStack: true);
  }

  static void goBack(BuildContext context) {
    Navigator.of(context).pop();
  }
}