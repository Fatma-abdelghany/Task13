class Notification {
  String? id;
  String? title;
  DateTime? createdAt;

  Notification.fromJson(Map<String, dynamic> jsonData) {
    id = jsonData[id];
    title = jsonData[title];
    createdAt = jsonData[createdAt];
  }

Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    data['title'] = title;
    data['id'] = id;
    data['createdAt'] = createdAt;
    return data;
  }

}
