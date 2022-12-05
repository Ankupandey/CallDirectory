import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class PhoneDirectory extends StatefulWidget {
  const PhoneDirectory({super.key});

  @override
  State<PhoneDirectory> createState() => _PhoneDirectoryState();
}

class _PhoneDirectoryState extends State<PhoneDirectory> {
  Future<void> _makePhoneCall(String phoneNumber) async {
    final Uri launchUri = Uri(
      scheme: 'tel',
      path: phoneNumber,
    );
    await launchUrl(launchUri);
  }

  TextEditingController nameController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  List phoneDetails = [];
  static List<String> codes = [
    "+977",
    "+61",
    "+91",
    "+111",
    "+88",
  ];
  String selectedCode = codes.first;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Phone Directory"),
      ),
      body: Container(
        child: SingleChildScrollView(
          child: Container(
            height: 670,
            width: double.infinity,
            child: Column(
              children: [
                Container(
                  height: 450,
                  child: ListView(
                    children: phoneDetails.asMap().entries.map((val) {
                      return ListTile(
                        leading: Icon(Icons.person),
                        title: Text(val.value["name"]),
                        subtitle: Text(
                            "${val.value["countryCode"]}-${val.value["phone"]}"),
                        trailing: IconButton(
                            onPressed: () {
                              _makePhoneCall(val.value["phone"].toString());
                            },
                            icon: Icon(
                              Icons.phone,
                              color: Colors.green,
                            )),
                      );
                    }).toList(),
                  ),
                ),
                Expanded(
                    child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 30),
                  child: Column(
                    children: [
                      TextFormField(
                        controller: nameController,
                        keyboardType: TextInputType.text,
                        decoration: InputDecoration(
                            labelText: "Name", prefixIcon: Icon(Icons.person)),
                      ),
                      SizedBox(
                        height: 30,
                      ),
                      Row(
                        children: [
                          DropdownButtonHideUnderline(
                              child: DropdownButton(
                                  value: selectedCode,
                                  items: codes.map<DropdownMenuItem<String>>(
                                      (String value) {
                                    return DropdownMenuItem(
                                        child: Text(value), value: value);
                                  }).toList(),
                                  onChanged: (select) {
                                    setState(() {
                                      selectedCode = select.toString();
                                    });
                                  })),
                          Container(
                            //height :20,
                            width: 200,
                            child: TextFormField(
                              controller: phoneController,
                              keyboardType: TextInputType.phone,
                              decoration: InputDecoration(
                                  labelText: "Phone",
                                  prefix: Icon(Icons.phone)),
                            ),
                          ),
                        ],
                      ),
                      ElevatedButton.icon(
                          onPressed: () {
                            print(phoneController.text);
                            Map<String, dynamic> newData = {
                              "name": nameController.text,
                              "phone": phoneController.text,
                              "countryCode": selectedCode
                            };
                            setState(() {
                              phoneDetails.add(newData);
                            });
                            nameController.clear();
                            phoneController.clear();
                            selectedCode = codes.first;
                          },
                          icon: Icon(Icons.save),
                          label: Text("Save"))
                    ],
                  ),
                ))
              ],
            ),
          ),
        ),
      ),
    );
  }
}
