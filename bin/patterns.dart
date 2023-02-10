import 'dart:math';

import 'package:patterns/patterns.dart';
import 'package:uuid/uuid.dart';

final _uuid = Uuid();

void main(List<String> arguments) async {
  run(Patterns.strategy);
  generateUniqueId();
  generateUniqueId();
  generateUniqueId();
}

int generateUniqueId() {
  final random = Random.secure();

  final id = int.tryParse(_uuid.v4().replaceAll("-", ""), radix: 16) ??
      0 + random.nextInt(0xFFFFFFFF);
  print("Unique ID $id");
  return id;
}
