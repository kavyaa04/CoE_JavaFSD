
// import 'package:flutter/material.dart';
// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'journal_detail_screen.dart';

// class JournalScreen extends StatefulWidget {
//   @override
//   _JournalScreenState createState() => _JournalScreenState();
// }

// class _JournalScreenState extends State<JournalScreen> {
//   final TextEditingController _titleController = TextEditingController();
//   final TextEditingController _contentController = TextEditingController();
//   final CollectionReference _journalCollection =
//       FirebaseFirestore.instance.collection('journals');

//   void _saveEntry() async {
//     if (_titleController.text.isNotEmpty && _contentController.text.isNotEmpty) {
//       await _journalCollection.add({
//         'title': _titleController.text,
//         'content': _contentController.text,
//         'timestamp': Timestamp.now(),
//       });

//       _titleController.clear();
//       _contentController.clear();
//       setState(() {});
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Color(0xFFF8F1FF), // Soft pastel background
//       appBar: AppBar(
//         title: Text(
//           "My Journal ✨",
//           style: TextStyle(
//             fontWeight: FontWeight.bold,
//             fontFamily: 'Poppins',
//             fontSize: 22,
//           ),
//         ),
//         backgroundColor: Colors.deepPurple,
//         foregroundColor: Colors.white,
//         elevation: 0,
//       ),
//       body: Padding(
//         padding: EdgeInsets.all(16.0),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             TextField(
//               controller: _titleController,
//               decoration: InputDecoration(
//                 labelText: "Title",
//                 labelStyle: TextStyle(
//                   fontSize: 18,
//                   fontWeight: FontWeight.bold,
//                   color: Colors.deepPurple,
//                 ),
//                 border: OutlineInputBorder(
//                   borderRadius: BorderRadius.circular(12),
//                   borderSide: BorderSide(color: Colors.deepPurple, width: 2),
//                 ),
//               ),
//               style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
//             ),
//             SizedBox(height: 10),
//             TextField(
//               controller: _contentController,
//               decoration: InputDecoration(
//                 labelText: "Write your thoughts...",
//                 labelStyle: TextStyle(fontSize: 16, color: Colors.deepPurpleAccent),
//                 border: OutlineInputBorder(
//                   borderRadius: BorderRadius.circular(12),
//                 ),
//               ),
//               maxLines: 5,
//               style: TextStyle(fontSize: 16, fontStyle: FontStyle.italic),
//             ),
//             SizedBox(height: 15),
//             Center(
//               child: ElevatedButton.icon(
//                 onPressed: _saveEntry,
//                 icon: Icon(Icons.save, color: Colors.white),
//                 label: Text("Save Entry"),
//                 style: ElevatedButton.styleFrom(
//                   backgroundColor: Colors.deepPurple,
//                   foregroundColor: Colors.white,
//                   padding: EdgeInsets.symmetric(horizontal: 20, vertical: 12),
//                   shape: RoundedRectangleBorder(
//                     borderRadius: BorderRadius.circular(12),
//                   ),
//                 ),
//               ),
//             ),
//             SizedBox(height: 20),
//             Expanded(
//               child: StreamBuilder(
//                 stream: _journalCollection.orderBy('timestamp', descending: true).snapshots(),
//                 builder: (context, snapshot) {
//                   if (!snapshot.hasData) return Center(child: CircularProgressIndicator());
//                   var docs = snapshot.data!.docs;
//                   return ListView.builder(
//                     itemCount: docs.length,
//                     itemBuilder: (context, index) {
//                       var entry = docs[index];
//                       return GestureDetector(
//                         onTap: () {
//                           Navigator.push(
//                             context,
//                             MaterialPageRoute(
//                               builder: (context) => JournalDetailScreen(entry),
//                             ),
//                           );
//                         },
//                         child: Card(
//                           margin: EdgeInsets.symmetric(vertical: 8),
//                           elevation: 5,
//                           shape: RoundedRectangleBorder(
//                             borderRadius: BorderRadius.circular(15),
//                           ),
//                           color: Colors.white,
//                           child: Padding(
//                             padding: EdgeInsets.all(16),
//                             child: Row(
//                               mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                               children: [
//                                 Text(
//                                   entry['title'],
//                                   style: TextStyle(
//                                     fontSize: 18,
//                                     fontWeight: FontWeight.bold,
//                                     fontFamily: 'Poppins',
//                                   ),
//                                 ),
//                                 Icon(Icons.arrow_forward_ios, color: Colors.deepPurple),
//                               ],
//                             ),
//                           ),
//                         ),
//                       );
//                     },
//                   );
//                 },
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }











