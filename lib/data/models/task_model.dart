class TaskModel{
  int? id ;
  String? title;
  String? date;
  String? startTime;
  String? endTime;
  int? color ;
  int? isCompleted;
  int? isUnCompleted;
  int? isFavourite;
  int? reminder;

   TaskModel.fromJson(Map<String, dynamic> json) {
      id= json["id"];
      title= json["title"];
      date= json["date"];
      startTime= json["startTime"];
      endTime= json["endTime"];
      color= json["color"];
      isCompleted= json["isCompleted"];
      isUnCompleted= json["isUnCompleted"];
      isFavourite= json["isFavourite"];
      reminder=json["reminder"];

  }

  Map<String, dynamic> toJson() {
    return {
      "id": id,
      "title": title,
      "date": date,
      "startTime": startTime,
      "endTime": endTime,
      "color": color,
      "isCompleted": isCompleted,
      "isUnCompleted": isUnCompleted,
      "isFavourite": isFavourite,
      "reminder": reminder,
    };
  }

  TaskModel({
    this.id,
    this.title,
    this.date,
    this.startTime,
    this.endTime,
    this.color,
    this.isCompleted,
    this.isUnCompleted,
    this.isFavourite,
    this.reminder});


}