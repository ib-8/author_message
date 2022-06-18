import 'package:authors_app/controller/message_controller.dart';
import 'package:authors_app/data/model/message.dart';
import 'package:authors_app/widgets/delete_button.dart';
import 'package:authors_app/widgets/styled_text.dart';
import 'package:flutter/material.dart';
import 'package:authors_app/utils/extentions.dart';
import 'package:provider/provider.dart';

class DeleteDialog {
  static show(BuildContext context, MessageElement message) async {
    var controller = Provider.of<MessageController>(context, listen: false);
    await showDialog(
      context: context,
      builder: (context) {
        return SimpleDialog(
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
          title: const StyledText(
            'Delete this author?',
            size: 20,
            weight: FontWeight.bold,
          ),
          children: [
            ListTile(
              leading: ClipOval(
                child: Image.network(message.author.photoUrl),
              ),
              title: StyledText(
                message.author.name,
                size: 16,
                weight: FontWeight.bold,
              ),
              subtitle: StyledText(
                message.updated.diffInString(),
                size: 12,
              ),
            ),
            const SizedBox(height: 15),
            Padding(
              padding: const EdgeInsets.only(right: 15.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  MaterialButton(
                    child: const StyledText(
                      'Cancel',
                      size: 15,
                      weight: FontWeight.w600,
                    ),
                    onPressed: () async {
                      Navigator.pop(context);
                    },
                  ),
                  DeleteButton(
                    size: 18,
                    onDelete: () async {
                      await controller.delete(message);

                      Navigator.pop(context);
                    },
                  ),
                ],
              ),
            )
          ],
        );
      },
    );
  }
}
