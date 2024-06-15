// The Target defines the domain-specific interface used by the client code.
abstract class ITarget {
  String getRequest();
}

// The Adaptee contains some useful behavior, but its interface is
// incompatible with the existing client code. The Adaptee needs some
// adaptation before the client code can use it.
class Adaptee {
  String getSpecificRequest() {
    return "Specific request.";
  }
}

// The Adapter makes the Adaptee's interface compatible with the Target's
// interface.
class Adapter implements ITarget {
  final Adaptee _adaptee;

  Adapter(this._adaptee);

  @override
  String getRequest() {
    return "This is '${_adaptee.getSpecificRequest()}'";
  }
}

void main() {
  Adaptee adaptee = Adaptee();
  ITarget target = Adapter(adaptee);

  print("Adaptee interface is incompatible with the client.");
  print("But with adapter client can call its method.");

  print(target.getRequest());
}


