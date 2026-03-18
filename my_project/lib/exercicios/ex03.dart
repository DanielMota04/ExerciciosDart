import 'dart:math';

String serieDeNumeros(int casas){
  int contadorAux = 1;
  int contador = 1;
  int valor1 = 0;
  int valor2 = 5;
  int valor3 = 100;
  var s = "";
  while (contador <= casas){
    if(contadorAux == 3){
      contadorAux = 1;
      s += valor3.toString();
      valor3 -= 10;
      s += " ";
    }

    if(contadorAux == 2){
      contadorAux++;
      s += valor2.toString();
      valor2 += 5;
    }

    if(contadorAux == 1){
      contadorAux++;
      var valor = pow(2, valor1);
      s += valor.toString();
      valor1++;
    }

    s += " ";
    contador++;
  }

  return s;
}