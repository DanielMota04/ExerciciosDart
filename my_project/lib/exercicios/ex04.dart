import 'dart:io';

void main(List<String> arguments){
  List<Aluno> turma = [];

  while(true){
    PrintarCadastrados(turma);
    print("Digite a matricula do aluno (00000 p/encerrar):");
    String matricula = stdin.readLineSync()!.trim();
    if(matricula == '00000' ){break;}

    String nome = VerificaNome();

    String sexo = VerificaSexo();
    
    double nota1 = VerificarNota(1);
    double nota2 = VerificarNota(2);
    double nota3 = VerificarNota(3);
    double media = (nota1 + nota2 + nota3) / 3;

    int qtdFaltas = VerificarFaltas();

    Aluno aluno = Aluno(matricula,nome,sexo,nota1,nota2,nota3,media,qtdFaltas);
    turma.add(aluno);
  }
  if(turma.isEmpty){
    print("Nenhum Aluno Cadastrado");
  }else{
  CalcularMediaTurma(turma);
  PorcentagemAprovados(turma);
  MelhoresAlunosPGenero(turma);
  CalcularMediaFeminina(turma);
  }
}

String VerificaNome(){
  while(true){
    print("Digite o nome do aluno: ");
    String resposta = stdin.readLineSync()!;
    if(!resposta.trim().isEmpty){
      return resposta;
    }else{
      print("A resposta está vazia");
    }
  }
}
String VerificaSexo(){
  while(true){
    print("Digite o sexo do aluno(M/F):");
    String sexo = stdin.readLineSync()!.toUpperCase();
    if(sexo == 'M' || sexo == 'F')return sexo;
    print("Digite Novamente, A resposta só deve ser 'M' ou 'F'");
  }
  
}

double VerificarNota(int num){
  while(true){
    print("Digite a nota ${num} do aluno:");
    String entrada = stdin.readLineSync()?? "";
    double? nota = double.tryParse(entrada);
    if (nota == null || nota < 0 || nota > 10) {
      print("Erro! Digite um valor numérico entre 0 e 10.");
    } else {
      return nota;
    }

  }
  
}

int VerificarFaltas(){
  while(true){
    print("Digite a quantidade de faltas do aluno:");
    String entrada = stdin.readLineSync()?? "";
    int? nota = int.tryParse(entrada);
    if (nota == null) {
      print("Erro! Digite um número inteiro");
    } else {
      return nota;
    }
  }
}


void PrintarCadastrados(List<Aluno> turma){
  if(turma.isEmpty){
    print("Nenhum Aluno Cadastrado");
  }
  for (var aluno in turma) {
    print("Matricula: ${aluno.matricula} | Aluno ${aluno.nome}");
  }
}

void CalcularMediaTurma(List<Aluno> turma){
  double soma = 0;
  for (var aluno in turma) {
    soma += aluno.media;
  }
  print("A media da turma é ${soma / turma.length}");
}

void CalcularMediaFeminina(List<Aluno> turma){
  double soma = 0;
  int qtd =0;
  for (var aluna in turma) {
    if(aluna.sexo == 'F'){soma += aluna.media;qtd++;}
  }
  qtd == 0? print("Nenhuma Aluna foi cadastrada"): print("A média das alunas é ${soma / qtd}");
}


void PorcentagemAprovados(List<Aluno> turma){
  int aprovados =0;
  for (var aluno in turma) {
    if(aluno.isAprovado()){
      aprovados++;
    }
  }
  double porcentagem = (aprovados / turma.length)*100;
  print("Porcentagem de aprovados: $porcentagem% ");
}

void MelhoresAlunosPGenero(List<Aluno> turma){
  Aluno? melhorMasculino;
  Aluno? melhorFeminino;

  for (var aluno in turma) {
    if(aluno.sexo == 'M'){
      if(melhorMasculino ==null ||aluno.media > melhorMasculino!.media ){
        melhorMasculino = aluno;
      }
    }
    else if(aluno.sexo == 'F'){
      if(melhorFeminino == null || aluno.media > melhorFeminino!.media){
        melhorFeminino = aluno;
      }
    }
  }
  String matM = melhorMasculino!= null ? melhorMasculino.matricula : "Nenhum";
  String matF = melhorFeminino!= null ? melhorFeminino.matricula : "Nenhuma";
  print("Matricula do melhor aluno: ${matM} | Matricula da melhor aluna: ${matF }");
}



class Aluno{
  String matricula;
  String nome;
  String sexo;
  double nota1,nota2,nota3;
  double media;
  int qtdFaltas;
  
  Aluno(this.matricula, this.nome,this.sexo, this.nota1,this.nota2, this.nota3,this.media, this.qtdFaltas);

  bool isAprovado(){
    if(media >= 7.0 && qtdFaltas <=18){
      return true;
    }else{
      return false;
    }
  }
}
