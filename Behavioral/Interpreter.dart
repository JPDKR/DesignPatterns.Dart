abstract class IExpression {
  int interpret();
}

class Number implements IExpression {
  final int number;

  Number(this.number);

  @override
  int interpret() {
    return number;
  }
}

class Add implements IExpression {
  final IExpression leftExpression;
  final IExpression rightExpression;

  Add(this.leftExpression, this.rightExpression);

  @override
  int interpret() {
    return leftExpression.interpret() + rightExpression.interpret();
  }
}

class Subtract implements IExpression {
  final IExpression leftExpression;
  final IExpression rightExpression;

  Subtract(this.leftExpression, this.rightExpression);

  @override
  int interpret() {
    return leftExpression.interpret() - rightExpression.interpret();
  }
}

void main() {
  // Construir la expresión: (5 + 10) - (3 + 2)
  IExpression five = Number(5);
  IExpression ten = Number(10);
  IExpression three = Number(3);
  IExpression two = Number(2);

  IExpression addition1 = Add(five, ten); // (5 + 10)
  IExpression addition2 = Add(three, two); // (3 + 2)

  IExpression finalExpression = Subtract(addition1, addition2); // (5 + 10) - (3 + 2)

  int result = finalExpression.interpret();

  print("Resultado de la expresión: $result"); // Debería imprimir 10
}