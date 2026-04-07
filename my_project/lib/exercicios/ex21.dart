import 'dart:io';

void main() {
  List<List<String>> tab = [
    [' ', ' ', ' '],
    [' ', ' ', ' '],
    [' ', ' ', ' ']
  ];

  String jogador = 'X';
  int jogadas = 0;

  while (true) {
    for (int i = 0; i < 3; i++) {
      print('${tab[i][0]} | ${tab[i][1]} | ${tab[i][2]}');
      if (i < 2) print('---------');
    }

    print('\nJogador $jogador');
    stdout.write('Linha (0-2): ');
    int l = int.parse(stdin.readLineSync()!);

    stdout.write('Coluna (0-2): ');
    int c = int.parse(stdin.readLineSync()!);

    if (tab[l][c] != ' ') {
      print('Posição ocupada\n');
      continue;
    }

    tab[l][c] = jogador;
    jogadas++;

    bool ganhou = false;

    for (int i = 0; i < 3; i++) {
      if (tab[i][0] == jogador && tab[i][1] == jogador && tab[i][2] == jogador) ganhou = true;
      if (tab[0][i] == jogador && tab[1][i] == jogador && tab[2][i] == jogador) ganhou = true;
    }


    if (tab[0][0] == jogador && tab[1][1] == jogador && tab[2][2] == jogador) ganhou = true;
    if (tab[0][2] == jogador && tab[1][1] == jogador && tab[2][0] == jogador) ganhou = true;

    if (ganhou) {
      print('\nJogador $jogador venceu!');
      break;
    }

    if (jogadas == 9) {
      print('\nEmpate!');
      break;
    }

    jogador = jogador == 'X' ? 'O' : 'X';
    print('');
  }
}
 