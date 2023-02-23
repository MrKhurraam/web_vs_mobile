
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

import '../Controller/ValuesController.dart';
import '../DeviceSizes.dart';

class MyDrawer extends StatefulWidget {
  const MyDrawer({Key? key}) : super(key: key);

  @override
  State<MyDrawer> createState() => _MyDrawerState();
}

class _MyDrawerState extends State<MyDrawer> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(

      backgroundColor: Colors.grey.shade300,
      body: Consumer<ValuesController>(
        builder: (context,val,child) {
          return ListView.builder(
              shrinkWrap: true,
            itemCount: val.lst.length,
              itemBuilder: (context, index){
                return   Padding(
                  padding: const EdgeInsets.only(left: 8.0,right: 8,top: 8),
                  child: ElevatedButton(
                      onPressed: (){
                    val.setSelectedIndex(index);
                    val.setSelectedAlphabet(val.lst[index]['0'].toString());
                    _onItemTapped(index,val.lst[index]['0'].toString(),context);
                 if(!DeviceSize.isWebsite(context)) {
                   Navigator.pop(context);
                 }
                  }, child: Text("${index+1}")),
                );
              });
        }
      ),
    );
  }

  void _onItemTapped(int index, String alp, BuildContext context) {
    switch (index) {
      case 0:
        GoRouter.of(context).goNamed('A',
            queryParams: {
              "index": "${index.toString()}",
              "alpha":"$alp",
            }
        );
        break;
      case 1:
        GoRouter.of(context).goNamed('D',
            queryParams: {
              "index": "${index.toString()}",
              "alpha":"$alp",
            }
        );
        break;
      case 2:
        GoRouter.of(context).goNamed('G',
            queryParams: {
              "index": "${index.toString()}",
              "alpha":"$alp",
            }
        );
        break;
      case 3:
        GoRouter.of(context).goNamed('J',
            queryParams: {
              "index":"${index.toString()}",
              "alpha":"$alp",
            }
        );
        break;
    }
  }

}
