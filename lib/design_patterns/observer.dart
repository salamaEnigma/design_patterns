// ignore_for_file: library_private_types_in_public_api

import 'dart:async';

import 'package:patterns/extensions.dart';

int run() {
  final rss = RssFeed();
  final readerA = ReaderA();
  final readerB = ReaderB();

  rss.add(readerA);
  rss.add(readerB);

  Timer.periodic(const Duration(seconds: 1), (timer) {
    rss.addFeed(timer.tick);
  });
  return 0;
}

abstract class _IObservable {
  final List<_IObserver> observers = [];

  void add(_IObserver o);
  bool remove(_IObserver o);
  void notify();
}

abstract class _IObserver<T> {
  void update(T data);
}

class RssFeed<T> extends _IObservable {
  final List<T> _rss = [];

  @override
  void add(_IObserver o) {
    observers.add(o);
  }

  @override
  void notify() {
    for (_IObserver o in observers) {
      o.update(_rss);
    }
  }

  @override
  bool remove(_IObserver o) => observers.remove(o);

  void addFeed(T feed) {
    _rss.add(feed);
    notify();
  }
}

class ReaderA implements _IObserver {
  @override
  void update(data) {
    "Reader A received a new feed : $data".log();
  }
}

class ReaderB implements _IObserver {
  @override
  void update(data) {
    "Reader B received a new feed : $data".log();
  }
}
