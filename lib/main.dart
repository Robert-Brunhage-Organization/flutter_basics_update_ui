import 'package:flutter/material.dart';
import 'package:flutter_ui_update_basics/my_change_notifier.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => MyChangeNotifier(),
        ),
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: HomeChangeNotifierPage(),
      ),
    );
  }
}

class HomeWithSetStatePage extends StatefulWidget {
  @override
  _HomeWithSetStatePageState createState() => _HomeWithSetStatePageState();
}

class _HomeWithSetStatePageState extends State<HomeWithSetStatePage> {
  String name = 'Robert';

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return Scaffold(
      body: Center(
        child: Column(
          children: [
            SizedBox(height: 108),
            Text('My name is', style: textTheme.headline1),
            Text(name, style: textTheme.headline2),
            Spacer(),
            TextField(
              onSubmitted: (value) {
                // We want to update the name
                // WE NEED TO CALL SETSTATE TO TRIGGER A REBUILD
                setState(() {
                  name = value;
                });
              },
            ),
          ],
        ),
      ),
    );
  }
}

class HomePage extends StatelessWidget {
  final ValueNotifier<String> nameNotifier = ValueNotifier('Robert');

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return Scaffold(
      body: Center(
        child: Column(
          children: [
            SizedBox(height: 108),
            Text('My name is', style: textTheme.headline1),
            ValueListenableBuilder(
              valueListenable: nameNotifier,
              builder: (context, name, child) {
                return Text(name, style: textTheme.headline2);
              },
            ),
            Spacer(),
            TextField(
              onSubmitted: (value) {
                // We want to update the name
                nameNotifier.value = value;
              },
            ),
          ],
        ),
      ),
    );
  }
}

class HomeChangeNotifierPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return Scaffold(
      body: Center(
        child: Column(
          children: [
            SizedBox(height: 108),
            Text('My name is', style: textTheme.headline1),
            Consumer<MyChangeNotifier>(
              builder: (context, myChangeNotifier, child) {
                return Text(myChangeNotifier.name, style: textTheme.headline2);
              },
            ),
            Spacer(),
            TextField(
              onSubmitted: (value) {
                // We want to update the name
                context.read<MyChangeNotifier>().name = value;
              },
            ),
          ],
        ),
      ),
    );
  }
}
