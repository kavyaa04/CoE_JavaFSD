// class QuoteModel {
//   String id;
//   String author;
//   String text;

//   QuoteModel({required this.id, required this.author, required this.text});

//   factory QuoteModel.fromMap(Map<String, dynamic> map) {
//     return QuoteModel(
//       id: map['id'],
//       author: map['author'],
//       text: map['text'],
//     );
//   }

//   Map<String, dynamic> toMap() {
//     return {
//       'id': id,
//       'author': author,
//       'text': text,
//     };
//   }
// }





class QuoteModel {
  String id;
  String author;
  String content; // Changed 'text' to 'content' to match API response

  QuoteModel({required this.id, required this.author, required this.content});

  factory QuoteModel.fromMap(Map<String, dynamic> map) {
    return QuoteModel(
      id: map['_id'], // API returns '_id' instead of 'id'
      author: map['author'] ?? "Unknown", // Default to 'Unknown' if no author
      content: map['content'], // Use 'content' instead of 'text'
    );
  }

  Map<String, dynamic> toMap() {
    return {
      '_id': id,
      'author': author,
      'content': content,
    };
  }
}
