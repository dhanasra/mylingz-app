import 'package:flutter/material.dart';
import 'package:mylingz_app/extensions/context_exten.dart';
import 'package:mylingz_app/extensions/number_exten.dart';
import 'package:mylingz_app/extensions/string_exten.dart';
import 'package:mylingz_app/utils/utils.dart';

class BioLinkDesignPreview extends StatelessWidget {
  const BioLinkDesignPreview({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      margin: const EdgeInsets.symmetric(vertical: 12),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: Colors.grey, width: 3)
      ),
      child: Column(
        children: [
          const CircleAvatar(
            radius: 34,
            backgroundImage: NetworkImage("https://imagesbucketaws.s3.ap-south-1.amazonaws.com/doctor/2024-05-07T14%3A47%3A03.777Z-2024-05-07T13_59_54.887Z-icons8-google-96.png"),  
          ),
          4.h(),
          Align(
            alignment: Alignment.center,
            child: "Jhon Kennady".tl(context),
          ),
          2.h(),
          const Align(
            alignment: Alignment.center,
            child: Text("Software Developer", style: TextStyle(fontSize: 12)),
          ),

          24.h(),

          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.network(getIconUrl('outlined', 'facebook'), width: 24),
              16.w(),
              Image.network(getIconUrl('outlined', 'instagram'), width: 24),
              16.w(),
              Image.network(getIconUrl('outlined', 'twitter'), width: 24),
              16.w(),
              Image.network(getIconUrl('outlined', 'snapchat'), width: 24)
            ],
          ),

          24.h(),

          Container(
            width: double.infinity,
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              border: Border.all(color: context.theme().dialogBackgroundColor)
            ),
            child: "Services".bs(context)
          ),
          12.h(),
          Container(
            width: double.infinity,
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              border: Border.all(color: context.theme().dialogBackgroundColor)
            ),
            child: "Industries".bs(context)
          ),
          12.h(),
          Container(
            width: double.infinity,
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              border: Border.all(color: context.theme().dialogBackgroundColor)
            ),
            child: "Products".bs(context)
          ),

          32.h(),

          Container(
            width: double.infinity,
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              border: Border.all(color: context.theme().dialogBackgroundColor)
            ),
            child: Column(
              children: [
                "Contact Us".ts(context),
                8.h(),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    "Name".ls(context),
                    6.h(),
                    Container(
                      width: double.infinity,
                      padding: const EdgeInsets.all(12),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        border: Border.all(color: context.theme().dialogBackgroundColor)
                      ),
                      child: "Enter your name".bs(context)
                    ),
                  ],
                ),
                8.h(),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    "Email".ls(context),
                    6.h(),
                    Container(
                      width: double.infinity,
                      padding: const EdgeInsets.all(12),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        border: Border.all(color: context.theme().dialogBackgroundColor)
                      ),
                      child: "Enter your email".bs(context)
                    ),
                  ],
                ),
                24.h(),
                Container(
                  width: double.infinity,
                  padding: const EdgeInsets.all(12),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    border: Border.all(color: context.theme().dialogBackgroundColor)
                  ),
                  child: "SEND".bs(context)
                ),
              ],
            ),
          )
        ],
      )
    );
  }
}