import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:mylingz_app/extensions/context_exten.dart';

extension TextExtensions on String {

  ds(BuildContext context, {TextAlign? align, String? fontFamily}){
    return Text(this, textAlign: align, style: Theme.of(context).textTheme.displaySmall!.copyWith(
      fontFamily: fontFamily
    )).tr();
  }

  hl(BuildContext context, {TextAlign? align}){
    return Text(this, textAlign: align, style: Theme.of(context).textTheme.headlineLarge).tr();
  }

  hm(BuildContext context, {TextAlign? align, bool elipsis = false}){
    return Text(this, textAlign: align, overflow: elipsis ? TextOverflow.ellipsis: null, style: Theme.of(context).textTheme.headlineMedium).tr();
  }
  
  hs(BuildContext context){
    return Text(this, style: Theme.of(context).textTheme.headlineSmall).tr();
  }

  tl(BuildContext context, {int? maxLines, TextAlign? align, Color? color, bool isLink = false, String? fontFamily}){
    return Text(this, textAlign: align, maxLines: maxLines, style: Theme.of(context).textTheme.titleLarge!.copyWith(
      color: color ?? (isLink ? context.theme().secondaryHeaderColor : null),
      decoration: isLink ? TextDecoration.underline : null,
      decorationColor: context.theme().secondaryHeaderColor,
      fontFamily: fontFamily
    )).tr();
  }

  ts(BuildContext context, {Color? color, TextAlign? align, bool isLink = false, bool light = false, String? fontFamily}){
    return Text(this, textAlign: align, style: Theme.of(context).textTheme.titleSmall!.copyWith(
      color: color ?? (isLink ? context.theme().secondaryHeaderColor : null), 
      decoration: isLink ? TextDecoration.underline : null,
      decorationColor: context.theme().secondaryHeaderColor, 
      fontWeight: light ? FontWeight.w400 : null,
      fontFamily: fontFamily
    )).tr();
  }

  bs(BuildContext context, {Color? color, bool light = false, String? fontFamily}){
    return Text(this, textAlign: TextAlign.center, style: Theme.of(context).textTheme.bodySmall!.copyWith(
      color: color, fontWeight: light ? FontWeight.w500 : null,
      fontFamily: fontFamily
    )).tr();
  }

  ls(BuildContext context, {Color? color, String? fontFamily}){
    return Text(this, textAlign: TextAlign.center, style: Theme.of(context).textTheme.labelSmall!.copyWith(
      color: color,
      fontFamily: fontFamily
    )).tr();
  }

  String removeHttps(){
    if (startsWith('https://')) {
      return substring(8);
    } else {
      return this;
    }
  }
}

extension ControllerExtension on TextEditingController {

  String trim(){
    return text.trim();
  }

  String? trimNull(){
    return text.trim().isEmpty ? null : text.trim();
  }

}