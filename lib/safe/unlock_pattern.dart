import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:pattern_lock/pattern_lock.dart';
import 'package:senacor_devcon_mysafe/safe/unlock_biometric.dart';

class UnlockPattern extends StatelessWidget {
  const UnlockPattern({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Step 2'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Flexible(
              child: Text('Draw the pattern'),
            ),
            const SizedBox(
              height: 16,
            ),
            Flexible(
              child: PatternLock(
                fillPoints: true,
                onInputComplete: (List<int> input) =>
                    listEquals(input, [0, 3, 7, 5, 2])
                        ? _showSuccess(context)
                        : _showError(context),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _showSuccess(BuildContext context) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: const Text('Correct!\nPlease move on.'),
        duration: const Duration(days: 365),
        action: SnackBarAction(
          label: 'Continue',
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (_) => const UnlockBiometric()),
            );
          },
        ),
      ),
    );
  }

  void _showError(BuildContext context) {
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text('Wrong pattern.\nPlease try again.'),
      ),
    );
  }
}
