import 'package:flutter/material.dart';
import 'package:senacor_devcon_mysafe/settings/display_settings.dart';
import 'package:senacor_devcon_mysafe/settings/notification_settings.dart';
import 'package:senacor_devcon_mysafe/settings/security_settings.dart';

class Settings extends StatelessWidget {
  const Settings({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        ListTile(
          leading: const Icon(Icons.display_settings),
          title: const Text('Display'),
          trailing: const Icon(Icons.arrow_right_sharp),
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const DisplaySettings()),
            );
          },
        ),
        ListTile(
          leading: const Icon(Icons.security),
          title: const Text('Security'),
          trailing: const Icon(Icons.arrow_right_sharp),
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const SecuritySettings()),
            );
          },
        ),
        ListTile(
          leading: const Icon(Icons.notifications),
          title: const Text('Notifications'),
          trailing: const Icon(Icons.arrow_right_sharp),
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => const NotificationSettings()),
            );
          },
        )
      ],
    );
  }
}
