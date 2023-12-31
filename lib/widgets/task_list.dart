import 'package:flutter/material.dart';
import '../models/db.dart';
import './task_card.dart';
class TaskList extends StatelessWidget {
  // creation objet de la base d donnée connect
  // pour le passage vers taskcard , mais au premiert atsk_list reccoie la focntion
  final Function insertfunction;
  final Function deletefunction;
  
  final db = DatabaseConnect();
   TaskList(
    {required this.insertfunction,
    required this.deletefunction, 
    Key? key }) 
    : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: FutureBuilder(
        future: db.getTask(),
        initialData: const [],
        builder: (BuildContext context, AsyncSnapshot<List> snapshot){
          var data = snapshot.data; // 
          var datalength = data!.length;

          return datalength == 0 
              ? const Center(
                  child: Text('aucune donnée trouvée'),
               ) 
              : ListView.builder(
                itemCount: datalength,
                 itemBuilder: (context, i) => TaskCard(
                  id: data[i].id,
                  title: data[i].title,
                  isCompleted: data[i].isCompleted,
                  insertfunction: insertfunction,
                  deletefunction: deletefunction,
                  ),
                );
        }, 
        
      ),
    );
  }
}