import 'dart:io';

///**************************************** */
///
/// LES BASES DE DART
/// CORRECTION DE L'EXERCICE JOUR 1
///****************************************** */


/// EXERCISE 1
salut(String lu){
  print(lu);
}

/// EXERCICE 2 => calcul age
/// 

calculAge(int anneNaiss){
  var result = 2020 - anneNaiss;
  return result;
}

void main(List<String> args) {
  stdout.writeln("Donner année de naissance age");
  var valeurEntrer = stdin.readLineSync();
  print(calculAge(int.parse(valeurEntrer)));
}

