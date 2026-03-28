import 'dart:io';

void main(List<String> arguments) {
  int qtdMasculino = 0;
  int qtdFeminino = 0;
  int total = 0;

  String nomeMenorMasculino = "";
  int menorPontuacaoMasculino = 999999;

  String codigoMaiorSIMasculino = "";
  int maiorPontuacaoSIMasculino = -1;

  print("Quantos candidatos deseja cadastrar?");
  int quantidade = int.parse(stdin.readLineSync()!);

  for (int i = 1; i <= quantidade; i++) {
    print("\nCandidato $i");

    print("Digite o código:");
    String codigo = stdin.readLineSync()!;

    print("Digite o curso (CC ou SI):");
    String curso = stdin.readLineSync()!.toUpperCase();

    print("Digite o nome:");
    String nome = stdin.readLineSync()!;

    print("Digite o sexo (M ou F):");
    String sexo = stdin.readLineSync()!.toUpperCase();

    int pontuacao;

    do {
      print("Digite a pontuação (0 a 5000):");
      pontuacao = int.parse(stdin.readLineSync()!);

      if (pontuacao < 0 || pontuacao > 5000) {
        print("Pontuação inválida. Digite novamente.");
      }
    } while (pontuacao < 0 || pontuacao > 5000);

    total++;

    if (sexo == "M") {
      qtdMasculino++;

      if (pontuacao < menorPontuacaoMasculino) {
        menorPontuacaoMasculino = pontuacao;
        nomeMenorMasculino = nome;
      }

      if (curso == "SI" && pontuacao > maiorPontuacaoSIMasculino) {
        maiorPontuacaoSIMasculino = pontuacao;
        codigoMaiorSIMasculino = codigo;
      }
    }

    if (sexo == "F") {
      qtdFeminino++;
    }

    if (curso == "CC" && pontuacao > 2500) {
      print("\nCandidato de Ciência da Computação com mais de 2500 pontos:");
      print("Código: $codigo");
      print("Nome: $nome");
      print("Pontuação: $pontuacao");
    }
  }

  double percentualMasculino = (qtdMasculino / total) * 100;
  double percentualFeminino = (qtdFeminino / total) * 100;

  print("\n--RESULTADOS--");

  print("\nNome do candidato masculino com menor pontuação geral:");
  print(nomeMenorMasculino);

  print("\nCódigo do candidato masculino com maior pontuação em SI:");
  
  if (codigoMaiorSIMasculino == "") {
    print("Não houve candidato masculino em SI.");
  } else {
    print(codigoMaiorSIMasculino);
  }

  print("\nPercentual de candidatos masculinos: ${percentualMasculino.toStringAsFixed(2)}%");
  print("Percentual de candidatos femininos: ${percentualFeminino.toStringAsFixed(2)}%");
}