import 'dart:math';
import 'dart:io';

void main() {
  var random = Random();

  List<String> palavras = ["DANIEL", "OLIVEIRA", "MENDONCA", "MOTA"];

  String palavraOculta = palavras[random.nextInt(palavras.length)];
  
  int erros = 0;
  int chutes = 1;

  print("=-=-= JOGO DA FORCA EM DART =-=-=");
  print("Regras: Você pode errar 4 vezes.");
  print("Tente adivinhar uma letra ou a palavra toda.\n");

  while (erros < 4) {
    print("${chutes}º Chute | Erros: ${erros}/4");
    stdout.write("Digite seu chute: ");
    
    String chute = stdin.readLineSync()!.toUpperCase();

    if (isChuteValid(chute, palavraOculta)) {
      print("-> Acertou.");
      
      if (chute == palavraOculta) {
        print("\nVocê acertou a palavra: $palavraOculta!");
        return; 
      }
    } else {
      erros++;
      print("-> ERROU!!!!!");
    }

    chutes++;
  }

  print("\nVocê foi perdeu!");
  print("A palavra era: $palavraOculta");
}

bool isChuteValid(String chute, String palavra) {
  if (chute.isEmpty) return false;

  if (palavra.contains(chute)) {
    return true;
  }

  return false;
}