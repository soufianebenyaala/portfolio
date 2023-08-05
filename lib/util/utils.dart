import 'dart:async';
import 'package:url_launcher/url_launcher.dart';
import 'package:share_plus/share_plus.dart';

abstract class Utils {
  static Future<void> openWebsite(
      {required String host, required String path}) async {
    final Uri websiteLaunchUri = Uri(
      scheme: 'https',
      host: host,
      path: path,
    );
    try {
      await launchUrl(
        websiteLaunchUri,
        mode: LaunchMode.externalApplication,
      );
    } catch (e) {
      print(e);
    }
  }

  static Future<void> emailSender() async {
    final Uri emailLaunchUri = Uri(
      scheme: 'mailto',
      path: 'benyaala.soufiane@gmail.com',
    );
    try {
      if (await canLaunchUrl(emailLaunchUri)) {
        launchUrl(emailLaunchUri);
      }
    } catch (e) {
      print(e);
    }
  }

  static void sharePressed() {}
}
