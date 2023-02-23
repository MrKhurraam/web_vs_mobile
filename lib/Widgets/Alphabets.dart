



import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

import '../Controller/ValuesController.dart';
import '../DeviceSizes.dart';
import 'DisplayScreen.dart';
import 'Drawer.dart';

class Alphabets extends StatefulWidget {
  const Alphabets({Key? key, this.params}) : super(key: key);
  final Map<String, String>?  params;
  @override
  State<Alphabets> createState() => _AlphabetsState();
}

class _AlphabetsState extends State<Alphabets> {
  @override
  Widget build(BuildContext context) {
    double w = MediaQuery.of(context).size.width;


    return Scaffold(
      drawer:
       Drawer(
        backgroundColor: Colors.red,
        width: DeviceSize.isWebsite(context)?double.maxFinite: 200,
        child: const MyDrawer(),
      ),
      backgroundColor: Colors.grey.shade200,
      appBar: AppBar(
        toolbarHeight: !DeviceSize.isWebsite(context)?35:0,
        iconTheme: const IconThemeData(color: Colors.blue),
        elevation: 0,
        backgroundColor: Colors.grey.shade200,
      ),
      body: Consumer<ValuesController>(
      builder: (context, val, child) {
        return
        ListView.builder(
            shrinkWrap: true,
            itemCount: val.lst[val.selectedIndex].length,
          itemBuilder: (context, index) {
            return Padding(
              padding: const EdgeInsets.only(left: 8.0,right: 8,top: 8),
              child: ElevatedButton(onPressed: () {
              val.setSelectedAlphabet("${val.lst[val.selectedIndex]['$index']}");

              // GoRouter.of(context).go('/${val.selectedIndex+1}/${val.lst[val.selectedIndex]['$index']}');
              // GoRouter.of(context).go('/${val.selectedIndex+1}');
              // context.go(context.namedLocation('/${val.selectedIndex+1}',
              //     params: <String, String>{'fid': "${val.selectedIndex+1}"}));

              GoRouter.of(context).goNamed("${val.lst[val.selectedIndex]['$index']}",
                  queryParams: {
                    "index": "${val.selectedIndex}",
                    "alpha":"${val.lst[val.selectedIndex]['$index']}",
                    }
                  );

              if(DeviceSize.isMobile(context)) {
                Navigator.push(context, MaterialPageRoute(builder: (context)=> DisplayDetail(
                    params: {
                  "index": "${val.selectedIndex}",
                  "alpha":"${val.lst[val.selectedIndex]['$index']}",
                })));

                // GoRouter.of(context).pushNamed('/${val.selectedIndex+1}/${val.lst[val.selectedIndex]['$index']}');
              }

              }, child: Text("${val.lst[val.selectedIndex]['$index']}"),


              ),
            );
          }
        );
      },
      ),
    );
  }
}
