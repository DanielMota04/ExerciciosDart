import 'dart:io';

void main(List<String> arguments) {
  List<RecemNascido> maternidade = [];
  bool continuar = true;
  while (continuar) {
    String nome = VerificaNome();
    String sexo = VerificaSexo(nome);
    double peso = VerificarPeso(nome);
    RecemNascido bb = RecemNascido(nome, sexo, peso);
    maternidade.add(bb);

    String decisao = VerificaContinuacao();
    if(decisao == 'N') break;
  }
  if(maternidade.isEmpty){
    print("Nenhum recém-nascido cadastrado");
    return;
  }else{
  for (var bb in maternidade) {
    print("Nome: ${bb.nome} | Sexo: ${bb.sexo} | Classificação: ${bb.classificacao}");
  }
  PrintFemMaiorPeso(maternidade);
  PercentPorClassificacao(maternidade);
  }
}
String VerificaContinuacao() {
  while (true) {
    print("Deseja adicionar outro recém-nascido? (S/N) ");
    String entrada = stdin.readLineSync()!.toUpperCase();
    
    if (entrada == 'S' || entrada == 'N') {
      return entrada;
    }
    
    print("Responda com apenas 'S' para sim ou 'N' para não.");
  }
}

String VerificaNome(){
  while(true){
    print("Digite o nome do recém-nascido: ");
    String resposta = stdin.readLineSync()!;
    if(!resposta.trim().isEmpty){
      return resposta;
    }else{
      print("A resposta está vazia");
    }
  }
}
String VerificaSexo(String nome){
  while(true){
    print("Digite o sexo de ${nome} (M/F):");
    String sexo = stdin.readLineSync()!.toUpperCase();
    if(sexo == 'M' || sexo == 'F')return sexo;
    print("Digite Novamente, A resposta só deve ser 'M' ou 'F'");
  }
  
}

double VerificarPeso(String nome){
  while(true){
    print("Digite o peso de ${nome}:");
    String entrada = stdin.readLineSync()?? "";
    double? peso = double.tryParse(entrada);
    if (peso == null || peso < 0 ) {
      print("Erro! Digite um peso válido");
    } else {
      return peso;
    }

  }
  
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
  if(maior!= null) {
    print("A recém-nascida de maior peso é ${maior.nome} (${maior.peso}kg)");
  } else {
    print("Nenhuma recém-nascida do sexo feminino foi cadastrada.");
  }
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
