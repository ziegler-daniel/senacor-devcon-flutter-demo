import 'package:flutter/material.dart';
import 'package:senacor_devcon_mysafe/safe/unlock_pin.dart';

class Safe extends StatelessWidget {
  const Safe({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Icon(
          Icons.lock_open,
          size: 132,
        ),
        ElevatedButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (_) => const UnlockPin()),
            );
          },
          child: const Text('Start unlocking'),
        ),
      ],
    );
  }
}
