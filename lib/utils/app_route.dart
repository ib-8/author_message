import 'package:flutter/material.dart';

class AppRoute {
  static Future<T?> push<T>(BuildContext context, Widget child) async {
    return await Navigator.push(
        context, MaterialPageRoute(builder: (_) => child));
  }
}
