import 'dart:io';

void main(List<String> arguments) {
  List<int> vertor1 = [];
  List<int> vertor2 = [];
  List<int> vertor3 = [];

  int tamanho;
  int num;

  stdout.write("Digite o tamanho do VETOR 1:\n-> ");
  tamanho = int.parse(stdin.readLineSync()!);

  for (int i = 0; i < tamanho; i++) {

    print("Estado atual - VETOR 1 - ${vertor1}");
    stdout.write("Digite o ${i + 1}º número:\n-> ");
    num = int.parse(stdin.readLineSync()!);

    vertor1.add(num);
  }

  vertor1.sort();

  stdout.write("Digite o tamanho do VETOR 2:\n-> ");
  tamanho = int.parse(stdin.readLineSync()!);

  for (int i = 0; i < tamanho; i++) {
    
    print("Estado atual - VETOR 2 - ${vertor2}");
    stdout.write("Digite o ${i + 1}º número:\n-> ");
    num = int.parse(stdin.readLineSync()!);

    vertor2.add(num);
  }

  vertor2.sort();

  vertor3.addAll(vertor1);
  vertor3.addAll(vertor2);
  vertor3.sort();

  print("\nVETOR 1 : ${vertor1}");
  print("VETOR 2 : ${vertor2}");
  print("VETOR 3 : ${vertor3}");
}