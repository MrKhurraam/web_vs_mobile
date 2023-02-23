
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'Controller/ValuesController.dart';
import 'DeviceSizes.dart';
import 'Widgets/Alphabets.dart';
import 'Widgets/DisplayScreen.dart';
import 'Widgets/Drawer.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key, this.params,}) : super(key: key);
  final Map<String, String>?  params;
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  // late final ValuesController valuesController;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    // valuesController = context.read<ValuesController>();
    // valuesController.setSelectedIndex(int.parse(widget.params!['index']!));
  }

  @override
  Widget build(BuildContext context) {
    double h = MediaQuery.of(context).size.height;
    double w = MediaQuery.of(context).size.width;

    return WillPopScope(
      onWillPop: () async => false,
      child: Scaffold(
        body: Container(
          color: Colors.greenAccent.shade200,
          child: DeviceSize(
              mobile: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children:  [
              Expanded(child: Alphabets(params: widget.params,)),
              // Expanded(child: widget.child),
            ],
          ),
              tablet: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children:  [

              Expanded(
                  flex: 1,
                  child: Alphabets(params: widget.params,)),
              Expanded(
                  flex:2,
                  child: DisplayDetail(params: widget.params,)),
            ],
          ),
              website:
              Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children:  [
              //
              // Expanded(
              //     flex: 1,
              //     child: MyDrawer()),
              Expanded(
                  flex: 2,
                  child: Alphabets(params: widget.params,)),
              Expanded(
                  flex: 4,
                  child: DisplayDetail(
                      params: widget.params
                  )),
            ],
          ),
          )
        ),
      ),
    );
  }
}


class HomeNestedPage extends StatefulWidget {
  const HomeNestedPage({Key? key, this.params, required this.child,}) : super(key: key);
  final Map<String, String>?  params;
  final Widget child;
  @override
  State<HomeNestedPage> createState() => _HomeNestedPageState();
}

class _HomeNestedPageState extends State<HomeNestedPage> {
  // late final ValuesController valuesController;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    // valuesController = context.read<ValuesController>();
    // valuesController.setSelectedIndex(int.parse(widget.params!['index']!));
  }

  @override
  Widget build(BuildContext context) {
    double h = MediaQuery.of(context).size.height;
    double w = MediaQuery.of(context).size.width;

    return WillPopScope(
      onWillPop: () async => false,
      child: Scaffold(
        body: Container(
            color: Colors.greenAccent.shade200,
            child: DeviceSize(
              mobile: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children:  [
                  Expanded(child: Alphabets(params: widget.params,)),
                  // Expanded(child: widget.child),
                ],
              ),
              tablet: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children:  [
                  Expanded(
                      flex: 4,
                      child:widget.child),
                  // Expanded(
                  //     flex: 1,
                  //     child: Alphabets(params: widget.params,)),
                  // Expanded(
                  //     flex:2,
                  //     child: DisplayDetail(params: widget.params,)),
                ],
              ),
              website:
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children:  [

                  Expanded(
                      flex: 2,
                      child: Alphabets(params: widget.params,)),
                  Expanded(
                      flex: 4,
                      child:widget.child),
                ],
              ),
            )
        ),
      ),
    );
  }
}


class HomePage2 extends StatefulWidget {
  const HomePage2({Key? key, required this.child}) : super(key: key);
  final Widget child;
  @override
  State<HomePage2> createState() => _HomePage2State();
}

class _HomePage2State extends State<HomePage2> {
  Map<String, String>?  paramss = {"pgNo":"2","alph":"A"};
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
          color: Colors.greenAccent.shade200,
          child: DeviceSize(
              mobile: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children:  [
                  // Expanded(child: Alphabets()),
                  Expanded(child: widget.child),
                ],
              ),
              tablet: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [

                  Expanded(
                      flex: 1,
                      child: Alphabets()),
                  // Expanded(
                  //     flex:2,
                  //     child: DisplayDetail(params: paramss,)),
                  Expanded(
                      flex: 4,
                      child:widget.child),
                ],
              ),
              website:

                Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children:  [

                Expanded(
                    flex: 1,
                    child: MyDrawer()),
                Expanded(
                    flex: 4,
                    child:widget.child),
                // Expanded(
                //     flex: 4,
                //     child: widget.child),
              ],
            ),
          )
      ),
    );
  }
}

