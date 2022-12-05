import 'package:flutter/material.dart';
import 'CallDirectory.dart';

class CallDirectory extends StatefulWidget {
  const CallDirectory({super.key});

  @override
  State<CallDirectory> createState() => _CallDirectoryState();
}

class _CallDirectoryState extends State<CallDirectory> {
  TextEditingController nameController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  List phoneDetails = [];
  static List<String> codes = ["+977", "+91", "+01", "+111"];
  String selectedCode = codes.first;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Call Directory"),
        centerTitle: true,
      ),
      body: Container(
        child: SingleChildScrollView(
          child: Container(
            height: 670,
            width: double.infinity,
            child: Column(
              children: [
                Container(
                  height: 350,
                  //width: 150,
                  child: ListView(
                    children: phoneDetails.asMap().entries.map((val) {
                      return ListTile(
                        leading: Icon(Icons.person),
                        title: Text(val.value["name"]),
                        subtitle: Text(
                            "${val.value["countryCode"]}-${val.value["phone"]}"),
                        trailing: IconButton(
                          onPressed: () {
                            //call
                          },
                          icon: Icon(
                            Icons.phone,
                            color: Colors.grey,
                          ),
                        ),
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
                              labelText: "Name",
                              prefixIcon: Icon(Icons.person)),
                        ),
                        SizedBox(
                          height: 30,
                        ),
                        Column(
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
                              },
                            )),
                            Container(
                              // height: ,
                              width: 300,
                              child: TextFormField(
                                controller: phoneController,
                                keyboardType: TextInputType.phone,
                                decoration: InputDecoration(
                                    labelText: "phone",
                                    prefixIcon: Icon(Icons.phone)),
                              ),
                            ),
                            ElevatedButton.icon(
                                onPressed: () {
                                  Map<String, dynamic> newData = {
                                    "name": nameController.text,
                                    "phone": phoneController.text,
                                    "countryCode": selectedCode,
                                  };
                                  setState(() {
                                    phoneDetails.add(newData);
                                  });
                                  nameController.clear();
                                  phoneController.clear();
                                  selectedCode = codes.first;
                                },
                                icon: Icon(Icons.save),
                                label: Text("Save")),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
