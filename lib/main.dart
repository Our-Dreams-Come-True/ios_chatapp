import 'package:flutter/cupertino.dart';
import 'package:ios_chatapp/app_screens/call/add_call_page.dart';
import 'package:ios_chatapp/app_screens/chat/chat_page.dart';
import 'package:ios_chatapp/app_screens/chat/other_user_profile.dart';
import 'package:ios_chatapp/app_screens/cupertino_call.dart';
import 'package:ios_chatapp/app_screens/page_not_found.dart';
import 'package:ios_chatapp/body.dart';
import 'package:ios_chatapp/provider/user_provider.dart';
import 'package:ios_chatapp/shared/style.dart';
import 'package:overlay_support/overlay_support.dart';
import 'package:provider/provider.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (ctx) => UserProvider())
      ],
      child: OverlaySupport.global(
        child: CupertinoApp(
          debugShowCheckedModeBanner: false,
          theme: const CupertinoThemeData(brightness: Brightness.light),
          initialRoute: "/",
          routes: {
            "/": (context) => const Body(),
            "/call": (context) => const CupertinoCall(textLocation: ''),
            "/profile": (context) => const OtherUserProfile(userId: ''),
            "/chat": (context) => const ChatPage(userInfo: '')
          },
          onGenerateRoute: (settings) {
            final List<String> pathElements = settings.name!.split("/");

            if (pathElements[0] != '') return null;
            if (pathElements[1] == 'profile') {
              String userId = pathElements[2];
              return CupertinoPageRoute(builder: ((context) => OtherUserProfile(userId: userId)), settings: settings);
            }

            if (pathElements[1] == 'chat') {
              String userId = pathElements[2];
              return CupertinoPageRoute(builder: ((context) => ChatPage(userInfo: userId)));
            }

            if (pathElements[1] == 'call') {
              return CupertinoPageRoute(builder: ((context) => const AddCallPage(callInfo: "addCall")));
            }
            return null;
          },
          onUnknownRoute: (settings) => CupertinoPageRoute(builder: (context) => PageNotFound(textLocation: getTitleText[3],))
        )
      )
    );
  }
}
