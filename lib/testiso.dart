// ignore_for_file: prefer_const_constructors, avoid_print

import 'dart:async';
import 'dart:isolate';

Future<void> main() async {
  await time(test1());
  await time(test2());
}

Future<List> test1() {
  return Future.microtask(
    () => generateBigData(),
  );
}

Future<List> test2() async {
  final p = ReceivePort();
  await Isolate.spawn((SendPort p) {
    Isolate.exit(p, generateBigData());
  }, p.sendPort);
  return await p.first;
}

Future<Duration> time(Future<List> job) async {
  final start = DateTime.now();
  print(start);
  final x = await job;
  final end = DateTime.now();
  print(end);
  print(x.length);
  final diff = end.difference(start);
  print(diff);
  return diff;
}

List generateBigData() {
  print('generate');
  return List.generate(1 << 26, (i) => i.isOdd ? '1' : '0');
}
