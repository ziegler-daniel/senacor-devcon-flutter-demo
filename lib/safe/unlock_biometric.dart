import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:senacor_devcon_mysafe/safe/authentication.dart';
import 'package:senacor_devcon_mysafe/safe/unlocked_treasure.dart';

class UnlockBiometric extends StatelessWidget {
  const UnlockBiometric({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => Authentication(),
      child: Scaffold(
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
              Consumer<Authentication>(builder: (context, Authentication auth, child) {
                return FutureBuilder(
                    future: auth.canUseBiometricAuth(),
                    builder: (context, snapshot) {
                      if (snapshot.data == true) {
                        return _authButton(context, auth);
                      } else {
                        return _errorMessage();
                      }
                    });
              }),
            ],
          ),
        ),
      ),
    );
  }

  ElevatedButton _authButton(BuildContext context, Authentication auth) {
    return ElevatedButton(
      onPressed: () async {
        auth.authenticate().then((authenticated) {
          if (authenticated) {
            Navigator.push(context, MaterialPageRoute(builder: (_) => const UnlockedTreasure()));
          } else {
            const SnackBar(
              content: Text('Authentication failes.\nPlease try again.'),
            );
          }
        });
      },
      child: const Text('Identify me'),
    );
  }

  Text _errorMessage() {
    return const Text('Our biometric systems are not working. Therefore the safe has to remain closed.');
  }
}
