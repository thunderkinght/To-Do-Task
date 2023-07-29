import 'package:flutter/material.dart';
import 'package:todotask/model/label_model.dart';
import 'package:todotask/data/data.dart';

class AddLabel_Widget extends StatefulWidget {
const AddLabel_Widget({Key? key, required this.obj}) : super(key: key);

final Data obj;

@override
State<AddLabel_Widget> createState() => _AddLabel_WidgetState();
}

class _AddLabel_WidgetState extends State<AddLabel_Widget> {
final _titleController=TextEditingController();
final _descriptionController=TextEditingController();
DateTime? _pickdate;
late ColorLabel _selectedColor=ColorLabel.red;


@override
void dispose() {
  _titleController.dispose();
  _descriptionController.dispose();
  super.dispose();
}


void _presentDatePicker() async {
  final now = DateTime.now();
  final firstDate = DateTime(now.year - 1, now.month, now.day);
  final pickedDate = await showDatePicker(
    context: context,
    initialDate: now,
    firstDate: firstDate,
    lastDate: now,
  );
  setState(() {
    _pickdate = pickedDate!;
  });
}

void _sumbitLabel(){
  if(_titleController.text.trim().isEmpty|| _descriptionController.text.trim().isEmpty || _pickdate==null){
    showDialog(context: context, builder: (ctx)=>
        AlertDialog(
          title: const Text("Invalid Input"),
          content: const Text("Please make sure a valid title, description and date was entered"),
          actions: [
            TextButton(onPressed: (){
              Navigator.pop(ctx);
            }, child: const Text("Okay"))
          ],
        ),
    );
  }
  else{
    widget.obj.add_task(LabelModel(
        title: _titleController.text,
        description: _descriptionController.text,
        dateTime: _pickdate!,
        colorLabel: _selectedColor,
    )
    );
    _titleController.clear();
    _descriptionController.clear();
  }
}

@override
Widget build(BuildContext context) {
  return SafeArea(
    child: Padding(
      padding: const EdgeInsets.all(13.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          TextField(
            controller: _titleController,
            maxLength: 20,
            decoration: const InputDecoration(
              label: Text("Title"),
            ),
          ),
          TextField(
            controller: _descriptionController,
            maxLines: 3,
            keyboardType: TextInputType.multiline,
            decoration: const InputDecoration(
              label: Text("Description"),
            ),
          ),
          const SizedBox(height: 20,),
          Row(
            children: [
              Text(_pickdate==null? 'No data is Selected': formatter.format(_pickdate!)),
              IconButton(onPressed: _presentDatePicker , icon: const Icon(Icons.calendar_month)),
              const Spacer(),
              DropdownButton(
                  value: _selectedColor,
                  items: ColorLabel.values.map(
                        (colorlabel) => DropdownMenuItem(
                      value: colorlabel,
                      child: Text(colorlabel.name.toUpperCase(),),),)
                      .toList(),
                  onChanged: (value){
                    setState(() {
                      _selectedColor=value!;
                    });
                  }),
            ],
          ),
          const SizedBox(height: 10,),
          Row(
            children: [
              TextButton(onPressed: (){
                _titleController.clear();
                _descriptionController.clear();
              }, child: const Text("Cancel")),
              const SizedBox(width: 10,),
              ElevatedButton(onPressed: _sumbitLabel, child: const Text("Submit")),
            ],
          )
        ],
      ),
    ),
  );
}
}
