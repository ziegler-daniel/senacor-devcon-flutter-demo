import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../log/log.dart';

class UnlockedTreasure extends StatelessWidget {
  const UnlockedTreasure({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(
              Icons.currency_bitcoin_rounded,
              size: 132,
            ),
            ElevatedButton(
              onPressed: () {
                context.read<Log>().logSuccess('Safe locked');
                Navigator.of(context).popUntil((route) => route.isFirst);
              },
              child: const Text('Lock up'),
            )
          ],
        ),
      ),
    );
  }
}
