import 'package:flutter/material.dart';
import 'package:mylingz_app/constants/color_const.dart';
import 'package:mylingz_app/extensions/context_exten.dart';
import 'package:mylingz_app/extensions/number_exten.dart';
import 'package:mylingz_app/extensions/string_exten.dart';
import 'package:mylingz_app/routes/app_routes.dart';
import 'package:mylingz_app/utils/global.dart';
import 'package:mylingz_app/utils/utils.dart';
import 'package:mylingz_app/widgets/dotted_wrapper.dart';
import 'package:mylingz_app/widgets/styled_button.dart';
import 'package:mylingz_app/widgets/styled_wrapper.dart';

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
                    if(biolink.slogan!=null)
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
                ):  GridView.builder(
                  
                  padding: const EdgeInsets.symmetric(horizontal: 40),
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: biolink.icons.length<4 ? biolink.icons.length : 4,
                    mainAxisSpacing: 20,
                    crossAxisSpacing: 20,
                    childAspectRatio: 1
                  ), 
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: biolink.icons.length,
                  itemBuilder: (_, idx){
                    return Image.network(getIconUrl("colored", biolink.icons[idx].name.toLowerCase()));
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
                        align: Alignment.center,
                        m: const EdgeInsets.all(10),
                        p: const EdgeInsets.all(16),
                        r: 100,
                        child: (biolink.buttons[idx].text).trim().tl(context)),
                    );
                  }
                )
              ),
              16.h(),
              DottedWrapper(
                p: EdgeInsets.zero,
                onClick: ()=>{
                  context.goto(Routes.contactFields).then((value) => setState(() {}))
                },
                child: biolink.contactFields.isEmpty
                ? Padding(
                  padding: const EdgeInsets.all(16),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(Icons.add, color: Theme.of(context).primaryColor),
                      8.w(),
                      "Add Contact Form".ts(context, color: Theme.of(context).primaryColor)
                    ],
                  ),
                ): AbsorbPointer(
                  child: Container(
                    margin: const EdgeInsets.all(0),
                    padding: const EdgeInsets.all(16),
                    decoration: BoxDecoration(
                      border: Border.all(color: ColorConst.primaryLight),
                      borderRadius: BorderRadius.circular(8)
                    ),
                    child: Column(
                      children: [
                        "Contact Us".hm(context),
                        24.h(),
                        ...biolink.contactFields.map(
                          (e) => Padding(
                            padding: const EdgeInsets.only(bottom: 16),
                            child: TextFormField(
                              decoration: InputDecoration(
                                labelText: e.label
                              ),
                            ),
                          )),
                        32.h(),
                        StyledButton(onClick: (){}, text: "Submit Request"),
                        16.h(),
                        "By Submitting Your Contact Details, You Allow The Link Owner To Contact You".bs(context, color: Colors.grey)
                      ],
                    ),
                  ),
                )
              ),
            ],
          );
        }
      ),
    );
  }
}