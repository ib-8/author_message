import 'package:authors_app/data/model/message.dart';
import 'package:authors_app/utils/app_route.dart';
import 'package:authors_app/view/details.dart';
import 'package:authors_app/widgets/delete_button.dart';
import 'package:authors_app/widgets/styled_text.dart';
import 'package:flutter/material.dart';
import 'package:authors_app/utils/extentions.dart';

class ListCard extends StatelessWidget {
  const ListCard({
    Key? key,
    required this.message,
    required this.onRemove,
    required this.onFavourite,
    required this.showFavourite,
  }) : super(key: key);

  final MessageElement message;
  final VoidCallback onRemove;
  final VoidCallback onFavourite;
  final bool showFavourite;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      child: Card(
        elevation: 0,
        margin: const EdgeInsets.symmetric(vertical: 12),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15),
          side: BorderSide(
            color: Colors.grey[300]!,
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  ClipOval(
                    child: Image.network(
                      message.author.photoUrl,
                      height: 50,
                      width: 50,
                      fit: BoxFit.cover,
                    ),
                  ),
                  const SizedBox(width: 15),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      StyledText(
                        message.author.name,
                        size: 12,
                        weight: FontWeight.bold,
                      ),
                      const SizedBox(height: 8),
                      StyledText(
                        message.updated.diffInString(),
                        size: 12,
                        color: Colors.grey[800]!,
                      ),
                    ],
                  ),
                ],
              ),
              Row(
                children: [
                  if (showFavourite)
                    FavouriteButton(
                        isFavourite: message.isFavourite,
                        onFavourite: onFavourite),
                  const SizedBox(width: 18),
                  DeleteButton(onDelete: onRemove),
                ],
              ),
            ],
          ),
        ),
      ),
      onTap: () {
        FocusScope.of(context).unfocus();

        AppRoute.push(context, Details(message));
      },
    );
  }
}

class FavouriteButton extends StatelessWidget {
  const FavouriteButton({
    Key? key,
    required this.isFavourite,
    required this.onFavourite,
  }) : super(key: key);

  final bool isFavourite;
  final VoidCallback onFavourite;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      child: Icon(
        Icons.favorite,
        color: isFavourite ? Colors.red : Colors.grey.withOpacity(0.2),
      ),
      onTap: onFavourite,
    );
  }
}
