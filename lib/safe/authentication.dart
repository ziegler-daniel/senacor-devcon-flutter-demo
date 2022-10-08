import 'package:flutter/material.dart';
import 'package:local_auth/local_auth.dart';

class Authentication with ChangeNotifier {
  final LocalAuthentication auth = LocalAuthentication();

  Future<bool> canUseBiometricAuth() async {
    print('hi');

    if (await auth.canCheckBiometrics) {
      final List<BiometricType> availableBiometrics = await auth.getAvailableBiometrics();
      print(availableBiometrics);
      return availableBiometrics.isNotEmpty;
    }

    return false;
  }

  Future<bool> authenticate() async {
    return await auth.authenticate(
        localizedReason: 'Please prove your identity. This is the last check before we open the safe.',
        options: const AuthenticationOptions(biometricOnly: true));
  }
}
