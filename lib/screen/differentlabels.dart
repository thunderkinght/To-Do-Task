import 'package:flutter/material.dart';
import 'package:todotask/Widgets/label_card.dart';
import 'package:todotask/data/data.dart';
import 'package:todotask/model/label_model.dart';

class DifferentLabel extends StatelessWidget {
  DifferentLabel({Key? key, required this.colorLabel, required this.obj, }) : super(key: key);

  final ColorLabel colorLabel;
  final Data obj;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: obj.differentColor(colorLabel).length!,
      itemBuilder: (context, index) {
        return Dismissible(
          background: Container(
            color: Colors.red,
            child: const Icon(Icons.delete),
          ),
          secondaryBackground: Container(
            color: Colors.green,
            child: const Icon(Icons.check_sharp),
          ),
          key: ValueKey(obj.show_index(index)),
          onDismissed: (direction){
            obj.remove_task(obj.show_list()[index]);
          },
          child: Padding(
            padding: const EdgeInsets.all(5.0),
            child: Label_Card(labelModel: obj.differentColor(colorLabel)[index],obj:obj),
          ),
        );
      },
    );
  }
}
