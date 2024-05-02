import 'package:flutter/material.dart';
import 'package:mylingz_app/extensions/context_exten.dart';
import 'package:mylingz_app/widgets/styled_wrapper.dart';
import '../../../../utils/global.dart';

class IconsLibView extends StatelessWidget {
  final ValueChanged onClick;
  const IconsLibView({super.key, required this.onClick});

  @override
  Widget build(BuildContext context) {

    var socialIcons = Global.icons.where((e) => e.category=="Social").toList();
    var communicationIcons = Global.icons.where((e) => e.category=="Communication").toList();

    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
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
                    itemCount: socialIcons.length,
                    gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 4,
                      mainAxisSpacing: 20,
                      crossAxisSpacing: 20  
                    ),
                    itemBuilder: (_, idx){
                      var item = socialIcons[idx];
                      return StyledWrapper(
                        onClick: (){
                          context.back();
                          onClick(item);
                        },
                        p: const EdgeInsets.all(10),
                        child: Image.network(item.icon)
                      );
                    },
                  ),
                  GridView.builder(
                    padding: const EdgeInsets.all(20),
                    itemCount: communicationIcons.length,
                    gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 4,
                      mainAxisSpacing: 20,
                      crossAxisSpacing: 20  
                    ),
                    itemBuilder: (_, idx){
                      var item = communicationIcons[idx];
                      return StyledWrapper(
                        onClick: (){
                          context.back();
                          onClick(item);
                        },
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