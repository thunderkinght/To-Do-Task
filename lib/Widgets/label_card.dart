import 'package:flutter/material.dart';
import 'package:todotask/data/data.dart';
import 'package:todotask/model/label_model.dart';

class Label_Card extends StatelessWidget {
  const Label_Card({Key? key, required this.labelModel, required this.obj}) : super(key: key);

  final LabelModel labelModel;
  final Data obj;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Text(labelModel.title),
            Table(
              columnWidths: const {
                0:FractionColumnWidth(0.3),
              },
              children: [
                TableRow(
                  children: [
                    const Text("Description"),
                    Text(labelModel.description),
                  ]
                ),
                TableRow(
                    children: [
                      const Text("Date"),
                      Text(labelModel.formattedDate),
                    ]
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
