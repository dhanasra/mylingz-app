import 'package:flutter/material.dart';
import 'package:mylingz_app/extensions/context_exten.dart';
import 'package:mylingz_app/extensions/number_exten.dart';
import 'package:mylingz_app/extensions/string_exten.dart';
import 'package:mylingz_app/routes/app_routes.dart';
import 'package:mylingz_app/utils/global.dart';
import 'package:mylingz_app/widgets/dotted_wrapper.dart';
import 'package:mylingz_app/widgets/styled_wrapper.dart';

import '../../../widgets/styled_button.dart';

class BioLinkEditView extends StatefulWidget {
  const BioLinkEditView({super.key});

  @override
  State<BioLinkEditView> createState() => _BioLinkEditViewState();
}

class _BioLinkEditViewState extends State<BioLinkEditView> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Edit BioLink"),
      ),
      body: ValueListenableBuilder(
        valueListenable: Global.bioLink,
        builder: (_, biolink, __) {
          return ListView(
            padding: const EdgeInsets.all(20),
            children: [
              DottedWrapper(
                onClick: ()=>context.goto(Routes.bioLinkBasicInfo),
                child: Column(
                  children: [
                    StyledWrapper(
                      r: 100,
                      child: CircleAvatar(
                        radius: 50,
                        backgroundImage: biolink!.picture!=null
                          ? NetworkImage(biolink.picture!) 
                          : null
                      ),
                    ),
                    16.h(),
                    biolink.title.hm(context),
                    6.h(),
                    biolink.slogan?.ts(context)
                  ],
                )
              ),
              16.h(),
              DottedWrapper(
                onClick: ()=>context.goto(Routes.bioLinkIcons),
                child: biolink.icons.isEmpty
                ? Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.add, color: Theme.of(context).primaryColor),
                    8.w(),
                    "Add Social Links".ts(context, color: Theme.of(context).primaryColor)
                  ],
                ): GridView.builder(
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 3,
                    mainAxisSpacing: 16,
                    crossAxisSpacing: 16,
                    childAspectRatio: 3
                  ), 
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: biolink.icons.length,
                  itemBuilder: (_, idx){
                    return const Icon(Icons.abc);
                  }
                )
              ),
              16.h(),
              DottedWrapper(
                onClick: ()=>{
                  context.goto(Routes.bioLinkButtons).then((value) => setState(() {}))
                },
                child: biolink.buttons.isEmpty
                ? Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.add, color: Theme.of(context).primaryColor),
                    8.w(),
                    "Add Buttons".ts(context, color: Theme.of(context).primaryColor)
                  ],
                ): ListView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: biolink.buttons.length,
                  itemBuilder: (_, idx){
                    return AbsorbPointer(
                      child: StyledWrapper(
                        m: const EdgeInsets.all(10),
                        child: StyledButton(
                          onClick: (){}, 
                          secondary: true,
                          text: (biolink.buttons[idx].text).trim()
                        )),
                    );
                  }
                )
              ),
              16.h(),
              DottedWrapper(
                child: biolink.icons.isEmpty
                ? Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.add, color: Theme.of(context).primaryColor),
                    8.w(),
                    "Add Contact Form".ts(context, color: Theme.of(context).primaryColor)
                  ],
                ): ListView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: biolink.icons.length,
                  itemBuilder: (_, idx){
                    return StyledWrapper(
                      p: const EdgeInsets.all(8),
                      child: "Button Label".tl(context));
                  }
                )
              ),
            ],
          );
        }
      ),
    );
  }
}