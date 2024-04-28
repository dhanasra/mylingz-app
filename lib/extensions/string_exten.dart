import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

extension TextExtensions on String {

  hl(BuildContext context, {TextAlign? align}){
    return Text(this, textAlign: align, style: Theme.of(context).textTheme.headlineLarge).tr();
  }

  hm(BuildContext context, {TextAlign? align}){
    return Text(this, textAlign: align, style: Theme.of(context).textTheme.headlineMedium).tr();
  }
  
  hs(BuildContext context){
    return Text(this, style: Theme.of(context).textTheme.headlineSmall).tr();
  }

  tl(BuildContext context, {int? maxLines, Color? color}){
    return Text(this, maxLines: maxLines, style: Theme.of(context).textTheme.titleLarge!.copyWith(
      color: color
    )).tr();
  }

  ts(BuildContext context, {Color? color, TextAlign? align, bool isLink = false}){
    return Text(this, textAlign: align, style: Theme.of(context).textTheme.titleSmall!.copyWith(
      color: color ?? (isLink ? const Color(0xFF0000FF) : null), 
      decoration: isLink ? TextDecoration.underline : null,
      decorationColor: const Color(0xFF0000FF)
    )).tr();
  }

  bs(BuildContext context, {Color? color}){
    return Text(this, textAlign: TextAlign.center, style: Theme.of(context).textTheme.bodySmall!.copyWith(
      color: color
    )).tr();
  }

  ls(BuildContext context, {Color? color}){
    return Text(this, textAlign: TextAlign.center, style: Theme.of(context).textTheme.labelSmall!.copyWith(
      color: color
    )).tr();
  }

  String? removeHttps(){
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