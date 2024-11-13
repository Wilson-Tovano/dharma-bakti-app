import 'package:url_launcher/url_launcher.dart';

class UrlLauncher {
  final String link;

  UrlLauncher({required this.link});

  Future<void> _launchUrl(String link) async {
    final Uri url = Uri.parse(link);
    if (await canLaunchUrl(url)) {
      await launchUrl(url);
    } else {
      throw 'Tidak bisa membuka $url';
    }
  }
}
