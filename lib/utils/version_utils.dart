import 'dart:convert';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:http/http.dart' as http;
import 'package:package_info_plus/package_info_plus.dart';
import 'package:r_upgrade/r_upgrade.dart';

Future<void> checkUploadLatestVersion() async {
  final List<ConnectivityResult> connectivityResult =
      await (Connectivity().checkConnectivity());
  if (connectivityResult.contains(ConnectivityResult.wifi)) {
    try {
      final response = await http.get(Uri.parse(
          'https://api.github.com/repos/mrzhangboss/ai_news/releases/latest'));
      if (response.statusCode == 200) {
        final json = jsonDecode(response.body);
        final latestVersion = json['tag_name'];
        PackageInfo packageInfo = await PackageInfo.fromPlatform();
        String version = packageInfo.version;
        String gitVersion = latestVersion.replaceAll('v', '').split('+').first;
        if (gitVersion != version) {
          final apkUrl =
              "https://github.com/mrzhangboss/ai_news/releases/download/${latestVersion}/app-arm64-v8a-release.apk";
          int? id = await RUpgrade.upgrade(
            apkUrl,
            installType: RUpgradeInstallType.normal,
          );
        }
      }
    } catch (e) {
      print(e);
    }
  }
}
