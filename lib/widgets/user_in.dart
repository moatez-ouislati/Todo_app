import 'package:flutter/material.dart';
import 'package:my_to_do_list/models/todolist_model.dart';

class UserInput extends StatelessWidget {
  final textController = TextEditingController();
  final Function insertfunction; // c'est pour recevoir la fonction de addItem 
  UserInput({required this.insertfunction, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
      color: const Color(0xFFF5F5F5),
      child: Row(
        children: [
          // input Box
          Expanded(
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 15),

              child: TextField(
                controller: textController,
                decoration: const InputDecoration(
                  hintText: 'Ajouter une nouvelle tâche',
                  border: InputBorder.none,
                ),
              ),
            ),
          ),

          const SizedBox(width: 20,),
          // les bouttons

          GestureDetector(
            onTap: (){
            // creation task
            var myTask = Tasks(
              title: textController.text,
              isCompleted: false );
              //passage passage insertfunction comme parametre
          insertfunction(myTask);
          },
          
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 15),
            decoration: BoxDecoration(
              color: Colors.black87,
              borderRadius: BorderRadius.circular(10),
              boxShadow: const[
                BoxShadow(
                  color: Colors.black12,
                  blurRadius: 5,
                  offset: Offset(0, 2),
                ),
              ],
            ),
            child: const Text(
              'Ajouter', 
              style:  TextStyle(
              color:  Colors.white,
              fontWeight: FontWeight.bold,
               ),
              ),
            ),
          )
        ],
      ),
    );
  }
}