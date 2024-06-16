// The Context defines the interface of interest to clients. It also
// maintains a reference to an instance of a State subclass, which
// represents the current state of the Context.
class Context {
  // A reference to the current state of the Context.
  State? _state;

  Context(State state) {
    transitionTo(state);
  }

  // The Context allows changing the State object at runtime.
  void transitionTo(State state) {
    print('Context: Transition to ${state.runtimeType}.');
    _state = state;
    _state!.setContext(this);
  }

  // The Context delegates part of its behavior to the current State
  // object.
  void request1() {
    _state!.handle1();
  }

  void request2() {
    _state!.handle2();
  }
}

// The base State class declares methods that all Concrete State should
// implement and also provides a backreference to the Context object,
// associated with the State. This backreference can be used by States to
// transition the Context to another State.
abstract class State {
  Context? _context;

  void setContext(Context context) {
    _context = context;
  }

  void handle1();
  void handle2();
}

// Concrete States implement various behaviors, associated with a state of
// the Context.
class ConcreteStateA extends State {
  @override
  void handle1() {
    print('ConcreteStateA handles request1.');
    print('ConcreteStateA wants to change the state of the context.');
    _context!.transitionTo(ConcreteStateB());
  }

  @override
  void handle2() {
    print('ConcreteStateA handles request2.');
  }
}

class ConcreteStateB extends State {
  @override
  void handle1() {
    print('ConcreteStateB handles request1.');
  }

  @override
  void handle2() {
    print('ConcreteStateB handles request2.');
    print('ConcreteStateB wants to change the state of the context.');
    _context!.transitionTo(ConcreteStateA());
  }
}

void main() {
  // The client code.
  var context = Context(ConcreteStateA());
  context.request1();
  context.request2();
}


