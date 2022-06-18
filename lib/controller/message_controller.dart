import 'dart:convert';
import 'package:authors_app/utils/constants/api.dart';
import 'package:authors_app/data/model/message.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class MessageController extends ChangeNotifier {
  final GlobalKey<AnimatedListState> listKey = GlobalKey<AnimatedListState>();

  List<MessageElement> messages = [];
  bool isLoading = true;
  bool isFetching = false;

  String _pageToken = '';

  Future getMessages() async {
    isFetching = true;

    var query = '?pageToken==$_pageToken';
    var url = Uri.parse(Api.message + query);

    var response = await http.get(url);

    Map<String, dynamic> data = jsonDecode(response.body);

    var message = Message.fromMap(data);

    _pageToken = message.pageToken;

    messages.addAll(message.messages);

    isLoading = false;
    isFetching = false;
    notifyListeners();
  }

  delete(MessageElement message) {
    messages.removeWhere((element) => element.id == message.id);
    notifyListeners();
  }

  toggleFavorite(MessageElement message) {
    message.isFavourite = !message.isFavourite;
    notifyListeners();
  }
}
