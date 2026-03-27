import 'dart:math';
import 'dart:io';
void main(List<String> arguments){
  int palpite = 0;
  int numero = Random().nextInt(100)+1;
  print("Adivinhe o número  1 e 100");
  while(numero != palpite){
    print("Digite seu palpite: ");
    palpite = int.parse(stdin.readLineSync()!);
    if(numero > palpite){
      print("O número está entre ${palpite} - 100");
    }
    if(numero < palpite){
      print("O número está entre 0 - ${palpite}");
    }
  }
  print("Parabéns, o número era ${numero}");
}