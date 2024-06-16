// The Command interface declares a method for executing a command.
abstract class ICommand {
  void execute();
}

// Some commands can implement simple operations on their own.
class SimpleCommand implements ICommand {
  final String _payload;

  SimpleCommand(this._payload);

  @override
  void execute() {
    print('SimpleCommand: See, I can do simple things like printing ($_payload)');
  }
}

// However, some commands can delegate more complex operations to other
// objects, called "receivers."
class ComplexCommand implements ICommand {
  final Receiver _receiver;
  final String _a;
  final String _b;

  ComplexCommand(this._receiver, this._a, this._b);

  @override
  void execute() {
    print('ComplexCommand: Complex stuff should be done by a receiver object.');
    _receiver.doSomething(_a);
    _receiver.doSomethingElse(_b);
  }
}

// The Receiver classes contain some important business logic. They know how
// to perform all kinds of operations, associated with carrying out a
// request. In fact, any class may serve as a Receiver.
class Receiver {
  void doSomething(String a) {
    print('Receiver: Working on ($a.)');
  }

  void doSomethingElse(String b) {
    print('Receiver: Also working on ($b.)');
  }
}

// The Invoker is associated with one or several commands. It sends a
// request to the command.
class Invoker {
  ICommand? _onStart;
  ICommand? _onFinish;

  // Initialize commands.
  void setOnStart(ICommand command) {
    _onStart = command;
  }

  void setOnFinish(ICommand command) {
    _onFinish = command;
  }

  // The Invoker does not depend on concrete command or receiver classes.
  // The Invoker passes a request to a receiver indirectly, by executing a
  // command.
  void doSomethingImportant() {
    print('Invoker: Does anybody want something done before I begin?');
    _onStart?.execute();

    print('Invoker: ...doing something really important...');

    print('Invoker: Does anybody want something done after I finish?');
    _onFinish?.execute();
  }
}

void main() {
  // The client code can parameterize an invoker with any commands.
  Invoker invoker = Invoker();
  invoker.setOnStart(SimpleCommand('Say Hi!'));
  Receiver receiver = Receiver();
  invoker.setOnFinish(ComplexCommand(receiver, 'Send email', 'Save report'));

  invoker.doSomethingImportant();
}


