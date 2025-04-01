

// import 'package:flutter/material.dart';
// import 'package:cloud_firestore/cloud_firestore.dart';

// class JournalDetailScreen extends StatelessWidget {
//   final QueryDocumentSnapshot entry;

//   JournalDetailScreen(this.entry);

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Color(0xFFF8F1FF), // Soft pastel background
//       appBar: AppBar(
//         title: Text(
//           entry['title'],
//           style: TextStyle(fontFamily: 'Poppins'),
//         ),
//         backgroundColor: Colors.deepPurple,
//         foregroundColor: Colors.white,
//       ),
//       body: Center(
//         child: Padding(
//           padding: EdgeInsets.all(20.0),
//           child: Card(
//             elevation: 8,
//             shape: RoundedRectangleBorder(
//               borderRadius: BorderRadius.circular(15),
//             ),
//             color: Colors.white,
//             child: Padding(
//               padding: EdgeInsets.all(20.0),
//               child: Column(
//                 mainAxisSize: MainAxisSize.min,
//                 children: [
//                   Text(
//                     entry['title'],
//                     style: TextStyle(
//                       fontSize: 22,
//                       fontWeight: FontWeight.bold,
//                       fontFamily: 'Poppins',
//                       color: Colors.deepPurple,
//                     ),
//                   ),
//                   SizedBox(height: 10),
//                   Divider(color: Colors.deepPurple),
//                   SizedBox(height: 10),
//                   Text(
//                     entry['content'],
//                     style: TextStyle(
//                       fontSize: 18,
//                       fontStyle: FontStyle.italic,
//                       fontFamily: 'Poppins',
//                       color: Colors.black87,
//                     ),
//                     textAlign: TextAlign.center,
//                   ),
//                 ],
//               ),
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }






















// import 'package:flutter/material.dart';
// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:intl/intl.dart';

// class JournalDetailScreen extends StatelessWidget {
//   final DocumentSnapshot entry;

//   JournalDetailScreen(this.entry);

//   @override
//   Widget build(BuildContext context) {
//     // Format the timestamp
//     String formattedDate = DateFormat('EEEE, MMM d, yyyy • h:mm a')
//         .format(entry['timestamp'].toDate());

//     return Scaffold(
//       body: Container(
//         decoration: BoxDecoration(
//           gradient: LinearGradient(
//             colors: [Color(0xFFD5E8D4), Color(0xFFFDEBD0)], // Pastel Green → Beige
//             begin: Alignment.topLeft,
//             end: Alignment.bottomRight,
//           ),
//         ),
//         child: SafeArea(
//           child: Padding(
//             padding: EdgeInsets.all(16.0),
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 // Back button
//                 IconButton(
//                   icon: Icon(Icons.arrow_back, color: Color(0xFF2E4600), size: 28),
//                   onPressed: () {
//                     Navigator.pop(context);
//                   },
//                 ),
//                 SizedBox(height: 10),

//                 // Journal Title
//                 Text(
//                   entry['title'],
//                   style: TextStyle(
//                     fontSize: 26,
//                     fontWeight: FontWeight.bold,
//                     fontFamily: 'Poppins',
//                     color: Color(0xFF2E4600), // Deep Forest Green
//                   ),
//                 ),
//                 SizedBox(height: 8),

//                 // Date & Time
//                 Text(
//                   formattedDate,
//                   style: TextStyle(
//                     fontSize: 14,
//                     fontStyle: FontStyle.italic,
//                     color: Colors.grey.shade700,
//                   ),
//                 ),
//                 SizedBox(height: 16),

//                 // Journal Content Box
//                 Expanded(
//                   child: Container(
//                     padding: EdgeInsets.all(20),
//                     decoration: BoxDecoration(
//                       color: Colors.white.withOpacity(0.9),
//                       borderRadius: BorderRadius.circular(15),
//                       boxShadow: [
//                         BoxShadow(
//                           color: Colors.black12,
//                           blurRadius: 8,
//                           offset: Offset(0, 4),
//                         ),
//                       ],
//                     ),
//                     child: SingleChildScrollView(
//                       child: Text(
//                         entry['content'],
//                         style: TextStyle(
//                           fontSize: 18,
//                           fontStyle: FontStyle.italic,
//                           color: Colors.black87,
//                           height: 1.5,
//                         ),
//                       ),
//                     ),
//                   ),
//                 ),

//                 SizedBox(height: 20),
//                 Center(
//                   child: ElevatedButton(
//                     onPressed: () {
//                       Navigator.pop(context);
//                     },
//                     child: Text("Go Back"),
//                     style: ElevatedButton.styleFrom(
//                       backgroundColor: Color(0xFF5C755E), // Muted Sage Green
//                       foregroundColor: Colors.white,
//                       padding: EdgeInsets.symmetric(horizontal: 20, vertical: 12),
//                       shape: RoundedRectangleBorder(
//                         borderRadius: BorderRadius.circular(12),
//                       ),
//                     ),
//                   ),
//                 ),
//               ],
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }


















import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:intl/intl.dart';

class JournalDetailScreen extends StatelessWidget {
  final DocumentSnapshot entry;

  JournalDetailScreen(this.entry);

  @override
  Widget build(BuildContext context) {
    String formattedDate = DateFormat('EEEE, MMM d, yyyy • h:mm a')
        .format(entry['timestamp'].toDate());

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
                IconButton(
                  icon: Icon(Icons.arrow_back, color: Color(0xFF2E4600), size: 28),
                  onPressed: () => Navigator.pop(context),
                ),
                SizedBox(height: 10),

                // Journal Title
                Text(
                  entry['title'],
                  style: TextStyle(
                    fontSize: 26,
                    fontWeight: FontWeight.bold,
                    fontFamily: 'Poppins',
                    color: Color(0xFF2E4600),
                  ),
                ),
                SizedBox(height: 8),

                // Date & Time
                Text(
                  formattedDate,
                  style: TextStyle(
                    fontSize: 14,
                    fontStyle: FontStyle.italic,
                    color: Colors.grey.shade700,
                  ),
                ),
                SizedBox(height: 16),

                // **Fixed White Box for Content**
                Container(
                  width: double.infinity,
                  height: MediaQuery.of(context).size.height * 0.45, // Fixed height (Adjustable)
                  padding: EdgeInsets.all(20),
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
                  child: SingleChildScrollView(
                    child: Text(
                      entry['content'],
                      style: TextStyle(
                        fontSize: 18,
                        fontStyle: FontStyle.italic,
                        color: Colors.black87,
                        height: 1.5,
                      ),
                    ),
                  ),
                ),

                SizedBox(height: 20),
                Center(
                  child: ElevatedButton(
                    onPressed: () => Navigator.pop(context),
                    child: Text("Go Back"),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Color(0xFF5C755E),
                      foregroundColor: Colors.white,
                      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 12),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
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
