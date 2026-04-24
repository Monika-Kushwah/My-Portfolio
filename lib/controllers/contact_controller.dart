import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:url_launcher/url_launcher.dart';

class ContactController extends GetxController {
  final nameCtrl    = TextEditingController();
  final emailCtrl   = TextEditingController();
  final messageCtrl = TextEditingController();

  Future<void> launch(String url) async {
    final uri = Uri.parse(url);
    if (await canLaunchUrl(uri)) await launchUrl(uri);
  }

  Future<void> sendMail() async {
    final subject = Uri.encodeComponent('Portfolio Inquiry');
    final body = Uri.encodeComponent(
        'Name: ${nameCtrl.text}\nEmail: ${emailCtrl.text}\n\n${messageCtrl.text}');
    await launch('mailto:kushwahMonika206@gmail.com?subject=$subject&body=$body');
  }

  Future<void> openLinkedIn() => launch('https://www.linkedin.com/in/monika-kushwah-4463a61a3');
  Future<void> openGitHub()   => launch('https://github.com/Monika-Kushwah');
  Future<void> openPhone()    => launch('tel:+918959711745');
  Future<void> openEmail()    => launch('mailto:kushwahMonika206@gmail.com');

  @override
  void onClose() {
    nameCtrl.dispose();
    emailCtrl.dispose();
    messageCtrl.dispose();
    super.onClose();
  }
}
