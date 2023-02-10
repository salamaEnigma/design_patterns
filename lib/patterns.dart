import 'design_patterns/strategy.dart' as strategy;
import 'design_patterns/observer.dart' as observer;

enum Patterns { strategy, observer }

int run(Patterns pattern) {
  switch (pattern) {
    case Patterns.strategy:
      strategy.run();
      break;
    case Patterns.observer:
      observer.run();
      break;
  }

  return 0;
}
