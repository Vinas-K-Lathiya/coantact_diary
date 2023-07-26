import 'dart:io';

import 'package:coantact_diary/Model/contact_model.dart';
import 'package:coantact_diary/Providers/contact_provider.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';

import '../utils/global.dart';

class add_contact extends StatefulWidget {
  add_contact({Key? key}) : super(key: key);

  @override
  State<add_contact> createState() => _add_contactState();
}

class _add_contactState extends State<add_contact> {
  int initialindex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          GestureDetector(
              onTap: () {
                Provider.of<Contactprovider>(context, listen: false)
                    .add_contact(Contact(
                  Firstname: Global.namecontroller.text,
                  Lastname: Global.lastnamecontroller.text,
                  MobileNumber: Global.mobilenumbercontroller.text,
                  Email: Global.emailcontroller.text,
                ),
                );
                Navigator.pushNamed(context, "home");
              },
              child: Icon(Icons.check))
        ],
      ),
      body: Stepper(
          onStepCancel: () {
            if (initialindex != 0) {
              setState(() {
                initialindex--;
              });
            }
          },
          onStepContinue: () {
            if (initialindex != 3) {
              setState(() {
                initialindex++;
              });
            }
          },
          currentStep: initialindex,
          steps: [
            Step(
              isActive: (initialindex == 0) ? true : false,
              title: Text('Your photo'),
              subtitle: Text('add your photo'),
              content: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  if (Global.pic == null)
                    CircleAvatar(
                      radius: 85,
                      child: Text("No Image"),
                    )
                  else
                    CircleAvatar(
                      radius: 85,
                      foregroundImage: FileImage(File(Global.pic!.path)),
                    ),
                  SizedBox(height: 10),
                  Center(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        ElevatedButton(
                          onPressed: () async {
                            final XFile? image = await Global.picker
                                .pickImage(source: ImageSource.camera);
                            setState(() {
                              Global.pic = image;
                            });
                          },
                          child: Icon(Icons.camera_alt_rounded),
                        ),
                        SizedBox(height: 10),
                        ElevatedButton(
                          onPressed: () async {
                            final XFile? image = await Global.picker
                                .pickImage(source: ImageSource.gallery);
                            setState(() {
                              Global.pic = image;
                            });
                          },
                          child: Icon(Icons.photo_camera_back_rounded),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
            Step(
                isActive: (initialindex == 1) ? true : false,
                title: Text('Your name'),
                subtitle: Text('add your name'),
                content: Column(
                  children: [
                    TextFormField(
                      onSaved: (val1) {
                        Global.name = val1;
                      },
                      controller: Global.namecontroller,
                      decoration: InputDecoration(
                          hintText: "enter your name",
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10))),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    TextFormField(
                      controller: Global.lastnamecontroller,
                      decoration: InputDecoration(
                          hintText: "enter your Last name",
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10))),
                      onSaved: (val2) {
                        Global.lastname = val2;
                      },
                    ),
                  ],
                )),
            Step(
              isActive: (initialindex == 2) ? true : false,
              title: Text('Mobile number'),
              subtitle: Text('enter your mobile number'),
              content: TextFormField(
                maxLength: 10,
                onSaved: (val3) {
                  Global.mobilenumber = val3;
                },
                keyboardType: TextInputType.number,
                controller: Global.mobilenumbercontroller,
                decoration: InputDecoration(
                    hintText: "enter your Mobiler Number",
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10))),
              ),
            ),
            Step(
              isActive: (initialindex == 3) ? true : false,
              title: Text('Your email'),
              subtitle: Text('enter your email'),
              content: TextFormField(
                onSaved: (val) {
                  Global.email = val;
                },
                controller: Global.emailcontroller,
                decoration: InputDecoration(
                    hintText: "enter your email",
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10))),
              ),
            ),
          ]),
    );
  }
}
