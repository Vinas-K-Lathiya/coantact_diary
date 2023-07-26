import 'package:coantact_diary/Model/contact_model.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class homepage extends StatefulWidget {
  homepage({Key? key}) : super(key: key);

  @override
  State<homepage> createState() => _homepageState();
}

class _homepageState extends State<homepage> {
  @override
  Widget build(BuildContext context) {
    Contact vinas = ModalRoute.of(context)!.settings.arguments as Contact;
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.orange,
        title: Text("hii"),
        centerTitle: true,
        actions: [
          Row(
            children: [
              Padding(
                padding: EdgeInsets.all(18.0),
                child: Icon(Icons.edit),
              ),
              Padding(
                padding: const EdgeInsets.all(18.0),
                child: Icon(Icons.star),
              )
            ],
          )
        ],
      ),
      body: Column(
        children: [
          Container(
            height: MediaQuery.of(context).size.height / 3,
            width: MediaQuery.of(context).size.width / 1,
            color: Colors.orange,
            child: Align(
                alignment: Alignment.bottomCenter,
                child: Padding(
                  padding: EdgeInsets.only(bottom: 48.0),
                  child: Text(
                    "${vinas.Firstname}",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 25,
                        fontWeight: FontWeight.bold),
                  ),
                )),
          ),
          GestureDetector(
            onTap: () async {
              launchUrl(Uri(
                scheme: 'tel',
                path: "+91 ${vinas.MobileNumber}",
              ));
            },
            child: Container(
              height: 80,
              child: Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(18.0),
                    child: Icon(Icons.call),
                  ),
                  Padding(
                    padding: EdgeInsets.all(18.0),
                    child: Text(
                      "+91 ${vinas.MobileNumber}",
                      style: TextStyle(fontSize: 20),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 100.0),
                    child: Icon(Icons.videocam),
                  )
                ],
              ),
            ),
          ),
          Divider(),
        ],
      ),
    );
  }
}
