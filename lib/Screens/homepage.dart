import 'package:flutter/material.dart';
import 'package:my_to_do_list/models/db.dart';
import 'package:my_to_do_list/models/todolist_model.dart';
import '../widgets/user_in.dart';
import '../widgets/task_list.dart';
class Homepage extends StatefulWidget {
  const Homepage({ Key? key}) : super(key: key);

  @override
  HomepageState createState() => HomepageState();
}

class HomepageState extends State<Homepage> {
  // creation fonction ici

  // creation data base pour l'accés au fonction de la data base
   var db = DatabaseConnect();

   // une fonction pour ajouter une tache(Task)
   void addItem(Tasks tasks) async{
    await db.insertTask(tasks);
    setState(() {});
   }

   // une fonction pour faire supprimer tache(task)
   void deleteItem(Tasks tasks) async{
    await db.deleteTask(tasks);
    setState(() {});
   }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFFFFFF),
      appBar: AppBar(
        title: const Text(
          'Taskful'
          ),
        backgroundColor: Colors.lime[600],
      ),
      body: Column(
        children: [
          TaskList(insertfunction: addItem, deletefunction: deleteItem,), 
          // ajouter widget ici
         
          UserInput(
            insertfunction: addItem,


          ),

        ],

      ),

    );
  }
}