import 'package:flutter/material.dart';
import 'package:my_to_do_list/models/todolist_model.dart';

// ignore: must_be_immutable
class TaskCard extends StatefulWidget {
  // creation varaibles pour que TaskCard reçoie data
  final int id;
  final String title;
  bool isCompleted;
  final Function insertfunction;
  final Function deletefunction;

  TaskCard(
    { required this.id, 
    required this.title, 
    required this.insertfunction, 
    required this.isCompleted, 
    required this.deletefunction,
    Key? key})
     : super(key: key);

  @override
  TaskCardState createState() => TaskCardState();
}

class TaskCardState extends State<TaskCard> {
  @override
  Widget build(BuildContext context) {
    // creation task local
    var otherTask = Tasks(
      id: widget.id, 
      title: widget.title, 
      isCompleted: widget.isCompleted);
    //
    return Card(
      child: Row(
        children: [
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 15, vertical:10),
            child: Checkbox
            (value: widget.isCompleted, 
            onChanged: (bool? value){
              setState(() {
                widget.isCompleted = value!;
              });
              // changer valeur pour une autre task (modifier)
              otherTask.isCompleted = value!;
              // insertion dans la base de donnée
              widget.insertfunction(otherTask);
             },
          ),
        ),
        // c'est pour le titre
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              widget.title,
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 18,

              )
              ), 
            const SizedBox(height: 5),
          ],
        ),
      ),
      // boutton supprimer
      IconButton(onPressed: (){
        // ajouter la methdoe de supprimer(delete)
        widget.deletefunction(otherTask);
        Colors.black87;

      }, 
      icon: const Icon(Icons.close)),
        ],
      ),
    );
  }
}