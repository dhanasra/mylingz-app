import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mylingz_app/network/models/form_message.dart';
import 'package:mylingz_app/network/models/short_link.dart';
import 'package:mylingz_app/network/models/social_icon.dart';
import 'package:mylingz_app/pages/auth/login/login_view.dart';
import 'package:mylingz_app/pages/auth/signup/signup_view.dart';
import 'package:mylingz_app/pages/biolink/analytics/biolink_analytics_view.dart';
import 'package:mylingz_app/pages/biolink/basic_info/basic_info_view.dart';
import 'package:mylingz_app/pages/biolink/buttons/buttons_view.dart';
import 'package:mylingz_app/pages/biolink/contact_fields/contact_fields_view.dart';
import 'package:mylingz_app/pages/biolink/design/biolink_design_view.dart';
import 'package:mylingz_app/pages/biolink/edit/biolink_edit_view.dart';
import 'package:mylingz_app/pages/biolink/icon_create/icon_create_view.dart';
import 'package:mylingz_app/pages/biolink/message_details/message_details_view.dart';
import 'package:mylingz_app/pages/biolink/messages/messages_view.dart';
import 'package:mylingz_app/pages/biolink/promote/promote_view.dart';
import 'package:mylingz_app/pages/biolink/social_icons/social_icons_view.dart';
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
import '../pages/settings/bloc/account_bloc.dart';
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
  static const bioLinkAnalytics = '/bioLinkAnalytics';
  static const bioLinkBasicInfo = '/bioLinkBasicInfo';
  static const contactFields = '/contactFields';
  static const bioLinkButtons = '/bioLinkButtons';
  static const bioLinkIcons = '/bioLinkIcons';
  static const iconsLib = '/iconsLib';
  static const iconsCreate = '/iconCreate';
  static const promote = '/promote';
  static const formMessages = '/formMessages';
  static const messageDetails = '/messageDetails';
  static const design = '/design';
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
        return getTransistionPage(BlocProvider(
          create: (context) => AccountBloc(),
          child: const SettingsView(),
        ));
      case Routes.createLink:
        return getTransistionPage(BlocProvider(
          create: (context) => LinksBloc(),
          child: CreateLinkView(link: settings.arguments as ShortLink?),
        ));
      case Routes.linkDetails:
        var linkId = settings.arguments as String;
        return getTransistionPage(BlocProvider(
          create: (context) => LinksBloc(),
          child: LinkDetailsView(linkId: linkId),
        ));
      case Routes.bioLinkEdit:
        return getTransistionPage(const BioLinkEditView());
      case Routes.bioLinkAnalytics:
        return getTransistionPage(BlocProvider(
          create: (context) => BioLinkBloc()..add(GetBioLinkAnalyticsEvent()),
          child: const BioLinkAnalyticsView(),
        ));
      case Routes.bioLinkIcons:
        return getTransistionPage(BlocProvider(
          create: (context) => BioLinkBloc(),
          child: const SocialIconsView(),
        ));
      case Routes.bioLinkButtons:
        return getTransistionPage(BlocProvider(
          create: (context) => BioLinkBloc(),
          child: const ButtonsView(),
        ));
      case Routes.contactFields:
        return getTransistionPage(BlocProvider(
          create: (context) => BioLinkBloc(),
          child: const ContactFieldsView(),
        ));
      case Routes.iconsCreate:
        return getTransistionPage(BlocProvider(
            create: (context) => BioLinkBloc(),
            child: IconCreateView(icon: settings.arguments as SocialIcon)));
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
      case Routes.promote:
        return getTransistionPage(BlocProvider(
          create: (context) => BioLinkBloc(),
          child: const PromoteView(),
        ));
      case Routes.formMessages:
        return getTransistionPage(BlocProvider(
          create: (context) => BioLinkBloc()..add(GetFormMessagesEvent()),
          child: const MessagesView(),
        ));
      case Routes.messageDetails:
        return getTransistionPage(BlocProvider(
          create: (context) => BioLinkBloc(),
          child: MessageDetailsView(message: settings.arguments as FormMessage),
        ));
      case Routes.design:
        return getTransistionPage(BlocProvider(
          create: (context) => BioLinkBloc(),
          child: const BioLinkDesignView(),
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
