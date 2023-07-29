import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:todotask/Widgets/addlabel_widget.dart';
import 'package:todotask/data/data.dart';
import 'package:todotask/model/label_model.dart';
import 'package:todotask/screen/differentlabels.dart';
import 'labels.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Namer App',
      theme: ThemeData(
        useMaterial3: true,
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepOrange),
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  var selectedindex=0;
  Data obj=Data();


  @override
  Widget build(BuildContext context) {
    Widget page;
    switch (selectedindex) {
      case 0:
        page = Labels(labelmodel: obj.show_list(),obj: obj,);
        break;
      case 1:
        page = DifferentLabel(colorLabel: ColorLabel.red, obj: obj,);
        break;
      case 2:
        page = DifferentLabel(colorLabel: ColorLabel.yellow, obj: obj,);
        break;
      case 3:
        page= DifferentLabel(colorLabel: ColorLabel.green, obj: obj,);
        break;
      case 4:
        page= AddLabel_Widget(obj: obj,);
        break;
      default:
        throw UnimplementedError('no widget for $selectedindex');
    }

    return Scaffold(
      body: Row(
        children: [
          SafeArea(
            child: NavigationRail(
              extended: false,
              destinations: const [
                NavigationRailDestination(
                  icon: Icon(Icons.label),
                  label: Text('Favorites'),
                ),
                NavigationRailDestination(
                  icon: Icon(Icons.label,color: Colors.red,),
                  label: Text("Red"),
                ),
                NavigationRailDestination(
                  icon: Icon(Icons.label,color: Colors.yellow,),
                  label: Text("Red"),
                ),
                NavigationRailDestination(
                  icon: Icon(Icons.label,color: Colors.green,),
                  label: Text("Red"),
                ),
                NavigationRailDestination(
                  icon: Icon(Icons.add),
                  label: Text('Home'),
                ),
              ],
              selectedIndex: selectedindex,
              onDestinationSelected: (value) {
                setState(() {
                  selectedindex=value;
                });
              },
            ),
          ),
          Expanded(
            child: Container(
              color: Theme.of(context).colorScheme.primaryContainer,
              child: page,
            ),
          ),
        ],
      ),
    );
  }
}