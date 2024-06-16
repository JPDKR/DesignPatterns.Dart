import 'dart:math';
import 'dart:async';

abstract class IObserver {
  // Receive update from subject
  void update(ISubject subject);
}

abstract class ISubject {
  // Attach an observer to the subject.
  void attach(IObserver observer);

  // Detach an observer from the subject.
  void detach(IObserver observer);

  // Notify all observers about an event.
  void notify();
}

// The Subject owns some important state and notifies observers when the
// state changes.
class Subject implements ISubject {
  // For the sake of simplicity, the Subject's state, essential to all
  // subscribers, is stored in this variable.
  int state = -0;

  // List of subscribers. In real life, the list of subscribers can be
  // stored more comprehensively (categorized by event type, etc.).
  final List<IObserver> _observers = [];

  // The subscription management methods.
  @override
  void attach(IObserver observer) {
    print("Subject: Attached an observer.");
    _observers.add(observer);
  }

  @override
  void detach(IObserver observer) {
    _observers.remove(observer);
    print("Subject: Detached an observer.");
  }

  // Trigger an update in each subscriber.
  @override
  void notify() {
    print("Subject: Notifying observers...");

    for (var observer in _observers) {
      observer.update(this);
    }
  }

  // Usually, the subscription logic is only a fraction of what a Subject
  // can really do. Subjects commonly hold some important business logic,
  // that triggers a notification method whenever something important is
  // about to happen (or after it).
  void someBusinessLogic() {
    print("\nSubject: I'm doing something important.");
    state = Random().nextInt(10);

    Future.delayed(Duration(milliseconds: 15), () {
      print("Subject: My state has just changed to: $state");
      notify();
    });
  }
}

// Concrete Observers react to the updates issued by the Subject they had
// been attached to.
class ConcreteObserverA implements IObserver {
  @override
  void update(ISubject subject) {
    if ((subject as Subject).state < 3) {
      print("ConcreteObserverA: Reacted to the event.");
    }
  }
}

class ConcreteObserverB implements IObserver {
  @override
  void update(ISubject subject) {
    if ((subject as Subject).state == 0 || (subject as Subject).state >= 2) {
      print("ConcreteObserverB: Reacted to the event.");
    }
  }
}

void main() {
  // The client code.
  var subject = Subject();
  var observerA = ConcreteObserverA();
  subject.attach(observerA);

  var observerB = ConcreteObserverB();
  subject.attach(observerB);

  subject.someBusinessLogic();
  subject.someBusinessLogic();

  subject.detach(observerB);

  subject.someBusinessLogic();
}


