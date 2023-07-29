import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:todotask/Widgets/label_card.dart';
import 'package:todotask/model/label_model.dart';
import 'package:todotask/data/data.dart';

class Labels extends StatelessWidget {
  Labels({Key? key, required this.labelmodel, required this.obj, }) : super(key: key);

  final List<LabelModel> labelmodel;
  final Data obj;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: labelmodel.length!,
      itemBuilder: (context, index) {
        return Dismissible(
          background: Container(
            color: Colors.red,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: const[
                  Icon(Icons.delete),
                  Spacer()
                ],
              ),
            ),
          ),
            secondaryBackground: Container(
              padding: const EdgeInsets.all(8),
              color: Colors.green,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  children: const [
                    Spacer(),
                    Icon(Icons.check_sharp,),
                  ],
                ),
              ),
            ),
            key: ValueKey(obj.show_index(index)),
            onDismissed: (direction){
                obj.remove_task(labelmodel[index]);
            },
            child: Padding(
              padding: const EdgeInsets.all(5.0),
              child: Label_Card(labelModel: labelmodel[index],obj:obj),
            ),
        );
      },
    );
  }
}

