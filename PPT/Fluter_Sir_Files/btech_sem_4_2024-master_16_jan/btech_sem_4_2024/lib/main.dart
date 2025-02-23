import 'package:btech_sem_4_2024/design/list/user_list_page.dart';
import 'package:btech_sem_4_2024/design/page_view/flutter_page_view.dart';
import 'package:btech_sem_4_2024/design/tab_bar/drawer_page.dart';
import 'package:btech_sem_4_2024/design/tab_bar/flutter_tab_bar.dart';
import 'package:btech_sem_4_2024/design/tab_bar/tab_detail_view.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        // useMaterial3: true,
      ),
      home: UserListPage(),
    );
  }
}
