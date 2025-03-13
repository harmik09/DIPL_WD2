import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'database.dart';
import 'listpage.dart';

class Add extends StatefulWidget {
  const Add({super.key});

  @override
  State<Add> createState() => _AddState();
}

class _AddState extends State<Add> {
  GlobalKey<FormState> keeey = GlobalKey();
  TextEditingController name = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text("Add Page",style: TextStyle(color: Colors.green),),backgroundColor: Colors.black,),
        body: SafeArea(
      child: Form(
          key: keeey,
          child: Column(
            children: [
              SizedBox(
                height: 20,
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextFormField(
                  // decoration: InputDecoration(prefixIcon:Icon(Icons.person),border: OutlineInputBorder(borderRadius: BorderRadius.circular(5),)),
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

                  controller: name,
                ),
              ),
              ElevatedButton(
                  onPressed: () {
                    if (keeey.currentState!.validate()) {
                      Map<String, dynamic> AddPageNoMap = {"Name": name.text};

                      MyyDatabase().addUserThayoFun(AddPageNoMap);
                      Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                            builder: (context) => Listpage(),
                          ));
                    }
                  },
                  child: Text("submit"))
            ],
          )),
    ));
  }
}
