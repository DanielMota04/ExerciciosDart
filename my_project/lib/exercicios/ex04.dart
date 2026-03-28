import 'dart:io';

void main(List<String> arguments){
  List<Aluno> turma = [];

  while(true){
    PrintarCadastrados(turma);
    print("Digite a matricula do aluno (00000 p/encerrar):");
    String matricula = stdin.readLineSync()!;
    if(matricula == '00000' ){break;}

    print("Digite o nome do aluno:");
    String nome = stdin.readLineSync()!;
    
    print("Digite o sexo do aluno(M/F):");
    String sexo = stdin.readLineSync()!.toUpperCase();
    
    print("Digite a nota 1 do aluno:");
    double nota1 = double.parse(stdin.readLineSync()!);
    print("Digite a nota 2 do aluno:");
    double nota2 = double.parse(stdin.readLineSync()!);
    print("Digite a nota 3 do aluno:");
    double nota3 = double.parse(stdin.readLineSync()!);
    double media = (nota1 + nota2 + nota3) / 3;
    print("Digite a quantidade de faltas do aluno:");
    int qtdFaltas = int.parse(stdin.readLineSync()!);

    Aluno aluno = Aluno(matricula,nome,sexo,nota1,nota2,nota3,media,qtdFaltas);
    turma.add(aluno);
  }

  CalcularMediaTurma(turma);
  PorcentagemAprovados(turma);
  MelhoresAlunosPGenero(turma);
  CalcularMediaFeminina(turma);
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
  print("A média das alunas é ${soma / qtd}");
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

  print("Matricula do melhor aluno: ${melhorMasculino!.matricula} | Matricula da melhor aluna: ${melhorFeminino!.matricula }");
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
