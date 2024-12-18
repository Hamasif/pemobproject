import 'package:projectpemmob/models/product_model.dart';

class MessageModel {
  String message;
  int userId;
  String userName;
  String userImage;
  bool isFromUser;
  ProductModel product;
  DateTime createdAt;
  DateTime updatedAt;

  MessageModel({
    required this.message,
    required this.userId,
    required this.userName,
    required this.userImage,
    required this.isFromUser,
    required this.product,
    required this.createdAt,
    required this.updatedAt,
  });

  MessageModel.fromJson(Map<String, dynamic> json)
      : message = json['message'],
        userId = json['userId'],
        userName = json['userName'],
        userImage = json['userImage'],
        isFromUser = json['isFromUser'],
        product = json['product'].isEmpty
            ? UninitializedProductModel()
            : ProductModel.fromJson(json['product']),
        createdAt = DateTime.parse(json['createdAt']),
        updatedAt = DateTime.parse(json['updatedAt']);

  Map<String, dynamic> toJson() {
    return {
      'message': message,
      'userId': userId,
      'userName': userName,
      'userImage': userImage,
      'isFromUser': isFromUser,
      'product': product is UninitializedProductModel ? {} : product.toJson(),
      'createdAt': createdAt.toIso8601String(),
      'updatedAt': updatedAt.toIso8601String(),
    };
  }
}

class UninitializedMessageModel extends MessageModel {
  UninitializedMessageModel()
      : super(
          message: '',
          userId: 0,
          userName: '',
          userImage: '',
          isFromUser: false,
          product: UninitializedProductModel(),
          createdAt: DateTime.now(),
          updatedAt: DateTime.now(),
        );
}
