
import 'package:flutter/cupertino.dart';

class ValuesController extends ChangeNotifier{

  String selectedAlphabet = "A";

  var lst = [
   {"0":"A","1":"B","2":"C",},
    {"0":"D","1":"E","2":"F",},
    {"0":"G","1":"H","2":"I",},
   {"0":"J","1":"K","2":"L",},
  ];

  int selectedIndex = 0;

  setSelectedAlphabet(String alp){
    selectedAlphabet = alp;
    notifyListeners();
  }
  setSelectedIndex(int idx){
    print("setSelectedIndex = $idx");
    selectedIndex = idx;
    // setSelectedAlphabet(lst[idx]['0'].toString());
    notifyListeners();
  }



}