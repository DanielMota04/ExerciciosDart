import 'dart:io';

void main(List<String> arguments) {
  List bois = [];
  int c = 1;

  while (true) {
    stdout.write("Qual o número do ${c}º boi?\n-> ");
    int num = int.parse(stdin.readLineSync()!);

    stdout.write("\nQual o peso do ${c}º boi?\n-> ");
    int peso = int.parse(stdin.readLineSync()!);

    bois.add(num);
    bois.add(peso);

    stdout.write("\nDeseja continuar (0 = Sim | 1 = Não)?\n-> ");
    int escolha = int.parse(stdin.readLineSync()!);

    if (escolha == 1) break;

    c++;
  }

  while (true) {
    stdout.write("\nQual o peso mínimo dos bois?\n-> ");
    int pesoMin = int.parse(stdin.readLineSync()!);

    stdout.write("\nQual o peso máximo dos bois?\n-> ");
    int pesoMax = int.parse(stdin.readLineSync()!);

    print("\nBois encontrados:");

    bool encontrou = false;

    for (int j = 0; j < bois.length; j += 2) {
      int numero = bois[j];
      int peso = bois[j + 1];

      if (peso >= pesoMin && peso <= pesoMax) {
        print("Número $numero - Peso: $peso");
        encontrou = true;
      }
    }

    if (!encontrou) {
      print("Nenhum boi encontrado nesse intervalo.");
    }

    stdout.write("\nDeseja fazer outra pesquisa? (0 = Sim | 1 = Não)\n-> ");
    int opcao = int.parse(stdin.readLineSync()!);

    if (opcao == 1) 
      {
        break;
      }
  }
}