class Numeros {
  //Ejercicio 4. Numero perfecto
  int sumarDivisores(int numero) {
    int suma = 0;
    for (int i = 1; i < numero; i++) {
      if (numero % i == 0) {
        suma += i;
      }
    }
    return suma;
  }

  bool esPerfecto(int numero) {
    return numero > 1 && sumarDivisores(numero) == numero;
  }

  //Ejercicio 5. Serie de Fibonacci
  List<int> generarFibonacci(int n) {
    List<int> serie = [];
    int a = 0, b = 1;
    for (int i = 0; i < n; i++) {
      serie.add(a);
      int siguiente = a + b;
      a = b;
      b = siguiente;
    }
    return serie;
  }

  //Ejercicio 6. Numero Armstrong
  int sumarArmstrong(int numero) {
    String digitos = numero.toString();
    int cifras = digitos.length;
    int suma = 0;
    for (int i = 0; i < cifras; i++) {
      int digito = int.parse(digitos[i]);
      int potencia = 1;
      for (int j = 0; j < cifras; j++) {
        potencia *= digito;
      }
      suma += potencia;
    }
    return suma;
  }

  bool esArmstrong(int numero) {
    return sumarArmstrong(numero) == numero;
  }
}
