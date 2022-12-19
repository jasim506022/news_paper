import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:newsappapi/api_service.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  ApiService client = ApiService();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text(
          "News App",
          style: TextStyle(color: Colors.black),
        ),
      ),
      body: FutureBuilder(
        future: client.getArticle(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return Text("Sucessfully");
          }
          return Center(
            child: Text(
              "Hello Bangladesh",
              style: TextStyle(color: Colors.black, fontSize: 20),
            ),
          );
        },
      ),
    );
  }
}
