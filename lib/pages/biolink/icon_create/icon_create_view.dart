import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:mylingz_app/network/models/social_icon.dart';

import '../forms/contact_form.dart';
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
import 'icon_create_viewmodel.dart';

class IconCreateView extends StatefulWidget {
  final SocialIcon icon;
  const IconCreateView({super.key, required this.icon});

  @override
  State<IconCreateView> createState() => _IconCreateViewState();
}

class _IconCreateViewState extends State<IconCreateView> {
  late IconCreateViewModel _viewModel;

  @override
  void initState() {
    _viewModel = IconCreateViewModel();
    super.initState();
  }


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
              const TextForm()
            else if(widget.icon.name=="Website")
              const WebsiteForm()
            else if(widget.icon.name=="Wifi")
              const WifiForm()
            else if(widget.icon.name=="Phone")
              const PhoneForm()
            else if(widget.icon.name=="Email")
              const EmailForm()
            else if(widget.icon.name=="SMS")
              const SmsForm() 
            else if(widget.icon.name=="Contact")
              const ContactForm()
            else if(widget.icon.name=="Event")
              const EventForm()
            else if(widget.icon.name=="VCard")
              const VcardForm()
            else if(widget.icon.name=="Youtube")
              const YoutubeForm()
            else if(widget.icon.name=="Facebook")
              const FacebookForm()
            else if(widget.icon.name=="Spotify")
              const SpotifyForm()
            else if(widget.icon.name=="Crypto")
              const CryptoForm()
            else if(widget.icon.name=="Pinterest")
              SocialForm(link: widget.icon)
            else if(widget.icon.name=="Line")
              SocialForm(link: widget.icon)
            else if(widget.icon.name=="Wechat")
              SocialForm(link: widget.icon)
            else if(widget.icon.name=="Paypal")
              SocialForm(link: widget.icon)
            else if(widget.icon.name=="Snapchat")
              SocialForm(link: widget.icon)
            else if(widget.icon.name=="Linkedin")
              SocialForm(link: widget.icon)
            else if(widget.icon.name=="TikTok")
              SocialForm(link: widget.icon)
            else if(widget.icon.name=="X")
              SocialForm(link: widget.icon)
            else if(widget.icon.name=="Instagram")
              SocialForm(link: widget.icon)
            else if(widget.icon.name=="Whatsapp")
              SocialForm(link: widget.icon)
            else if(widget.icon.name=="Viber")
              SocialForm(link: widget.icon)
          ],
        ),
      ),
    );
  }
}