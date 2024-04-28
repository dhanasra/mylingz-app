import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mylingz_app/pages/home/fragments/analytics_fragment.dart';
import 'package:mylingz_app/pages/home/fragments/dashboard_fragment.dart';
import 'package:mylingz_app/pages/home/fragments/products_fragment.dart';
import 'package:mylingz_app/pages/home/fragments/settings_fragment.dart';

import '../../base/base_viewmodel.dart';
import 'cubit/home_cubit.dart';

class HomeViewModel extends BaseViewModel {

  final List<Map> bottomNavItems = [
    {'label': 'Home', 'icon': Icons.home_outlined, 'active': Icons.home_rounded},
    {'label': 'Products', 'icon': Icons.add_box_outlined, 'active': Icons.add_box},
    {'label': 'Analytics', 'icon': Icons.pie_chart_outline_outlined, 'active': Icons.pie_chart},
    {'label': 'Settings', 'icon': Icons.settings_outlined, 'active': Icons.settings}
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
      const ProductsFragment(),
      const AnalyticsFragment(),
      const SettingsFragment()
    ];
    ctx = context;
  }

  handleItemClick(BuildContext context, int idx){

    context.read<HomeCubit>().onPageChange(idx.toInt());
    controller.jumpToPage(idx.toInt());
  }
  
  @override
  dispose() {
    
  }

}