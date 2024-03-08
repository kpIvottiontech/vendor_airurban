import 'dart:async';
import 'dart:developer';

///  ⚠️⚠️⚠️⚠️⚠️⚠️⚠️ITS USE ONLY FOR DEBUGGING PURPOSES  ⚠️⚠️⚠️⚠️⚠️⚠️⚠️

nkDevLog(
  String message, {
  DateTime? time,
  int? sequenceNumber,
  int level = 0,
  String name = '',
  Zone? zone,
  Object? error,
  StackTrace? stackTrace,
}) {
  log(message,
      time: time,
      sequenceNumber: sequenceNumber,
      level: level,
      name: name,
      zone: zone,
      error: error,
      stackTrace: stackTrace);
}
