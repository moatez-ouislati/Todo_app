class Tasks{
  int? id;
  final String title;
  bool isCompleted;

  //creation de constructeur
  Tasks({
    this.id,
    required this.title,
    required this.isCompleted,
  });
  
  //fonction map pour faire la sauvgrade de data

  Map<String, dynamic> toMap() {
    return {
      'id':id,
      'title':title,
      'isCompleted':isCompleted ? 1 : 0, //initialiser bool car sqflite database ne supporte pas boolean
    };
  }

  //pour faire debugging

@override
String toString(){
  return 'todo(id : $id, title: $title, isCompleted : $isCompleted)';
}

}