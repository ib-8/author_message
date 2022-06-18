import 'package:authors_app/controller/message_controller.dart';
import 'package:authors_app/data/model/message.dart';
import 'package:authors_app/widgets/list_card.dart';
import 'package:authors_app/widgets/styled_text.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Details extends StatelessWidget {
  const Details(this.message, {Key? key}) : super(key: key);

  final MessageElement message;

  @override
  Widget build(BuildContext context) {
    var messageController = Provider.of<MessageController>(context);
    return Scaffold(
      appBar: AppBar(
        iconTheme: const IconThemeData(color: Colors.red),
        title: const StyledText(
          'Details',
          weight: FontWeight.bold,
        ),
        actions: [
          FavouriteButton(
            isFavourite: message.isFavourite,
            onFavourite: () => messageController.toggleFavorite(message),
          ),
          const SizedBox(width: 30),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 20),
        child: Column(children: [
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 25.0),
            child: ClipOval(
              child: Image.network(
                message.author.photoUrl,
                height: 200,
                width: 200,
                fit: BoxFit.cover,
              ),
            ),
          ),
          StyledText(
            message.author.name,
            size: 25,
            weight: FontWeight.bold,
          ),
          const SizedBox(height: 25),
          StyledText(
            message.content,
            size: 15,
            weight: FontWeight.bold,
            textHeight: 1.4,
            align: TextAlign.center,
          ),
        ]),
      ),
    );
  }
}
