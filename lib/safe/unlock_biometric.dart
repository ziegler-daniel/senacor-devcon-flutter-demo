import 'package:flutter/material.dart';
import 'package:local_auth/local_auth.dart';
import 'package:senacor_devcon_mysafe/safe/unlocked_treasure.dart';

class UnlockBiometric extends StatelessWidget {
  final LocalAuthentication _localAuth = LocalAuthentication();

  UnlockBiometric({Key? key}) : super(key: key);

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
                future: _canUseBiometricAuth(),
                builder: (context, snapshot) {
                  if (snapshot.data == true) {
                    return _authButton(context);
                  } else {
                    return _authUnavailableerrorMessage();
                  }
                }),
          ],
        ),
      ),
    );
  }

  Text _authUnavailableerrorMessage() {
    return const Text('Our biometric systems are not working. Therefore the safe has to remain closed.');
  }

  Future<bool> _canUseBiometricAuth() async {
    if (await _localAuth.canCheckBiometrics) {
      final List<BiometricType> availableBiometrics = await _localAuth.getAvailableBiometrics();
      return availableBiometrics.isNotEmpty;
    }

    return false;
  }

  ElevatedButton _authButton(BuildContext context) {
    return ElevatedButton(
      onPressed: () async {
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
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('Authentication failes.\nPlease try again.')),
    );
  }

  void _openSafe(BuildContext context) =>
      Navigator.push(context, MaterialPageRoute(builder: (_) => const UnlockedTreasure()));
}
