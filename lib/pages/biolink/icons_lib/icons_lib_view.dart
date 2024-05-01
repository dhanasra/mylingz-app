import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:mylingz_app/pages/biolink/icons_lib/icons_lib_viewmodel.dart';
import 'package:mylingz_app/widgets/styled_wrapper.dart';

class IconsLibView extends StatefulWidget {
  const IconsLibView({super.key});

  @override
  State<IconsLibView> createState() => _IconsLibViewState();
}

class _IconsLibViewState extends State<IconsLibView> {
  late IconsLibViewModel _viewModel;

  @override
  void initState() {
    _viewModel = IconsLibViewModel();
    super.initState();
  }


  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          title: const TabBar(
            tabs: [
              Tab(text: "Social"),
              Tab(text: "Communication")
            ]),
        ),
        body: Column(
          children: [
            Expanded(
              child: TabBarView(
                children: [
                  GridView.builder(
                    padding: const EdgeInsets.all(20),
                    itemCount: _viewModel.socialIcons.length,
                    gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 4,
                      mainAxisSpacing: 20,
                      crossAxisSpacing: 20  
                    ),
                    itemBuilder: (_, idx){
                      var item = _viewModel.socialIcons[idx];
                      return StyledWrapper(
                        p: const EdgeInsets.all(10),
                        child: Image.network(item.icon)
                      );
                    },
                  ),
                  GridView.builder(
                    padding: const EdgeInsets.all(20),
                    itemCount: _viewModel.communicationIcons.length,
                    gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 4,
                      mainAxisSpacing: 20,
                      crossAxisSpacing: 20  
                    ),
                    itemBuilder: (_, idx){
                      var item = _viewModel.communicationIcons[idx];
                      return StyledWrapper(
                        p: const EdgeInsets.all(10),
                        child: Image.network(item.icon)
                      );
                    },
                  ),
                ]),
            )
          ],
        ),
      ),
    );
  }
}