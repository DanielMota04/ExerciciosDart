String inverterNumero(String valor){
  var valorInvertido = "";
  for (int i = valor.length - 1; i >= 0; i--) {
    valorInvertido += valor[i];
  }
  
  return valorInvertido;
}