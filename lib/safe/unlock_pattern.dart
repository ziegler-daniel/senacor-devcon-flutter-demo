import 'package:flutter/material.dart';

class UnlockPattern extends StatelessWidget {
  const UnlockPattern({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Step 2'),
      ),
      body: const Padding(
        padding: EdgeInsets.all(16),
        child: Text('Hello'),
      ),
    );
  }
}
