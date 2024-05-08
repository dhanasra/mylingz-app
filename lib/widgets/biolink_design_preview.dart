import 'package:flutter/material.dart';
import 'package:mylingz_app/constants/data_const.dart';
import 'package:mylingz_app/extensions/context_exten.dart';
import 'package:mylingz_app/extensions/number_exten.dart';
import 'package:mylingz_app/extensions/string_exten.dart';
import 'package:mylingz_app/network/models/biolink_design.dart';
import 'package:mylingz_app/utils/utils.dart';

class BioLinkDesignPreview extends StatelessWidget {
  final BioLinkDesign design;
  const BioLinkDesignPreview({super.key, required this.design});

  @override
  Widget build(BuildContext context) {

    var borderWidth = (design.outline ?? 10)/10;
    var borderRadius = (design.cornerRadius ?? 32)/4;
    Color textColor = stringToColor(design.color) ?? context.theme().textTheme.headlineSmall!.color!;
    Color? outlineColor = stringToColor(design.wrapper?.borderColor) ??  stringToColor(design.color) ?? Colors.grey[300]!;
    Color? iconColor = stringToColor(design.color) ??  Colors.grey[300]!;

    var layout = design.profileDesign?.layout;
    var alignment = layout=="layout3"
      ? CrossAxisAlignment.end : layout=="layout2" 
      ? CrossAxisAlignment.start : CrossAxisAlignment.center; 

    var textAlignment = design.profileDesign?.alignment;
    var textAlign = textAlignment=="left"
      ? Alignment.centerLeft : textAlignment=="right" 
      ? Alignment.centerRight : textAlignment=="center" ? Alignment.center : null; 

    var profileImageSize = (design.profileDesign?.size!=null
                    ? ( design.profileDesign!.size!<15 ? (design.profileDesign!.size! + 15 ): design.profileDesign!.size ) : 34)!.ceilToDouble();

    var fontFamily = design.font!=null ? (DataConst.fontFamilies.firstWhere((element) => element["name"]==design.font)["style"] as TextStyle).fontFamily : null;

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
          layout!="layout4"
          ? SizedBox(
            width: double.infinity,
            child: Column(
              crossAxisAlignment: alignment,
              children: [
                Container(
                  height: profileImageSize,
                  width: profileImageSize,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(
                      (design.profileDesign?.corner ?? 200 )
                    ),
                    image: const DecorationImage(
                      image: NetworkImage("https://firebasestorage.googleapis.com/v0/b/mylingz.appspot.com/o/placeholders%2F656c976063564c91d4930236_hero-video-1.webp?alt=media&token=61f8d858-aa8d-4a3e-bc74-12e0048a9674"),
                      fit: BoxFit.cover
                    )
                  ),
                ),
                4.h(),
                Visibility(
                  visible: textAlign!=null,
                  replacement: "Jhon Kennady".tl(context, color: textColor, fontFamily: fontFamily),
                  child: Align(
                    alignment: textAlign ?? Alignment.center,
                    child: "Jhon Kennady".tl(context, color: textColor),
                  ),
                ),
                2.h(),
                Visibility(
                  visible: textAlign!=null,
                  replacement: Text("Software Developer", style: TextStyle(fontSize: 12, color: textColor)),
                  child: Align(
                    alignment: textAlign ?? Alignment.center,
                    child: Text("Software Developer", style: TextStyle(fontSize: 12, color: textColor, fontFamily: fontFamily))),
                ),
              ],
            ),
          )
          : Row(
            children: [
              const CircleAvatar(
                radius: 34,
                backgroundImage: NetworkImage("https://firebasestorage.googleapis.com/v0/b/mylingz.appspot.com/o/placeholders%2F656c976063564c91d4930236_hero-video-1.webp?alt=media&token=61f8d858-aa8d-4a3e-bc74-12e0048a9674"),  
              ),
              8.w(),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Align(
                      alignment: textAlign ?? Alignment.centerLeft,
                      child: "Jhon Kennady".tl(context, color: textColor, fontFamily: fontFamily),
                    ),
                    2.h(),
                    Align(
                      alignment: textAlign ?? Alignment.centerLeft,
                      child: Text("Software Developer", style: TextStyle(fontSize: 12, color: textColor, fontFamily: fontFamily))),
                  ],
                ),
              )
            ],
          ),

          24.h(),

          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: ['facebook', 'instagram', 'twitter', 'snapchat'].map(
              (e) => Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8),
                child: Image.network(
                  getIconUrl(design.thumbnail?.style ?? "outlined", e), width: 32, color: design.thumbnail?.style!="gradient" ? iconColor: null),
              )).toList()
          ),

          24.h(),

          ...['Services', 'Industries', 'Products'].map((e){
            return Container(
              margin: const EdgeInsets.only(bottom: 12),
              width: double.infinity,
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(borderRadius),
                border: Border.all(color: outlineColor, width: borderWidth)
              ),
              child: e.bs(context, color: textColor, fontFamily: fontFamily)
            );
          }),

          32.h(),

          Container(
            width: double.infinity,
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(borderRadius),
              border: Border.all(color: outlineColor, width: borderWidth)
            ),
            child: Column(
              children: [
                "Contact Us".ts(context, color: textColor, fontFamily: fontFamily),
                8.h(),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    "Name".ls(context, color: textColor, fontFamily: fontFamily),
                    6.h(),
                    Container(
                      width: double.infinity,
                      padding: const EdgeInsets.all(12),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(borderRadius),
                        border: Border.all(color: outlineColor, width: borderWidth)
                      ),
                      alignment: Alignment.centerLeft,
                      child: "Enter your name".bs(context, color: textColor.withOpacity(0.5), fontFamily: fontFamily)
                    ),
                  ],
                ),
                8.h(),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    "Email".ls(context, color: textColor, fontFamily: fontFamily),
                    6.h(),
                    Container(
                      width: double.infinity,
                      padding: const EdgeInsets.all(12),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(borderRadius),
                        border: Border.all(color: outlineColor, width: borderWidth)
                      ),
                      alignment: Alignment.centerLeft,
                      child: "Enter your email".bs(context, color: textColor.withOpacity(0.5), fontFamily: fontFamily)
                    ),
                  ],
                ),
                24.h(),
                Container(
                  width: double.infinity,
                  padding: const EdgeInsets.all(12),
                  decoration: BoxDecoration(
                    color: stringToColor(design.actionBtnStyle?.bgColor) ?? Colors.transparent,
                    borderRadius: BorderRadius.circular(borderRadius),
                    border: Border.all(color: stringToColor(design.actionBtnStyle?.borderColor) ??  outlineColor, width: borderWidth)
                  ),
                  child: "SEND".bs(context, color: stringToColor(design.actionBtnStyle?.color) ?? textColor, fontFamily: fontFamily)
                ),
              ],
            ),
          )
        ],
      )
    );
  }
}