import 'dart:async';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:path_provider/path_provider.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:share_plus/share_plus.dart';

abstract class Utils {
    static Future<FilePickerResult?> showFilesPicker() async {
    PermissionStatus permissionStatus = await getStoragePermission();
    if (permissionStatus == PermissionStatus.granted) {
      return await FilePicker.platform.pickFiles(
        allowMultiple: true,
      );
    } else {
      handleInvalidPermissions(
          permissionStatus: permissionStatus, typePermission: "storage");
      return null;
    }
  }

  static Future<PermissionStatus> getStoragePermission() async {
    PermissionStatus permission = await Permission.storage.status;
    if (permission != PermissionStatus.granted &&
        permission != PermissionStatus.permanentlyDenied) {
      PermissionStatus permissionStatus = await Permission.storage.request();
      return permissionStatus;
    } else {
      return permission;
    }
  }

  static Future<void> askContactPermissions() async {
    PermissionStatus permissionStatus = await getContactPermission();
    if (permissionStatus == PermissionStatus.granted) {
      Utils.openPageWithRightSlide(GetPhoneContactsPage());
    } else {
      handleInvalidPermissions(
          permissionStatus: permissionStatus, typePermission: "contact");
    }
  }

  static Future<PermissionStatus> getContactPermission() async {
    PermissionStatus permission = await Permission.contacts.status;
    if (permission != PermissionStatus.granted &&
        permission != PermissionStatus.permanentlyDenied) {
      PermissionStatus permissionStatus = await Permission.contacts.request();
      return permissionStatus;
    } else {
      return permission;
    }
  }

  static void handleInvalidPermissions(
      {required PermissionStatus permissionStatus,
      required String typePermission}) {
    if (permissionStatus == PermissionStatus.denied) {
      OverlayMessageUtils.showErrorOverlayMessage(
          'Access to $typePermission data denied . please add permission !');
    } else if (permissionStatus == PermissionStatus.permanentlyDenied) {
      OverlayMessageUtils.showErrorOverlayMessage(
          'Access to $typePermission data permanently denied. please add permission !');
    }
  }
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
