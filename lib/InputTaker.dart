import 'package:flutter/material.dart';
import 'package:first_project/InputTaker.dart';

class InputTaker extends StatefulWidget {
  const InputTaker({super.key});

  @override
  State<InputTaker> createState() => _InputTakerState();
}

enum Gender { Male, Female, Others }

class _InputTakerState extends State<InputTaker> {
  TextEditingController usernameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController PasswordController = TextEditingController();
  bool obsecureText = true;
  Gender SelectedGender = Gender.Female;
  bool acceptTermAndCondition = false;
  static List<String> country = ["Nepal", "India", "Australia", "Pakistan"];
  String selectedCountry = country.first;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Input Form"),
        centerTitle: true,
      ),
      body: Container(
        padding: EdgeInsets.only(left: 10),
        width: 300,
        child: Column(
          children: [
            TextFormField(
                controller: usernameController,
                keyboardType: TextInputType.text,
                decoration: InputDecoration(
                  prefixIcon: Icon(Icons.person),
                  labelText: "UserName",
                  hintText: "",
                  // hintStyle: TextStyle(fontFamily: "Cardo"),
                  helperText: "Free",
                )),
            TextFormField(
                controller: emailController,
                keyboardType: TextInputType.emailAddress,
                decoration: InputDecoration(
                  prefixIcon: Icon(Icons.email),
                  labelText: "Email",
                  hintText: "",
                  // hintStyle: TextStyle(fontFamily: "Cardo"),
                  helperText: "valid email address",
                )),
            TextFormField(
                controller: phoneController,
                keyboardType: TextInputType.phone,
                decoration: InputDecoration(
                  prefixIcon: Icon(Icons.phone),
                  labelText: "Phone No.",
                  hintText: "",
                  // hintStyle: TextStyle(fontFamily: "Cardo"),
                  helperText: "mini 9 digit ",
                )),
            Container(
              child: Row(
                children: [
                  Radio<Gender>(
                      splashRadius: 10,
                      value: Gender.Others,
                      groupValue: SelectedGender,
                      onChanged: (Gender? val) {
                        setState(() {
                          SelectedGender = val!;
                        });
                      }),
                  Text("Others")
                ],
              ),
            ),
            Row(
              children: [
                Radio<Gender>(
                    splashRadius: 10,
                    value: Gender.Male,
                    groupValue: SelectedGender,
                    onChanged: (Gender? val) {
                      setState(() {
                        SelectedGender = val!;
                      });
                    }),
                Text("Male")
              ],
            ),
            Row(
              children: [
                Radio<Gender>(
                    splashRadius: 10,
                    value: Gender.Female,
                    groupValue: SelectedGender,
                    onChanged: (Gender? val) {
                      setState(() {
                        SelectedGender = val!;
                      });
                    }),
                Text("Female")
              ],
            ),
            // DropdownButtonHideUnderline(child: DropdownButton(
            //value: selectedCountry,
            // items: [country.map<DropdownMenuItem<String>>((String selected)){}],
            // )),
            TextFormField(
                controller: PasswordController,
                keyboardType: TextInputType.visiblePassword,
                obscuringCharacter: "*",
                obscureText: obsecureText,
                decoration: InputDecoration(
                  prefixIcon: Icon(Icons.lock),
                  suffixIcon: IconButton(
                      onPressed: () {
                        setState(() {
                          obsecureText = !obsecureText;
                        });
                      },
                      icon: Icon(
                        obsecureText
                            ? Icons.remove_red_eye
                            : Icons.elderly_outlined,
                      )),
                  labelText: "Password",
                  hintText: "",
                  // hintStyle: TextStyle(fontFamily: "Cardo"),
                  helperText: "maximum 8 character long",
                )),
            Row(
              children: [
                Checkbox(
                    value: acceptTermAndCondition,
                    onChanged: (bool? val) {
                      setState(() {
                        acceptTermAndCondition = val!;
                      });
                    }),
                Text("Accept Term And Condition"),
              ],
            ),
            SizedBox(
              height: 20,
            ),
            ElevatedButton.icon(
                onPressed: () {},
                icon: Icon(Icons.login),
                label: Text("Submit"))
          ],
        ),
      ),
    );
  }
}
