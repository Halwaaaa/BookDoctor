import 'package:url_launcher/url_launcher.dart';

class EmailSender {
  static send() async {
    final Uri params = Uri(
      scheme: 'mailto',
      path: 'halwadev@gmail.com',
      query: 'subject=Email subject&body=Email body',
    );

    Uri url = params;

    if (await canLaunchUrl(url)) {
      await launchUrl(url);
    } else {
      print('لا يمكن فتح عميل البريد الإلكتروني.');
    }
  }
}
