import 'dart:io';

void main(List<String> arguments) {

  print("Digite a quantidade de números:");
  int n = int.parse(stdin.readLineSync()!);

  List<int> numeros = [];

  for (int w = 0; w < n; w++) {
    print("Digite o número ${w + 1}:");
    int valor = int.parse(stdin.readLineSync()!);
    numeros.add(valor);
  }

  print("\n--RESULTADO--");
  
  for (int x = 0; x < numeros.length; x++) {
    int atual = numeros[x];
    int contador = 0;
    bool numeroMostrado = false;

    for (int y = 0; y < x; y++) {
      if (numeros[y] == atual) {
        numeroMostrado = true;
      }
    }

    if (!numeroMostrado) {
      for (int z = 0; z < numeros.length; z++) {
        if (numeros[z] == atual) {
          contador++;
        }
      }

      print("$atual - $contador");
    }
  }
}