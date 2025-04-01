import 'package:cloud_firestore/cloud_firestore.dart';
import '../models/journal_model.dart';
import '../models/quote_model.dart';

class FirestoreService {
  final FirebaseFirestore _db = FirebaseFirestore.instance;

  Future<void> addJournalEntry(JournalModel journal) async {
    try {
      await _db.collection('journals').doc(journal.id).set(journal.toMap());
    } catch (e) {
      print("Error adding journal: $e");
    }
  }

  Stream<List<JournalModel>> getJournalEntries(String userId) {
    return _db.collection('journals')
        .where('userId', isEqualTo: userId)
        .snapshots()
        .map((snapshot) => snapshot.docs
            .map((doc) => JournalModel.fromMap(doc.data()))
            .toList());
  }

  Future<List<QuoteModel>> fetchQuotes() async {
    try {
      QuerySnapshot querySnapshot = await _db.collection('quotes').get();
      return querySnapshot.docs
          .map((doc) => QuoteModel.fromMap(doc.data() as Map<String, dynamic>))
          .toList();
    } catch (e) {
      print("Error fetching quotes: $e");
      return [];
    }
  }
}
