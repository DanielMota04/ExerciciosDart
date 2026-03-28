import 'dart:io';

void main(List<String> arguments) {
  List<RecemNascido> maternidade = [];
  bool continuar = true;
  while (continuar) {
    print("Digite o nome do recém-nascido: ");
    String nome = stdin.readLineSync()!;
    print("Digite o sexo de $nome(M/F):");
    String sexo = stdin.readLineSync()!.toUpperCase();
    print("Digite o peso de $nome");
    double peso = double.parse(stdin.readLineSync()!);
    RecemNascido bb = RecemNascido(nome, sexo, peso);
    maternidade.add(bb);

    print("Deseja adicionar outro recém-nascido?(S/N)");
    String decisao = stdin.readLineSync()!.toUpperCase();
    if(decisao == 'N') break;
  }

  for (var bb in maternidade) {
    print("Nome: ${bb.nome} | Sexo: ${bb.sexo} | Classificação: ${bb.classificacao}");
  }
  PrintFemMaiorPeso(maternidade);
  PercentPorClassificacao(maternidade);
}

void PrintFemMaiorPeso(List<RecemNascido> maternidade){
  RecemNascido? maior;
  for (var bb in maternidade) {
    if(bb.sexo == 'F'){
      if(maior==null||maior!.peso < bb.peso){
        maior = bb;
      }
    }
  }
  print("A recém-nascida de maior peso é ${maior?.nome}");
}

void PercentPorClassificacao(List<RecemNascido> maternidade){
  double qtdBaixoP=0;
  double qtdNormal=0;
  double qtdAltoP=0;
  for (var bb in maternidade) {
    if(bb.classificacao == 'Baixo Peso') {qtdBaixoP++;}
    if(bb.classificacao == 'Normal') {qtdNormal++;}
    if(bb.classificacao == 'Alto Peso') {qtdAltoP++;}
  }
  print("Baixo Peso - ${(qtdBaixoP/maternidade.length)*100}% dos Recém-Nascidos");
  print("Normal - ${(qtdNormal/maternidade.length)*100}% dos Recém-Nascidos");
  print("Alto Peso - ${(qtdAltoP/maternidade.length)*100}% dos Recém-Nascidos");
}

class RecemNascido {
  String nome;
  String sexo;
  double peso;
  String classificacao;

  RecemNascido(this.nome, this.sexo, this.peso)
    : classificacao = Classificar(peso);

  static String Classificar(double peso) {
    if (peso > 4) {
      return "Alto Peso";
    } else if (peso <= 4 && 2 < peso) {
      return "Normal";
    }
    return "Baixo Peso";
  }

}
