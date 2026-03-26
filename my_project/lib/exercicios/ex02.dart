import 'dart:math';

void main(List<String> arguments){
    print(calculaValorDaSerie(5));
}

double calculaValorDaSerie(int tamanho){
    int dividendo = 3;
    int divisor = 5;
    int exp = 4;

    int contador = 0;

    double resultadoTotal = 0;

    while (contador < tamanho){

        double valor = (pow(dividendo, calculaFatorial(exp)) / divisor);

        if (contador >= 4 && contador % 2 == 0){
            resultadoTotal -= valor;
        }
        else{
            resultadoTotal += valor;
        }

        dividendo += 2;
        divisor += 5;
        exp += 4;
        contador++;
    }
    return resultadoTotal;
}

int calculaFatorial(int valor){
    int total = 1;
    for (int i = 1; i <= valor; i++){
        total *= i;
    }
    return total;
}