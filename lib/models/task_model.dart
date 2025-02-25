class TaskModel {
  final int? id;
  final String title;
  final String description;
  final bool completed;
  final String dateCreated;

  TaskModel({
    this.id,
    required this.title,
    required this.description,
    required this.completed,
    required this.dateCreated,
  });

  Map<String, dynamic> toMap() {
    return {
      "title": title,
      "description": description,
      "completed": completed,
      "dateCreated": dateCreated,
    };
  }

  factory TaskModel.fromMap(Map<String, dynamic> data) {
    print(data["completed"]);
    return TaskModel(
      id: data["id"],
      title: data["title"],
      description: data["description"],
      completed: data["completed"] == 1,
      dateCreated: data["dateCreated"],
    );
  }
}
