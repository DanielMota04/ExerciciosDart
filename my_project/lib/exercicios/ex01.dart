void main(List<String> arguments){
    const List<String> sabores = ['Limao', 'ovos', 'chocolate'];
    print(calcularValor(sabores));
}

double calcularValor(List<String> bolos) {
  const Map<String, double> boloPrecos = {
    'ovos': 5.5,
    'chocolate': 7.5,
    'cenoura': 6.5,
  };

  double valorTotal = 0;

  for (String bolo in bolos) {
    if (boloPrecos.containsKey(bolo)) {
      valorTotal += boloPrecos[bolo]!;
    } else {
      print('$bolo não está no cardápio');
    }
  }
  return valorTotal;
}
