import 'package:patterns/extensions.dart';

int run() {
  final wildDuck = Duck(
    NormalFly(),
    LoudQuack(),
  );

  "Wild duck ..".log();
  wildDuck.fly();
  wildDuck.quack();

  final cityDuck = Duck(JetFly(), QuietQuack());

  "City duck ..".log();
  cityDuck.fly();
  cityDuck.quack();
  return 0;
}

class Duck {
  final IFlyStrategy _iFlyStrategy;
  final IQuackStrategy _iQuackStrategy;
  Duck(
    this._iFlyStrategy,
    this._iQuackStrategy,
  );

  void fly() => _iFlyStrategy.fly();
  void quack() => _iQuackStrategy.quack();
}

abstract class IQuackStrategy {
  void quack();
}

class LoudQuack implements IQuackStrategy {
  @override
  void quack() {
    "Quack Loudly ..".log();
  }
}

class QuietQuack implements IQuackStrategy {
  @override
  void quack() {
    "Quack Quack ..".log();
  }
}

abstract class IFlyStrategy {
  void fly();
}

class JetFly implements IFlyStrategy {
  @override
  void fly() {
    "Jet Flying ...".log();
  }
}

class NormalFly implements IFlyStrategy {
  @override
  void fly() {
    "Normal Flying ...".log();
  }
}
