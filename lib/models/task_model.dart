class TaskModel {
  final int? id;
  final String title;
  final String description;
  final bool completed;
  final DateTime dateCreated;

  TaskModel({
    this.id,
    required this.title,
    required this.description,
    required this.completed,
    required this.dateCreated,
  });

  Map<String, dynamic> toMap() {
    return {
      "id": id,
      "title": title,
      "description": description,
      "completed": completed,
      "date_created": dateCreated,
    };
  }

  factory TaskModel.fromMap(Map<String, dynamic> data) {
    return TaskModel(
      id: data["id"],
      title: data["title"],
      description: data["description"],
      completed: data["completed"],
      dateCreated: data["dateCreated"],
    );
  }
}
