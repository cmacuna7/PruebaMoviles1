import 'package:flutter/material.dart';
import '../logica/numeros.dart';

class NumerosPantalla extends StatefulWidget {
  const NumerosPantalla({super.key});

  @override
  State<NumerosPantalla> createState() => _NumerosPantallaState();
}

class _NumerosPantallaState extends State<NumerosPantalla> {
  // Mapeo
  Numeros numeros = Numeros();
  final numeroController = TextEditingController();

  // Variables de estado
  String titulo = '';
  String resultado = '';
  String mensaje = '';

  @override
  void dispose() {
    numeroController.dispose();
    super.dispose();
  }

  // Valida que el dato ingresado sea un entero positivo
  int? leerNumero() {
    int? numero = int.tryParse(numeroController.text);
    if (numero == null || numero <= 0) {
      setState(() {
        mensaje = 'Ingrese un número entero positivo';
        titulo = '';
        resultado = '';
      });
      return null;
    }
    return numero;
  }

  //Ejercicio 4
  void verificarPerfecto() {
    int? numero = leerNumero();
    if (numero == null) return;

    int suma = numeros.sumarDivisores(numero);
    setState(() {
      mensaje = '';
      titulo = 'Número perfecto';
      resultado = numeros.esPerfecto(numero)
          ? '$numero ES un número perfecto\nSuma de divisores propios: $suma'
          : '$numero NO es un número perfecto\nSuma de divisores propios: $suma';
    });
  }

  //Ejercicio 5
  void generarFibonacci() {
    int? n = leerNumero();
    if (n == null) return;

    if (n > 90) {
      setState(() {
        mensaje = 'Ingrese un valor menor o igual a 90';
        titulo = '';
        resultado = '';
      });
      return;
    }

    List<int> serie = numeros.generarFibonacci(n);
    setState(() {
      mensaje = '';
      titulo = 'Serie de Fibonacci ($n términos)';
      resultado = serie.join(', ');
    });
  }

  //Ejercicio 6
  void verificarArmstrong() {
    int? numero = leerNumero();
    if (numero == null) return;

    int suma = numeros.sumarArmstrong(numero);
    setState(() {
      mensaje = '';
      titulo = 'Número Armstrong';
      resultado = numeros.esArmstrong(numero)
          ? '$numero ES un número Armstrong\nSuma de potencias: $suma'
          : '$numero NO es un número Armstrong\nSuma de potencias: $suma';
    });
  }

  //metodo limpiar
  void limpiar() {
    setState(() {
      numeroController.clear();
      titulo = '';
      resultado = '';
      mensaje = '';
    });
  }

  //diseño
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Evaluación 1 - Números'),
        backgroundColor: Colors.blue,
        foregroundColor: Colors.white,
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              'Ingrese un número entero positivo',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10),
            TextField(
              controller: numeroController,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                labelText: 'Número',
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 10),
            Wrap(
              spacing: 10,
              runSpacing: 10,
              alignment: WrapAlignment.center,
              children: [
                ElevatedButton(
                  onPressed: verificarPerfecto,
                  child: Text('Perfecto'),
                ),
                ElevatedButton(
                  onPressed: generarFibonacci,
                  child: Text('Fibonacci'),
                ),
                ElevatedButton(
                  onPressed: verificarArmstrong,
                  child: Text('Armstrong'),
                ),
              ],
            ),
            SizedBox(height: 10),
            Text(mensaje, style: TextStyle(color: Colors.red)),
            SizedBox(height: 10),
            Text(
              titulo,
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10),
            Text(
              resultado,
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 18, color: Colors.green),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: limpiar,
        tooltip: 'Limpiar',
        child: Icon(Icons.refresh),
      ),
    );
  }
}