import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'journal_detail_screen.dart';

class JournalScreen extends StatefulWidget {
  @override
  _JournalScreenState createState() => _JournalScreenState();
}

class _JournalScreenState extends State<JournalScreen> {
  final TextEditingController _titleController = TextEditingController();
  final TextEditingController _contentController = TextEditingController();
  final CollectionReference _journalCollection =
      FirebaseFirestore.instance.collection('journals');

  void _saveEntry() async {
    if (_titleController.text.isNotEmpty && _contentController.text.isNotEmpty) {
      await _journalCollection.add({
        'title': _titleController.text,
        'content': _contentController.text,
        'timestamp': Timestamp.now(),
      });

      _titleController.clear();
      _contentController.clear();
      setState(() {});
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [Color(0xFFD5E8D4), Color(0xFFFDEBD0)], // Pastel Green → Beige
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: SafeArea(
          child: Padding(
            padding: EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Center(
                  child: Text(
                    "My Journal ✨",
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      fontFamily: 'Poppins',
                      color: Color(0xFF2E4600), // Deep Forest Green
                    ),
                  ),
                ),
                SizedBox(height: 20),
                Container(
                  padding: EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    color: Colors.white.withOpacity(0.9),
                    borderRadius: BorderRadius.circular(15),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black12,
                        blurRadius: 8,
                        offset: Offset(0, 4),
                      ),
                    ],
                  ),
                  child: Column(
                    children: [
                      TextField(
                        controller: _titleController,
                        decoration: InputDecoration(
                          labelText: "Title",
                          labelStyle: TextStyle(fontSize: 18, color: Color(0xFF2E4600)),
                          border: InputBorder.none,
                        ),
                        style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                      ),
                      Divider(color: Colors.grey),
                      TextField(
                        controller: _contentController,
                        decoration: InputDecoration(
                          labelText: "Write your thoughts...",
                          labelStyle: TextStyle(fontSize: 16, fontStyle: FontStyle.italic),
                          border: InputBorder.none,
                        ),
                        maxLines: 5,
                        style: TextStyle(fontSize: 16, fontStyle: FontStyle.italic),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 15),
                Center(
                  child: ElevatedButton(
                    onPressed: _saveEntry,
                    child: Text("Save Entry"),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Color(0xFF5C755E), // Muted Sage Green
                      foregroundColor: Colors.white,
                      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 12),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 20),
                Expanded(
                  child: StreamBuilder(
                    stream: _journalCollection.orderBy('timestamp', descending: true).snapshots(),
                    builder: (context, snapshot) {
                      if (!snapshot.hasData) return Center(child: CircularProgressIndicator());
                      var docs = snapshot.data!.docs;
                      return ListView.builder(
                        itemCount: docs.length,
                        itemBuilder: (context, index) {
                          var entry = docs[index];
                          return GestureDetector(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => JournalDetailScreen(entry),
                                ),
                              );
                            },
                            child: Card(
                              margin: EdgeInsets.symmetric(vertical: 8),
                              elevation: 5,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(15),
                              ),
                              color: Colors.white,
                              child: Padding(
                                padding: EdgeInsets.all(16),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      entry['title'],
                                      style: TextStyle(
                                        fontSize: 18,
                                        fontWeight: FontWeight.bold,
                                        fontFamily: 'Poppins',
                                        color: Color(0xFF2E4600),
                                      ),
                                    ),
                                    Icon(Icons.arrow_forward_ios, color: Color(0xFF5C755E)),
                                  ],
                                ),
                              ),
                            ),
                          );
                        },
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
