import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:mylingz_app/network/models/social_icon.dart';

import '../forms/crypto_form.dart';
import '../forms/email_form.dart';
import '../forms/event_form.dart';
import '../forms/facebook_form.dart';
import '../forms/phone_form.dart';
import '../forms/sms_form.dart';
import '../forms/social_form.dart';
import '../forms/spotify_form.dart';
import '../forms/text_form.dart';
import '../forms/vcard_form.dart';
import '../forms/website_form.dart';
import '../forms/wifi_form.dart';
import '../forms/youtube_form.dart';

class IconCreateView extends StatefulWidget {
  final SocialIcon icon;
  const IconCreateView({super.key, required this.icon});

  @override
  State<IconCreateView> createState() => _IconCreateViewState();
}

class _IconCreateViewState extends State<IconCreateView> {

  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
      appBar: AppBar(
        title: const Text("Create Social Icon").tr(),
        centerTitle: false,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: ListView(
          children: [
            if(widget.icon.name=="Text")
              TextForm(icon: widget.icon,)
            else if(widget.icon.name=="Website")
              WebsiteForm(icon: widget.icon)
            else if(widget.icon.name=="Wifi")
              WifiForm(icon: widget.icon)
            else if(widget.icon.name=="Phone")
              PhoneForm(icon: widget.icon)
            else if(widget.icon.name=="Email")
              EmailForm(icon: widget.icon)
            else if(widget.icon.name=="SMS")
              SmsForm(icon: widget.icon) 
            else if(widget.icon.name=="Event")
              EventForm(icon: widget.icon)
            else if(widget.icon.name=="VCard")
              VcardForm(icon: widget.icon)
            else if(widget.icon.name=="Youtube")
              YoutubeForm(icon: widget.icon)
            else if(widget.icon.name=="Facebook")
              FacebookForm(icon: widget.icon)
            else if(widget.icon.name=="Spotify")
              SpotifyForm(icon: widget.icon)
            else if(widget.icon.name=="Crypto")
              CryptoForm(icon: widget.icon)
            else if(widget.icon.name=="Pinterest")
              SocialForm(icon: widget.icon)
            else if(widget.icon.name=="Line")
              SocialForm(icon: widget.icon)
            else if(widget.icon.name=="Wechat")
              SocialForm(icon: widget.icon)
            else if(widget.icon.name=="Paypal")
              SocialForm(icon: widget.icon)
            else if(widget.icon.name=="Snapchat")
              SocialForm(icon: widget.icon)
            else if(widget.icon.name=="Linkedin")
              SocialForm(icon: widget.icon)
            else if(widget.icon.name=="TikTok")
              SocialForm(icon: widget.icon)
            else if(widget.icon.name=="X")
              SocialForm(icon: widget.icon)
            else if(widget.icon.name=="Instagram")
              SocialForm(icon: widget.icon)
            else if(widget.icon.name=="Whatsapp")
              SocialForm(icon: widget.icon)
            else if(widget.icon.name=="Viber")
              SocialForm(icon: widget.icon)
          ],
        ),
      ),
    );
  }
}