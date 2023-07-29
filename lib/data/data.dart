import 'package:todotask/model/label_model.dart';

class Data{

  final List<LabelModel> _labelmodel=[
  ];

  void add_task(LabelModel labelModel){
    _labelmodel.add(labelModel);
  }


  void remove_task(LabelModel labelModel){
    _labelmodel.remove(labelModel);
  }

  LabelModel show_index(var index){
    return _labelmodel[index];
  }

  List<LabelModel> show_list(){
    return _labelmodel;
  }

  List<LabelModel> differentColor(ColorLabel colorLabel){

    List<LabelModel> colorlabel=[];

    for(var color in _labelmodel){
      if(color.colorLabel==colorLabel){
        colorlabel.add(color);
      }
    }

    return colorlabel;
  }
}
