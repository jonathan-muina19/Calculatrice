import 'dart:io';
import 'dart:async';


void main() async{
  // La map qui vas stocker nos data
  Map<String, dynamic> studentStorage = {

    
  };

  // oPTION VALIDE
  const List<String> option = ['1', '2', '3', '4', '5', '6'];

  // Le menu avec toutes les options possibles 
  String choice ='''
**************** MENU *******************
*  1. Ajouter ou mettre a jour une note * 
*  2. Supprimer un etudiant             *
*  3. Rechercher une note               *
*  4. Afficher tous les etudiants       *
*  5. Calculer la moyenne               *
*  6. Quittez                           *
*****************************************                              
  Votre choix : '''; 

  while(true){

    print("\n");
    stdout.write(choice);
    String? userChoice = stdin.readLineSync();

  if(userChoice == null || !option.contains(userChoice)){
      print("Veuillez choisir une valeur entre $option");
    }

    // CHOIX 1 : Ajouter ou mettre a jour une note
    // studentStorage["$nameStudent"] = noteStudent;
    else if(userChoice == "1"){
      print("N.B : Si l'etudiant existe deja, sa note seras mise a jour");
      print("\n");
      stdout.write("Entrer le nom de l'etudiant :");
      String? nameStudent =  stdin.readLineSync();
      // Mais on vas d'abord verifier si nameStudent n'est pqs nul ou vide sinon on auras une erreur
      // Mais on boucle tant que le user n'entre pas une valeur
      while(nameStudent == ""){
        print("Attention : Veuillez entrer le nom de l'etudiant !");
        stdout.write("Entrer le nom de l'etudiant :");
        nameStudent = stdin.readLineSync();
      }

      // Si il entrer une donnee , on lui demande d'entrer la note
      stdout.write("Entrer la note de l'etudiant: ");
      String? noteStudent = stdin.readLineSync();
      // On verifie si il a bien entrer la note
      while(noteStudent ==""){
        print("Erreur : Vous devez entrer la note de l'etudiant !");
        stdout.write("Entrer la note de l'etudiant: ");
        noteStudent = stdin.readLineSync();
      }

      // On verifie si l'etudiant existe deja avant de l'ajouter
      if(!studentStorage.containsValue(nameStudent)){
          studentStorage["$nameStudent"] = noteStudent;
          print("Succes :L'etudiant $nameStudent est enregistrer avec succes !"); 

          studentStorage.forEach((index, value){
            print("$index : $value");
          });
      }
    }


    // CHOIX 2: Supprimer un etudiant
    else if(userChoice =="2" ){
      // Avant de supprimer on verifie si le map estg vide.
      if(studentStorage.isEmpty ){
          print("Suppression impossible : Aucun n'etudiant n'est diponible !");
        }
      else{
          stdout.write("Entrer le nom de l'etudiant que vous voulez supprimer: ");
          String? popStudents = stdin.readLineSync();
          // On verifie si l'etudiant existe et si le user a entrer quelque chose
          if(popStudents != null && studentStorage.containsKey(popStudents)){
            studentStorage.remove(popStudents);
            print("Sucess : L'etudiant $popStudents n'existe plus");
            print("---------- Etudiants restants --------");
            studentStorage.forEach((key, values){
              print("$key : $values");
            });
        }
          else{
            print("Erreur :Suppression impossible"); 
        }     
      }     
    }

    // CHOIX 3 : Effectuez une recherche 
    else if(userChoice == "3"){
      stdout.write("Tapez votre recherche (Non de l'etudiant): ");
      String? searchStudent = stdin.readLineSync();

      print("Recherche en cours...");
      await Future.delayed(Duration(seconds: 2));

      if(searchStudent != null && studentStorage.containsKey(searchStudent)){
        print("Etudiant(e) trouver : $searchStudent avec une note ${studentStorage[searchStudent]}");
        print('Existe');
                                                                                          
      }
      else{
        print("Cette etudiant n'existe pas , veuillez entrer une valeur correct!");
      }

    }

    // CHOIX 4 : Afficher tous les paires cle-valeur de la map
    else if(userChoice == "4"){
      if(studentStorage.isNotEmpty){
        studentStorage.forEach((key, value){
          print("$key : $value");
        });
      }
      else{
        print("Pas d'etudiant pour l'instant !");
      }
    }

    // Faire la somme des toutes les notes de la map
    else if(userChoice == "5"){
      if(studentStorage.isNotEmpty){

        try{
          // Convertir toutes les notes en int(entier)
          // On injecte toutes les conversions de types de notre map dans une liste nommer : noteMoyenne
          List<double> noteMoyenne = studentStorage.values.map((val) => double.parse(val)).toList();
          double somme = noteMoyenne.reduce((a, b) => a+b) ;
          // Lq variable moyenneStudent effectue la moyenne de toutes les notes de la map
          var moyenneStudent = somme / studentStorage.length;
          print('La moyenne des etudiants est de : $moyenneStudent');

        }
        catch(e){
          print("ERREUR :Les valeurs pour les notes ne sont pas correct !");
        }
      }
      else{
        print("Pas d'etudiant pour l'instant !");
      }
    }


    // CHOIX 6 : Pour arretr le programme
    else if(userChoice == "6"){
      print("Arret en cours...");
      // On attend pendant 2 secondes avant d'afficher le message d'arret et puis arreter le script
      // Grace a la bibliotheque async
      await Future.delayed(Duration(seconds: 2));
      print("Au revoir !");
      exit(0);

    }

    }// boucle

  }
