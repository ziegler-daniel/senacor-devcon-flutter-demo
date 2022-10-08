import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:senacor_devcon_mysafe/safe/unlock_pattern.dart';

import '../log/log.dart';

class UnlockPin extends StatelessWidget {
  const UnlockPin({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Step 1'),
      ),
      body: const Padding(
        padding: EdgeInsets.all(16),
        child: UnlockPinForm(),
      ),
    );
  }
}

class UnlockPinForm extends StatefulWidget {
  static const Key pinFieldKey = Key('pinField');

  const UnlockPinForm({Key? key}) : super(key: key);

  @override
  State<UnlockPinForm> createState() => _UnlockPinFormState();
}

class _UnlockPinFormState extends State<UnlockPinForm> {
  final _unlockPinFormKey = GlobalKey<FormState>();
  final _pinTextController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _unlockPinFormKey,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text('Enter the PIN'),
          const SizedBox(
            height: 16,
          ),
          TextFormField(
            controller: _pinTextController,
            key: UnlockPinForm.pinFieldKey,
            keyboardType: TextInputType.number,
            obscureText: true,
            textAlign: TextAlign.center,
            onFieldSubmitted: (_) => _submit(context),
            validator: (value) => value != '2022' ? 'PIN invalid. Please retry.' : null,
          ),
          const SizedBox(
            height: 16,
          ),
          ElevatedButton(
            onPressed: () => _submit(context),
            child: const Text('Validate PIN'),
          ),
        ],
      ),
    );
  }

  void _submit(BuildContext context) {
    FocusManager.instance.primaryFocus?.unfocus();
    if (_unlockPinFormKey.currentState!.validate()) {
      context.read<Log>().logInfo('Valid PIN entered');
      Navigator.push(
        context,
        MaterialPageRoute(builder: (_) => const UnlockPattern()),
      );
    } else {
      setState(() {
        context.read<Log>().logWarning('Invalid PIN entered');
        _pinTextController.clear();
      });
    }
  }
}
