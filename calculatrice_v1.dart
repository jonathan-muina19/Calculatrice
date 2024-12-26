/*
  Objectif
Créer une petite calculatrice dans le terminal qui :

Demande à l'utilisateur d'entrer deux nombres.
Demande à l'utilisateur de choisir une opération (+, -, *, /).
Effectue l'opération choisie et affiche le résultat.
Étapes
Créez une fonction addition, soustraction, multiplication, et division pour effectuer chaque opération.
Créez une fonction calculer qui appelle la bonne fonction en fonction de l'opération choisie.
Implémentez la logique dans la fonction main.

*/

import 'dart:io';

void main(){

  List<String> operations = ['+','-','*','/'];
  // Demande à l'utilisateur d'entrer deux nombres.
  print(operations);
  // Premier nombre
  stdout.write("Entrer le premier nombre: ");
  String? number1 = stdin.readLineSync();
  // Pour number1 : On verifie que l'utilisateur a bien entrer des donnees , avant de le converir en entier
  if(number1 != null && number1 != "" ){
    try{
    int? number1Int = int.tryParse(number1);
    // deuxieme nombre
    stdout.write("Entrer le deuxieme nombre: ");
    String? number2 = stdin.readLineSync();
   // Pour number2 : On verifie que l'utilisateur a bien entrer des donnees , avant de le converir en entier
    if(number2 != null && number2 != ""){
      try{
        int? number2Int = int.tryParse(number2);
        if(number1Int == null || number2Int == null){
          print("Erreur : Le programme n'accepte que les valeurs numeriques !");
          return;
        }
        // Choix de l'operateur
        stdout.write("Entrer l'operateur parmis $operations: ");
        String? op = stdin.readLineSync();

        while(op == '' || !operations.contains(op)){
          print("Erreur: Veuillez entrer une operation parmis $operations ");
          stdout.write("Entrer l'operateur parmis $operations: ");

          op = stdin.readLineSync();
        }

      // On appelle la fonctiion qui fais les calculs en tenant compte de l'operateur entrer par l'utilisateur
      vefifyCalcul(number1Int: number1Int, number2Int: number2Int,op: op);
      
      }
      catch(e){
        print("Erreur: Entrer une valeur valide pour le nombre 2 !");
      }
    }
    else{
      print("Erreur : Veuillez entrer une valeur en 2");
    }

  }
  catch(e){
    print("$e");
  }
  }

  else{
    print("Erreur : Veuillez entrer une valeur en 1 !");
  }    
}

// La fonction qui nous permet a faire un calcul en tenant compte de l'operateur
void vefifyCalcul({required  number1Int,required  number2Int, required op}){

  switch (op){
    case "+":
      late int resultAdd ;  // On cree une variable tardive avec le mot cle late
      resultAdd = addition(number1Int, number2Int);
      print("$number1Int $op $number2Int = $resultAdd");

    case "-":
      late int resultSous;
      resultSous = soustract(number1Int, number2Int);
      print("$number1Int $op $number2Int = $resultSous");
        
    case "/":
      if(number2Int == 0) // On verifie si le denominateur est egal a 0
          {
          print("Erreur : La division par 0 est impossible !");
        }

      else{
          late double resultDiv;
          resultDiv = division(number1Int, number2Int);
          print("$number1Int $op $number2Int = $resultDiv");
          }
        
    case "*":
      late int resultMult;
      resultMult = multiplication(number1Int, number2Int);
      print("$number1Int $op $number2Int = $resultMult");
        
    default:
      print("Erreur: impossible d'effectuer cette operation");
      }
}
// Les fonctions flechees pour les calcules en tenant compte Des operations entrer par le user
// pour effectuer l'addition
int addition(int num1, int num2) => num1 + num2;
// pour effectuer la soustraction
int soustract(int num1, int num2) => num1 - num2;
// pour effectuer la division
double division(int num1, int num2) => num1 / num2;
// pour effectuer la multiplication
int multiplication(int num1, int num2) => num1 * num2;


