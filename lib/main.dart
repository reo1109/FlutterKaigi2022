import 'package:flutter/material.dart';
import 'package:flutterkaigi/pages/index.dart';
import 'package:flutterkaigi/provider/app_provider.dart';
import 'package:graphql_flutter/graphql_flutter.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initHiveForFlutter();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppProvider(
      child: MaterialApp(
        title: 'FlutterKaigi 2022',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: const MyHomePage(appTitle: 'FlutterKaigi 2022 Demo Home Page'),
      ),
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({
    final Key? key,
    required String appTitle,
  })  : _appTitle = appTitle,
        super(key: key);

  final String _appTitle;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_appTitle),
      ),
      body: IssueListPage(),
    );
  }
}
