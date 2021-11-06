import 'dart:html';

import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  HomePage({Key? key}) : super(key: key);
  bool valuesecond = false;

  Padding titleSection(String text) {
    return Padding(
      padding: EdgeInsets.fromLTRB(15, 40, 20, 10),
      child: Text(
        text,
        style: TextStyle(
          color: Colors.grey[500],
          // backgroundColor: Colors.blueGrey[50],
        ),
      ),
    );
  }

  Padding itemMail(String name, String quantity) {
    return Padding(
      padding: EdgeInsets.fromLTRB(10, 10, 0, 0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Icon(
                    Icons.mail_outline,
                    color: Colors.green[120],
                    size: 25.0,
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 5),
                    child: Text(name),
                  )
                ],
              ),
              Padding(
                padding: EdgeInsets.only(right: 20),
                child: Text(quantity),
              )
            ],
          ),
          Container(
            height: 1,
            color: Colors.black12,
          )
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    Widget navSection = Padding(
      padding: EdgeInsets.all(10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Padding(
            padding: EdgeInsets.only(left: 200),
            child: const Text(
              'Mailboxes',
              style: TextStyle(
                fontWeight: FontWeight.w600,
                color: Colors.black,
              ),
            ),
          ),
          const Text(
            'Done',
            style: TextStyle(
              fontWeight: FontWeight.w600,
              color: Colors.blue,
            ),
          ),
        ],
      ),
    );

    Widget listItemMailboxesSection = Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        itemMail('All inboxes', '1'),
        itemMail('Icloud', '2'),
        itemMail('Gmail', '3'),
        itemMail('Hostmail', '4'),
        itemMail('VIP', '5'),
      ],
    );
    Widget listItemSpecicalSection = Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        itemMail('Secure', '1'),
        itemMail('Notications', '2'),
      ],
    );
    Widget footerSection = Expanded(
      child: Align(
        alignment: FractionalOffset.bottomCenter,
        child: Padding(
          padding: EdgeInsets.fromLTRB(0, 20, 0, 25),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Container(
                height: 2,
                color: Colors.blue,
              ),
              Padding(
                padding: EdgeInsets.only(top: 10),
                child: Text(
                  'Delete',
                  style: TextStyle(fontSize: 15),
                ),
              )
            ],
          ),
        ),
      ),
    );

    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          navSection,
          titleSection('Mailboxes'),
          listItemMailboxesSection,
          titleSection('Specical folders'),
          listItemSpecicalSection,
          footerSection,
        ],
      )),
    );
  }
}
