import 'package:coantact_diary/Providers/contact_provider.dart';
import 'package:flutter/material.dart';

class hiddencontact extends StatefulWidget {
  hiddencontact({Key? key}) : super(key: key);

  @override
  State<hiddencontact> createState() => _hiddencontactState();
}

class _hiddencontactState extends State<hiddencontact> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: ListView.builder(
        itemCount: Contactprovider.hiddencontact.length,
        itemBuilder: (BuildContext context, int index) {
          return ListTile(
            title: Text(
                  "${Contactprovider.hiddencontact[index].Firstname}",
                  style: TextStyle(
                      color: const Color.fromARGB(255, 23, 18, 18)),
                ),
                subtitle: Text(
                    "${Contactprovider.hiddencontact[index].MobileNumber}"),
          );
        },
      ),
    );
  }
}
