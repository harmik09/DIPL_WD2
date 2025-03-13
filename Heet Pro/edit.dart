import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'database.dart';
import 'listpage.dart';

class Edit extends StatefulWidget {
  Map<String,dynamic> junoData;
  Edit({super.key , required this.junoData});

  @override
  State<Edit> createState() => _AddState();
}

class _AddState extends State<Edit> {
  GlobalKey<FormState> keeey = GlobalKey();
  TextEditingController name = TextEditingController();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    name.text = widget.junoData["Name"];

    setState(() {

    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text("Edit Page",style: TextStyle(color: Colors.green),),backgroundColor: Colors.black,),
        body: SafeArea(
          child: Form(
              key: keeey,
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextFormField(
                      controller: name,
                      decoration: InputDecoration(
                          labelText: "Name",
                          prefixIcon: const Icon(Icons.person),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(7),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide: const BorderSide(color: Colors.green),
                            borderRadius: BorderRadius.circular(7),
                          )),
                    ),
                  ),
                  ElevatedButton(onPressed: () {
                    if(keeey.currentState!.validate()){
                          Map<String,dynamic> navoData = {
                            "Name" : name.text,
                            "Id" : widget.junoData["Id"]
                          };
          
                          MyyDatabase().editUserThayoFun(navoData, widget.junoData["Id"]);
                          Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => Listpage(),));
                    }
                  }, child: Text("Edit"))
                ],
              )),
        ));
  }
}
