import 'dart:async';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:path_provider/path_provider.dart';
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

  static void onShareXFileFromAssets(BuildContext context) async {
    final byteData =
        await rootBundle.load('assets/files/CV Soufiane BenYaala.pdf');

    final file = File(
        '${(await getTemporaryDirectory()).path}/CV Soufiane BenYaala.pdf');
    await file.writeAsBytes(byteData.buffer
        .asUint8List(byteData.offsetInBytes, byteData.lengthInBytes));

    XFile xFile = XFile(file.path);
    final shareResult = await Share.shareXFiles(
      [
        xFile,
      ],
    );

    // scaffoldMessenger.showSnackBar(
    //   SnackBar(
    //     content: Column(
    //       mainAxisSize: MainAxisSize.min,
    //       crossAxisAlignment: CrossAxisAlignment.start,
    //       children: [
    //         Text("Share result: ${shareResult.status}"),
    //         if (shareResult.status == ShareResultStatus.success)
    //           Text("Shared to: ${shareResult.raw}")
    //       ],
    //     ),
    //   ),
    // );
  }
}
