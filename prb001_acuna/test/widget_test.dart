import 'package:flutter_test/flutter_test.dart';
import 'package:evaluacion1_acuna/logica/numeros.dart';

void main() {
  final numeros = Numeros();

  test('Números perfectos', () {
    expect(numeros.esPerfecto(6), true);
    expect(numeros.esPerfecto(28), true);
    expect(numeros.esPerfecto(12), false);
    expect(numeros.esPerfecto(1), false);
  });

  test('Serie de Fibonacci', () {
    expect(numeros.generarFibonacci(7), [0, 1, 1, 2, 3, 5, 8]);
    expect(numeros.generarFibonacci(1), [0]);
  });

  test('Números Armstrong', () {
    expect(numeros.esArmstrong(153), true);
    expect(numeros.esArmstrong(9474), true);
    expect(numeros.esArmstrong(5), true);
    expect(numeros.esArmstrong(154), false);
  });
}
