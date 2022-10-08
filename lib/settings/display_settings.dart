import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:senacor_devcon_mysafe/settings/preferences/preferences.dart';

class DisplaySettings extends StatelessWidget {
  const DisplaySettings({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Display Settings'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const Text('Theme Preferences'),
            Padding(
              padding: const EdgeInsets.fromLTRB(0, 8, 0, 0),
              child: Card(
                child: ListView(
                  shrinkWrap: true,
                  children: [
                    Consumer<Preferences>(
                      builder: (context, Preferences preferences, child) {
                        return SwitchListTile(
                          title: const Text('Dark Mode'),
                          subtitle:
                              const Text('Switch between light and dark mode'),
                          value: preferences.isDarkMode,
                          onChanged: (value) {
                            preferences.darkMode = value;
                          },
                        );
                      },
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
