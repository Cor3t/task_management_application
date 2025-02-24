class TaskModel {
  final int? id;
  final String title;
  final String description;
  final DateTime dateCreated;

  TaskModel({
    this.id,
    required this.title,
    required this.description,
    required this.dateCreated,
  });

  Map<String, dynamic> toMap() {
    return {
      "id": id,
      "title": title,
      "description": description,
      "date_created": dateCreated,
    };
  }

  factory TaskModel.fromMap(Map<String, dynamic> data) {
    return TaskModel(
      id: data["id"],
      title: data["title"],
      description: data["description"],
      dateCreated: data["dateCreated"],
    );
  }
}
