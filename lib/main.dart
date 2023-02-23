import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'Controller/ValuesController.dart';
import 'HomePage.dart';
import 'MyRoutes.dart';
import 'Widgets/Alphabets.dart';
import 'Widgets/DisplayScreen.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => ValuesController()),
      ],
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      title: 'Web & Mobile',
      theme: ThemeData(
        iconTheme: IconThemeData(color: Colors.red),
      ),
      routerConfig: MyRoutes.myRoutes,
      // home: HomePage(),
    );
  }
}

/// The screen of the error page.
class ErrorScreen extends StatefulWidget {
  /// Creates an [ErrorScreen].
  const ErrorScreen(this.error, {Key? key}) : super(key: key);

  /// The error to display.
  final Exception error;

  @override
  State<ErrorScreen> createState() => _ErrorScreenState();
}

class _ErrorScreenState extends State<ErrorScreen> {
  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(title: const Text('Page Not Found')),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              // SelectableText(error.toString()),
              TextButton(
                onPressed: () => context.go('/1/A'),
                child: const Text('Go to Home'),
              ),
            ],
          ),
        ),
      );
}
