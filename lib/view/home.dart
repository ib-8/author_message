import 'package:authors_app/controller/message_controller.dart';
import 'package:authors_app/widgets/delete_dialog.dart';
import 'package:authors_app/widgets/list_card.dart';
import 'package:authors_app/widgets/styled_text.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final TextEditingController _textEditingController = TextEditingController();
  @override
  void initState() {
    Provider.of<MessageController>(context, listen: false).getMessages();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var messageController = Provider.of<MessageController>(context);
    var messages = messageController.messages;

    return ValueListenableBuilder<TextEditingValue>(
      valueListenable: _textEditingController,
      builder: (context, value, child) {
        bool isSearching = value.text.trim().isNotEmpty;

        var searchList = messages
            .where((element) => element.author.name
                .trim()
                .toLowerCase()
                .contains(value.text.trim()))
            .toList();

        return Scaffold(
          appBar: AppBar(
            leadingWidth: 0.0,
            toolbarHeight: kToolbarHeight + 20,
            title: TextField(
              controller: _textEditingController,
              onTap: () {},
              decoration: const InputDecoration(
                hintText: 'Search',
                suffixIcon: Icon(Icons.search),
              ),
            ),
          ),
          body: messageController.isLoading
              ? const Center(child: CircularProgressIndicator())
              : Column(
                  children: [
                    if (isSearching)
                      Padding(
                        padding: const EdgeInsets.fromLTRB(20, 20, 20, 0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const StyledText(
                              'Search Results',
                              size: 14,
                              color: Colors.grey,
                              weight: FontWeight.w600,
                            ),
                            StyledText(
                              '${searchList.length} found',
                              color: Colors.red,
                              size: 12,
                              weight: FontWeight.bold,
                            ),
                          ],
                        ),
                      ),
                    Flexible(
                      child: ListView.builder(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 10, vertical: 10),
                        itemCount: isSearching
                            ? searchList.length
                            : messages.length +
                                (messageController.isFetching ? 1 : 0),
                        itemBuilder: (context, index) {
                          var message =
                              isSearching ? searchList[index] : messages[index];

                          if (!isSearching && index + 1 == messages.length) {
                            messageController.getMessages();
                            return const Padding(
                              padding: EdgeInsets.all(8.0),
                              child: Center(child: CircularProgressIndicator()),
                            );
                          }

                          return ListCard(
                            showFavourite: !isSearching,
                            message: message,
                            onRemove: () {
                              FocusScope.of(context).unfocus();
                              DeleteDialog.show(context, message);
                            },
                            onFavourite: () {
                              FocusScope.of(context).unfocus();
                              messageController.toggleFavorite(message);
                            },
                          );
                        },
                      ),
                    ),
                  ],
                ),
        );
      },
    );
  }
}
