// import 'package:projectpemmob/models/message_model.dart';
// import 'package:projectpemmob/models/product_model.dart';
// import 'package:projectpemmob/models/user_model.dart';

// class MessageService {
//   final FirebaseFirestore firestore = FirebaseFirestore.instance;

//   // Updated method with required parameter
//   Stream<List<MessageModel>> getMessagesByUserId({required int userId}) {
//     try {
//       return firestore
//           .collection('messages')
//           .where('userId', isEqualTo: userId)
//           .snapshots()
//           .map((QuerySnapshot list) {
//         var result = list.docs.map<MessageModel>((DocumentSnapshot message) {
//           print(message.data());
//           return MessageModel.fromJson(message.data() as Map<String, dynamic>);
//         }).toList();

//         result.sort(
//           (MessageModel a, MessageModel b) =>
//               a.createdAt.compareTo(b.createdAt),
//         );

//         return result;
//       });
//     } catch (e) {
//       throw Exception('Failed to load messages: $e');
//     }
//   }

//   // Updated method with required parameters
//   Future<void> addMessage({
//     required UserModel user,
//     required bool isFromUser,
//     required String message,
//     required ProductModel product,
//   }) async {
//     try {
//       await firestore.collection('messages').add({
//         'userId': user.id,
//         'userName': user.name,
//         'userImage': user.profilePhotoUrl,
//         'isFromUser': isFromUser,
//         'message': message,
//         'product': product is UninitializedProductModel ? {} : product.toJson(),
//         'createdAt': DateTime.now().toString(),
//         'updatedAt': DateTime.now().toString(),
//       }).then(
//         (value) => print('Pesan Berhasil Dikirim!'),
//       );
//     } catch (e) {
//       throw Exception('Pesan Gagal Dikirim! $e');
//     }
//   }
// }
