import 'package:coantact_diary/Providers/contact_provider.dart';
import 'package:coantact_diary/Providers/counter_provider.dart';
import 'package:flutter/material.dart';
import 'package:local_auth/local_auth.dart';
import 'package:provider/provider.dart';


class Home extends StatefulWidget {
  Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('hiiiii'),
          actions: [
            PopupMenuButton(
              onSelected: (value) async {
                if (value == 'hidden') {
                  LocalAuthentication auth = LocalAuthentication();
                  bool checkBiometrics = await auth.canCheckBiometrics;
                  bool isDeviceSupported = await auth.isDeviceSupported();
                  try {
                    if (checkBiometrics == true && isDeviceSupported == true) {
                      bool authenticate =
                          await auth.authenticate(localizedReason: "e kya");
                      if (authenticate == true) {
                        Navigator.pushNamed(context, 'hiddencontact');
                      } else {
                        print("ok");
                      }
                    } else {
                      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                        content: Text("navo phone le"),
                      ));
                    }
                  } catch (e) {
                    print("$e");
                  }
                }
              },
              itemBuilder: (BuildContext context) => [
                PopupMenuItem(value: 'hidden', child: Text("hiddencontact")),
                PopupMenuItem(value: 'setting', child: Text('setting'))
              ],
            )
          ],
        ),
        floatingActionButton: Theme(
            data: ThemeData(useMaterial3: true, colorSchemeSeed: Colors.purple),
            child: Consumer<Counterprovider>(
                builder: (context, counterprovider, _) => FloatingActionButton(
                      onPressed: () {
                        Navigator.pushNamed(context, 'add_contact');
                      },
                      child: Icon(Icons.add),
                    ))),
        body: (Contactprovider.allcontact.isNotEmpty)
            ? ListView.builder(
                itemCount: Contactprovider.allcontact.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    onTap: () {
                      Navigator.pushNamed(context, 'homepage',
                          arguments: Contactprovider.allcontact[index]);
                    },
                    title: Text(
                      "${Contactprovider.allcontact[index].Firstname}",
                      style: TextStyle(
                          color: const Color.fromARGB(255, 23, 18, 18)),
                    ),
                    trailing: GestureDetector(
                      onTap: () {
                        Navigator.pushNamed(context, 'hiddencontact',
                            arguments: Contactprovider.allcontact[index]);
                        Contactprovider.hiddencontact
                            .add(Contactprovider.allcontact[index]);
                        setState(() {
                          Contactprovider.allcontact.removeAt(index);
                        });
                      },
                      child: Icon(Icons.more_vert_rounded),
                    ),
                    subtitle: Text(
                        "${Contactprovider.allcontact[index].MobileNumber}"),
                  );
                })
            : Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("NO contact add"),
                  ],
                ),
              ));
  }
}
