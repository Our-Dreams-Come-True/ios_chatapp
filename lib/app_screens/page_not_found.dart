import 'package:flutter/cupertino.dart';
import 'package:ios_chatapp/model/users.dart';

class PageNotFound extends StatelessWidget {
  final dynamic textLocation;

  const PageNotFound(
      {super.key, required this.textLocation});

  @override
  Widget build(BuildContext context) {
    return Container(child: Center(child: Text("Page Not Found")));
  }
}
