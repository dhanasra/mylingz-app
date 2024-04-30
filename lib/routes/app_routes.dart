import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mylingz_app/pages/auth/login/login_view.dart';
import 'package:mylingz_app/pages/auth/signup/signup_view.dart';
import 'package:mylingz_app/pages/biolink/basic_info/basic_info_view.dart';
import 'package:mylingz_app/pages/biolink/edit/biolink_edit_view.dart';
import 'package:mylingz_app/pages/links/create/create_link_view.dart';
import 'package:mylingz_app/pages/links/details/link_details_view.dart';
import 'package:mylingz_app/pages/settings/settings_view.dart';
import 'package:page_transition/page_transition.dart';

import '../common/image/image_bloc.dart';
import '../pages/auth/bloc/auth_bloc.dart';
import '../pages/biolink/bloc/bio_link_bloc.dart';
import '../pages/home/bloc/home_bloc.dart';
import '../pages/home/cubit/home_cubit.dart';
import '../pages/home/home_view.dart';
import '../pages/links/bloc/links_bloc.dart';
import '../pages/splash/splash_view.dart';

class Routes {
  static const splash = '/splash';
  static const welcome = '/welcome';

  static const login = '/login';
  static const signup = '/signup';

  static const home = '/home';

  static const settings = '/settings';

  static const createLink = '/createLink';
  static const linkDetails = '/linkDetails';

  static const bioLinkEdit = '/bioLinkEdit';
  static const bioLinkBasicInfo = '/bioLinkBasicInfo';
}

class RouteGenerator {
  final RouteSettings settings;

  RouteGenerator({required this.settings});

  Route<dynamic> getRoute() {
    switch (settings.name) {
      case Routes.splash:
        return getTransistionPage(const SplashView());
      case Routes.login:
        return getTransistionPage(BlocProvider(
          create: (context) => AuthBloc(),
          child: const LoginView(),
        ));
      case Routes.signup:
        return getTransistionPage(BlocProvider(
          create: (context) => AuthBloc(),
          child: const SignupView(),
        ));
      case Routes.home:
        return getTransistionPage(MultiBlocProvider(providers: [
          BlocProvider(
            create: (context) => HomeCubit(),
          ),
          BlocProvider(
            create: (context) => HomeBloc(),
          ),
        ], child: const HomeView()));
      case Routes.settings:
        return getTransistionPage(const SettingsView());
      case Routes.createLink:
        return getTransistionPage(BlocProvider(
          create: (context) => LinksBloc(),
          child: const CreateLinkView(),
        ));
      case Routes.linkDetails:
        return getTransistionPage(
            LinkDetailsView(linkId: settings.arguments as String));
      case Routes.bioLinkEdit:
        return getTransistionPage(const BioLinkEditView());
      case Routes.bioLinkBasicInfo:
        return getTransistionPage(MultiBlocProvider(
          providers: [
            BlocProvider(
              create: (context) => BioLinkBloc(),
            ),
            BlocProvider(
              create: (context) => ImageBloc(),
            ),
          ],
          child: const BasicInfoView(),
        ));
      default:
        return unDefinedRoute();
    }
  }

  getTransistionPage(Widget child) {
    return PageTransition(
      child: child,
      settings: settings,
      type: PageTransitionType.fade,
    );
  }

  static Route<dynamic> unDefinedRoute() {
    return MaterialPageRoute(
      builder: (_) => const Scaffold(
        body: Center(
          child: Text('Not Found'),
        ),
      ),
    );
  }
}
