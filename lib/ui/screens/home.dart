
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  initState() {
    super.initState();
  }

 

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async => false,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Color(0xFFE0F1DC),
          iconTheme: IconThemeData(color: Colors.black),
          elevation: 0,
          title: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  IconButton(
                    onPressed: () {},
                    icon: const Icon(Icons.search, size: 32.0),
                  ),
                ],
              ),
            ],
          ),
          titleSpacing: 0.0,
          automaticallyImplyLeading: false,
        ),
        body: SafeArea(
          child: Container(
            child: SingleChildScrollView(
              child: Column(
                children: [],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
