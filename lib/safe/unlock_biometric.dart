import 'package:flutter/material.dart';
import 'package:local_auth/local_auth.dart';
import 'package:provider/provider.dart';
import 'package:senacor_devcon_mysafe/safe/unlocked_treasure.dart';

import '../log/log.dart';

class UnlockBiometric extends StatelessWidget {
  final LocalAuthentication _localAuth = LocalAuthentication();

  UnlockBiometric({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Step 3'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text('Show me your identity!'),
            const SizedBox(
              height: 16,
            ),
            FutureBuilder(
              future: _canUseBiometricAuth(context),
              builder: (context, snapshot) {
                if (snapshot.data == true) {
                  return _authButton(context);
                } else {
                  return _authUnavailableErrorMessage();
                }
              },
            ),
          ],
        ),
      ),
    );
  }

  Text _authUnavailableErrorMessage() {
    return const Text('Our biometric systems are not working. Therefore the safe has to remain closed.');
  }

  Future<bool> _canUseBiometricAuth(BuildContext context) async {
    if (await _localAuth.canCheckBiometrics) {
      final List<BiometricType> availableBiometrics = await _localAuth.getAvailableBiometrics();
      return availableBiometrics.isNotEmpty;
    }
    context.read<Log>().logError('Biometric Auth not available');
    return false;
  }

  ElevatedButton _authButton(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        _localAuth
            .authenticate(
              localizedReason: 'Please prove your identity. This is the last check before we open the safe.',
              options: const AuthenticationOptions(biometricOnly: true),
            )
            .then((authenticated) => authenticated ? _openSafe(context) : showAuthError(context));
      },
      child: const Text('Identify me'),
    );
  }

  void showAuthError(BuildContext context) {
    context.read<Log>().logWarning('Biometric Auth failed');
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('Authentication failed.\nPlease try again.')),
    );
  }

  void _openSafe(BuildContext context) {
    context.read<Log>().logInfo('Biometric Auth successful');
    context.read<Log>().logSuccess('Safe opened');

    Navigator.push(
      context,
      MaterialPageRoute(builder: (_) => const UnlockedTreasure()),
    );
  }
}
