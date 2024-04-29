import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mylingz_app/extensions/context_exten.dart';
import 'package:mylingz_app/pages/home/fragments/analytics_fragment.dart';
import 'package:mylingz_app/pages/home/fragments/dashboard_fragment.dart';
import 'package:mylingz_app/pages/home/fragments/biolink_fragment.dart';
import 'package:mylingz_app/pages/home/fragments/settings_fragment.dart';
import 'package:mylingz_app/routes/app_routes.dart';

import '../../base/base_viewmodel.dart';
import 'cubit/home_cubit.dart';

class HomeViewModel extends BaseViewModel {

  final List<Map> bottomNavItems = [
    {'label': 'Home', 'icon': Icons.home_outlined, 'active': Icons.home_rounded},
    {'label': 'Bio Link', 'icon': Icons.person_pin_outlined, 'active': Icons.person_pin_rounded},
    {'label': 'Analytics', 'icon': Icons.pie_chart_outline_outlined, 'active': Icons.pie_chart},
    {'label': 'Settings', 'icon': Icons.settings_outlined, 'active': Icons.settings}
  ];

  final List options = [
    { "label": "Stats", "icon": Icons.stacked_line_chart_sharp, "id": "stats" },
    { "label": "Edit", "icon": Icons.edit_outlined, "id": "edit" },
    { "label": "Preview", "icon": Icons.remove_red_eye_outlined, "id": "view" },
    { "label": "Share", "icon": Icons.share_outlined, "id": "share" },
  ];

  late PageController controller;
  late List<Widget> items;
  late BuildContext ctx;

  final GlobalKey<ScaffoldState> key = GlobalKey();

  HomeViewModel(BuildContext context){
    controller = PageController();
    controller = PageController()..addListener(() {
      context.read<HomeCubit>().onPageChange(controller.page!.floor());
    });

    items = [
      const DashboardFragment(),
      BioLinkFragment(vm: this),
      const AnalyticsFragment(),
      const SettingsFragment()
    ];
    ctx = context;
  }

  handleItemClick(BuildContext context, int idx){

    if(idx==3){
      context.goto(Routes.settings);
    }

    context.read<HomeCubit>().onPageChange(idx.toInt());
    controller.jumpToPage(idx.toInt());
  }
  
  @override
  dispose() {
    
  }

}