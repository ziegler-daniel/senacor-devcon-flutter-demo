import 'package:flutter/material.dart';

class SecuritySettings extends StatelessWidget {
  const SecuritySettings({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Security Settings'),
      ),
      body: const Center(
          child: Icon(
        Icons.security,
        size: 132,
      )),
    );
  }
}
