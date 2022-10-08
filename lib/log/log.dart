import 'package:flutter/material.dart';

class Log with ChangeNotifier {
  final List<LogEntry> _logentries = [];

  List<LogEntry> get entries => _logentries;

  void logInfo(String msg) {
    _log(msg, LogType.info);
  }

  void logWarning(String msg) {
    _log(msg, LogType.warning);
  }

  void logError(String msg) {
    _log(msg, LogType.error);
  }

  void logSuccess(String msg) {
    _log(msg, LogType.success);
  }

  void _log(String msg, LogType type) {
    entries.add(LogEntry(msg, type));
    notifyListeners();
  }
}

class LogEntry {
  final LogType type;
  final String msg;
  final DateTime time;

  LogEntry(this.msg, this.type) : time = DateTime.now();
}

enum LogType { info, warning, success, error }
