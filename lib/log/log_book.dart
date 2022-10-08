import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

import 'log.dart';

class LogBook extends StatelessWidget {
  const LogBook({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<Log>(
      builder: (context, log, _) => ListView.builder(
        itemCount: log.entries.length,
        itemBuilder: (context, index) {
          return ListTile(
            leading: _leadingIcon(log.entries.elementAt(index).type),
            title: Text(log.entries.elementAt(index).msg),
            subtitle: Text(_dateTimeToText(log.entries.elementAt(index).time)),
          );
        },
      ),
    );
  }

  String _dateTimeToText(DateTime date) {
    return DateFormat('d MMM yyyy – kk:mm').format(date);
  }

  Widget _leadingIcon(LogType type) {
    switch (type) {
      case LogType.warning:
        return const Icon(
          Icons.warning,
          color: Colors.orange,
        );
      case LogType.success:
        return const Icon(
          Icons.check,
          color: Colors.green,
        );
      case LogType.info:
        return const Icon(
          Icons.info,
          color: Colors.lightBlue,
        );
      default:
        return const Icon(
          Icons.error,
          color: Colors.red,
        );
    }
  }
}
