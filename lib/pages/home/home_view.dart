import 'package:animated_bottom_navigation_bar/animated_bottom_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mylingz_app/extensions/context_exten.dart';
import 'package:mylingz_app/extensions/number_exten.dart';
import 'package:mylingz_app/extensions/string_exten.dart';
import 'package:mylingz_app/routes/app_routes.dart';

import '../../widgets/drawer_dialog.dart';
import '../../widgets/home_drawer.dart';
import 'cubit/home_cubit.dart';
import 'home_viewmodel.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  late HomeViewModel _viewModel;

  @override
  void initState() {
    _viewModel = HomeViewModel(context);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeCubit, int>(
      builder: (_, idx) {

        return Scaffold(
          key: _viewModel.key,
          endDrawer: const DrawerDialog(
            child: HomeDrawer()),
          floatingActionButton: FloatingActionButton(
            child: const Icon(Icons.add),
            onPressed: ()=>context.goto(Routes.createLink)),
          floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
          appBar: AppBar(
            automaticallyImplyLeading: false,
            title: const Text("MYLingz"),
            centerTitle: false,
            actions: [
              IconButton(onPressed: (){
                _viewModel.key.currentState?.openEndDrawer();
              }, icon: const Icon(Icons.menu)),
              8.w()
            ],
          ),
          body: PageView.builder(
            controller: _viewModel.controller,
            itemCount: _viewModel.items.length,
            itemBuilder: (_, idx)=>_viewModel.items[idx]
          ),
          bottomNavigationBar: AnimatedBottomNavigationBar.builder(
            itemCount: 4,
            gapLocation: GapLocation.center,
            notchSmoothness: NotchSmoothness.softEdge,
            leftCornerRadius: 16,
            rightCornerRadius: 16,
            height: 60,
            backgroundColor: Theme.of(context).scaffoldBackgroundColor,
            tabBuilder: (idx, isActive){
              return Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(4),
                    child: Icon(
                      isActive 
                        ? _viewModel.bottomNavItems[idx]['active']: _viewModel.bottomNavItems[idx]['icon'],
                      color: isActive ? context.theme().primaryColor: Colors.grey[400],    
                    )  
                  ),
                  '${_viewModel.bottomNavItems[idx]['label']}'.bs(context, 
                      color: isActive ? context.theme().primaryColor: Colors.grey[400])
                ],
              );
            },
            activeIndex: idx,
            onTap: (idx)=>_viewModel.handleItemClick(context, idx)
          ),
        );
      }
    );
  }
}