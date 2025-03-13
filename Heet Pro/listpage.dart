import 'package:flutter/material.dart';
import 'edit.dart';

import 'add.dart';
import 'database.dart';

class Listpage extends StatefulWidget {
  const Listpage({super.key});

  @override
  State<Listpage> createState() => _ListpageState();
}

class _ListpageState extends State<Listpage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("List Page",style: TextStyle(color: Colors.green),),backgroundColor: Colors.black,),
      body: SafeArea(
        child: Column(
          mainAxisSize: MainAxisSize.max,
          children: [
            SizedBox(height: 25),
            ElevatedButton(
                onPressed: () {
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                      builder: (context) => Add(),
                    ),
                  );
                },
                child: Text("ADD")),
            SizedBox(height: 20),
            Expanded(
              child: FutureBuilder(
                future: MyyDatabase().getAllUserFun(),
                builder: (kadio, chokidar) {
                  if (chokidar.connectionState == ConnectionState.waiting) {
                    return Center(child: CircularProgressIndicator());
                  } else if (chokidar.hasData) {
                    return ListView.builder(
                      // shrinkWrap: true,
                      itemCount: chokidar.data!.length,
                      itemBuilder: (kadio, index) {
                        return Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Card(
                            elevation: 11,
                            child: ListTile(
                              title: Text(
                                  chokidar.data![index]["Name"].toString()),
                              trailing: SizedBox(
                                width: 100,
                                child: Row(
                                  children: [
                                    IconButton(
                                        onPressed: () {
                                          Navigator.pushReplacement(
                                              context,
                                              MaterialPageRoute(
                                                builder: (context) => Edit(
                                                    junoData:
                                                        chokidar.data![index]
                                                            as Map<String,
                                                                dynamic>),
                                              ));
                                        },
                                        icon: Icon(Icons.edit)),
                                    IconButton(
                                        onPressed: () {
                                          MyyDatabase().deleteUser(
                                              chokidar.data![index]["Id"]);
                                          setState(() {});
                                        },
                                        icon: Icon(Icons.delete))
                                  ],
                                ),
                              ),
                            ),
                          ),
                        );
                      },
                    );
                  } else {
                    return Center(child: Text("Nathi Malio Data...:("));
                  }
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
