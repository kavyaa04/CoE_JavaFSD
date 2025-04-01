class JournalModel {
  String id;
  String userId;
  String content;
  DateTime date;

  JournalModel({
    required this.id,
    required this.userId,
    required this.content,
    required this.date,
  });

  factory JournalModel.fromMap(Map<String, dynamic> map) {
    return JournalModel(
      id: map['id'],
      userId: map['userId'],
      content: map['content'],
      date: DateTime.parse(map['date']),
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'userId': userId,
      'content': content,
      'date': date.toIso8601String(),
    };
  }
}
