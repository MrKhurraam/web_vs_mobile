
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../Controller/ValuesController.dart';
import '../DeviceSizes.dart';

class DisplayDetail extends StatefulWidget {
  const DisplayDetail({Key? key, this.params}) : super(key: key);

  final Map<String, String>?  params;
  @override
  State<DisplayDetail> createState() => _DisplayDetailState();
}

class _DisplayDetailState extends State<DisplayDetail> with TickerProviderStateMixin{
   _myTabBar(){
    return  TabBar(
      controller: _tabController,
      labelColor: Colors.white,

      indicator: BoxDecoration(
          borderRadius: BorderRadius.circular(50), // Creates border
          color: Colors.blue.shade300),
      unselectedLabelColor: Colors.blue,
      tabs: const [
        Text("one"),
        Text("two"),
        Text("three"),
      ],
    );
  }
   _displayCenter(v1,v2){
     return  Center(
         child: Column(
           mainAxisSize: MainAxisSize.min,
           children: [
             Text("$v1", style: const TextStyle(fontSize: 16, color: Colors.blue, fontWeight: FontWeight.bold),),
             Text("$v2",style: const TextStyle(fontSize: 16, color: Colors.blue,fontWeight: FontWeight.bold),)
           ],
         ));
   }
   late TabController _tabController;
   @override
   void initState() {
     super.initState();
     _tabController = TabController(length: 3, vsync: this);
     // _tabController.animateTo(2);
   }
  @override
  Widget build(BuildContext context) {

    final valuesController = Provider.of<ValuesController>(context, listen: false);
    print("widget.params!['index']! = ${widget.params?['index']}");
    print("null or not : ${widget.params?['index']??4}");
    String vll = widget.params?['index']??"0";
    String alp = widget.params?['alpha']??"A";
    if(vll=="0"){
      print("vll = $vll");
      print("alp = $alp");
      valuesController.selectedIndex = 0;
      valuesController.selectedAlphabet = "A";
    }
    else{
      print("vll = $vll");
      valuesController.selectedIndex = int.parse(vll);
      valuesController.selectedAlphabet = alp;
    }
    // vll=="0"?:null;


    return  SafeArea(

        child: Scaffold(

          appBar: AppBar(
            title: Text("id = ${widget.params}"),
          ),
          backgroundColor: Colors.grey.shade100,
          bottomNavigationBar: DeviceSize.isMobile(context)?Padding(padding: const EdgeInsets.all(10),
            child: _myTabBar(),)
              :const SizedBox.shrink(),
          body: Container(
            width: double.maxFinite,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
               !DeviceSize.isMobile(context)? Padding(padding: const EdgeInsets.all(10),
               child: _myTabBar(),):
               IconButton(
                   onPressed: ()=>Navigator.pop(context),
                   alignment: Alignment.topLeft,
                   icon:  const Icon(Icons.arrow_back, size: 20, color: Colors.blue,)),
                Flexible(
                  fit: FlexFit.loose,
                  child:  Consumer<ValuesController>(
                      builder: (context,values, child) {

                      return TabBarView(
                        controller: _tabController,
                        children: [
                          _displayCenter("one",widget.params!['alpha']??values.selectedAlphabet),
                          _displayCenter("two",widget.params!['alpha']??values.selectedAlphabet),
                          _displayCenter("three",widget.params!['alpha']??values.selectedAlphabet),
                        ],
                      );
                    }
                  ),
                ),

              ],
            ),
          ),
        ),
      );




  }


}
