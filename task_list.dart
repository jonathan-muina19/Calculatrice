import 'dart:io';
import 'dart:async';
void main() async{
  const List<String> choiceTask = ['1', '2', '3', '4', '5'];
  // La liste pour stocker le tache est du type dynamic , cad il prend les donnees de toutes les types
  List<dynamic> taskList = ["python"];

  // Le menu avec toutes les options possibles 
  String choiceMenu ='''
**************** MENU *****************
*      1. Ajouter une tache           *
*      2. Afficher toutes les taches  *
*      3. Supprimer une tache         *
*      4. Modifier une tache          *
*      5. Quittez                     *
***************************************                               
  Votre choix : '''; 
           
 
  while(true){
    print("\n");
    stdout.write(choiceMenu);
    String ? userChoice = stdin.readLineSync();

  if(userChoice == null || !choiceTask.contains(userChoice)){
      print("Erreur : Veuillez choisir une valeur entre: $choiceTask");
  }
  // CHOIX 1: Pour ajouter une tache dans la liste
  else if(userChoice == "1"){
      stdout.write("Entrer le nom de la tache a ajouter: ");
      String? addChoice = stdin.readLineSync();

      // Convertir toutes les entrer en miniscules
      // Mais on vas d'abord verifier si addChoice n'est pqs nul ou vide sinon on auras une erreur
      if(addChoice != null && addChoice != ""){
        String convertAddchoiceUser = addChoice.toLowerCase();
        // On verifie si la tache existe deja pour eviter la rendondace
        if(taskList.contains(convertAddchoiceUser)){
          print("La tache existe deja !");
        }
        else{
        taskList.add(convertAddchoiceUser);
        print("Success : La tache $convertAddchoiceUser ajouter avec succes !"); 
         }
      }
      else{
        print("Erreur: Veuillez entrer une valeur correct !");
      }
    }

  // CHOIX 2: Pour afficher toutes les taches disponibles
  else if(userChoice == "2"){
    if(taskList.length == 0){
      print("Aucune tache n'est disponible !");
    }
    else{
      print("**** LISTE DES TACHES ****");
      // On affiche chaque taches avec son index
      for(int indice =0 ; indice < taskList.length;indice++){
      print("${indice+1}. ${taskList[indice]}");
    }
    }
  
  }
   // CHOIX 3: Pour supprimer une tache
  else if(userChoice == "3"){
    stdout.write("Entrer le nom de la tache que vous voulez supprimmer: ");
    String? popStudent = stdin.readLineSync();
    // Convertir toutes les entrer en miniscules
    // Mais on vas d'abord verifier si popStudent n'est pas nul ou vide sinon on auras une erreur
    if(popStudent != null && popStudent != ""){
      // On convertit les entrees en minuscule
      String convertPopStudent = popStudent.toLowerCase();
      if(!taskList.contains(convertPopStudent)){
        print("L'element $convertPopStudent n'existe pas");
      }
      else{
        
        taskList.remove(convertPopStudent);
        print("La tache $convertPopStudent a été supprimer avec succes !");
        // On affiche les taches restantes
        for(int indice =0 ; indice < taskList.length;indice++){
        print("${indice+1}. ${taskList[indice]}");
      }
      }
    }
    else{
      print("Erreur: Veuillez entrer une valeur correct !");
    }
  }

   // CHOIX 4: Pour modifier une tache a l'aide de son index
  else if(userChoice == "4"){
    if(taskList.length == 0){
      print("Erreur : Modification impossible , la liste des taches est vide !");
    }
    else{
      for(int indice =0 ; indice < taskList.length;indice++){
      print("${indice}. ${taskList[indice]}");
    }
    stdout.write("Entrer l'ordre(inidce) de l'element a modifier: ");
    String? updateTask = stdin.readLineSync(); 
    

   
    if(updateTask != null && updateTask.isNotEmpty){
      try{
        int? updateInt = int.tryParse(updateTask);
      if(updateInt != null && updateInt >= 0 && updateInt < taskList.length){
      stdout.write("Entrer la nouvelle valeur: ");
      String? newValue = stdin.readLineSync();

      if(newValue != null && newValue.isNotEmpty){
        String convertUpdateTask = newValue.toLowerCase();
        taskList[updateInt] = convertUpdateTask;
        print("Tache modifiee avec succes !");
      } 
      else{
        print("La nouvelle valeur n'est pas etre vide !");
      }     
    }
      else{
        print("Indice introuvanle!");
      }
    }
      catch(e){
        print("$e");
      }
    }
   }

  // CHOIX 5: Pour Arreter le programme une tache
  }
  else if (userChoice == "5"){
    print("Arret en cours...");
    // On attend pendant 2 secondes avant d'afficher le message d'arret et puis arreter le script
    // Grace a la bibliotheque async
    await Future.delayed(Duration(seconds: 2));
    print("OFF");
    exit(0);
  }
}
}