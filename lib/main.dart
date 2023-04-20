import 'package:flutter/material.dart';
import 'package:window_style_dropdown_menu/window_style_dropdown_menu.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
    bool isVisible = false;
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    List<String> list = ["Home","Home2","Home3","Home4","Home5"];
    return Scaffold(
      body: LayoutBuilder(builder: (BuildContext ctx, BoxConstraints constraints) {
        if(constraints.maxWidth >= 480){

           return Column(
             children: [
               Row(
                 children: [
                   Expanded(child: Container(
                     height: 10,
                   )),
                   Padding(
                     padding: const EdgeInsets.all(8.0),
                     child: Web(list),
                   ),
                   const Padding(
                     padding: EdgeInsets.all(8.0),
                     child: InkWell(
                       child: Text("Login"),
                     ),
                   ),
                   IconButton(onPressed: (){
                     setState(() {
                       isVisible = !isVisible;
                     });
                   }, icon: const Icon(Icons.search))
                 ],
               ),
               Visibility(visible: isVisible,child: Container(child: Center(child: TextFormField(),),))
             ],
           );
        }
        else{
          return Row(
            children: [
              Expanded(child: Container(
                height: 10,
              )),
              IconButton(onPressed: (){
               showDialog(context: context, builder: (context){
                 return Container(
                   width: size.width/2,
                   height: size.height,
                   color: Colors.white,
                   child: Phone(list),

                 );
               });
              }, icon: const Icon(Icons.menu))
            ],
          );
        }
      },

      ),
    );
  }
}


class Web extends StatefulWidget {
  final List<String> list;
  const Web(this.list,{Key? key}) : super(key: key);

  @override
  State<Web> createState() => _WebState();
}

class _WebState extends State<Web> {
  @override
  Widget build(BuildContext context) {
    return Wrap(
      children: widget.list.map((e) =>  Padding(
        padding: const EdgeInsets.all(8.0),
        child: WindowStyleDropdownMenu(
          buttonTitleStyle: const TextStyle(color: Colors.black),
          dropdownWidth: 300,
          buttonTitle: e,
          dropdownItems: widget.list.map((e1) =>   ListTile(
            mouseCursor: SystemMouseCursors.click,
            trailing: const Text('Ctrl + O',
                style: TextStyle(color: Colors.white)),
            title: Text(
              e1,
              style: const TextStyle(color: Colors.white),
            ),
          ),).toList(),
        ),
      ),).toList(),
    );
  }
}


class Phone extends StatefulWidget {
  final List<String> list;
  const Phone(this.list,{Key? key}) : super(key: key);

  @override
  State<Phone> createState() => _PhoneState();
}

class _PhoneState extends State<Phone> {
  bool isVisible = false;
  @override
  Widget build(BuildContext context) {
    return Material(
      child: Column(
        children: [
          ...widget.list.map((e) =>  Text(e),).toList(),
          const Padding(
            padding: EdgeInsets.all(8.0),
            child: InkWell(
              child: Text("Login"),
            ),
          ),
          IconButton(onPressed: (){
            setState(() {
              isVisible = !isVisible;
            });
          }, icon: const Icon(Icons.search)),
          Visibility(visible: isVisible,child: Container(child: Center(child: TextFormField(),),))
        ]
      ),
    );
  }
}
