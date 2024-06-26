import 'package:flutter/material.dart';

import 'package:flutter_task/view/login_screen/login_screen.dart';

class RegistrationScreen extends StatelessWidget {
  const RegistrationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    TextEditingController emailkey = TextEditingController();
    TextEditingController passkey1 = TextEditingController();
    TextEditingController passkey = TextEditingController();
    GlobalKey<FormState> formkey = GlobalKey<FormState>();

    return Scaffold(
      appBar: AppBar(
        leading: Icon(Icons.arrow_back),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
          child: Form(
            key: formkey,
            child: Column(
              children: [
                Center(
                  child: Text(
                    'sign up for free',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                TextFormField(
                  controller: emailkey,
                  decoration: InputDecoration(
                      label: Text('your email address'),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10))),
                  validator: (value) {
                    if (value != null && value.contains('@')) {
                      return null;
                    } else
                      return 'please enter a proper email';
                  },
                ),
                SizedBox(
                  height: 20,
                ),
                TextFormField(
                  controller: passkey,
                  decoration: InputDecoration(
                      suffixIcon: Icon(Icons.visibility_off),
                      label: Text('your password'),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10))),
                  validator: (value) {
                    if (value != null && value.length >= 8) {
                      return null;
                    } else
                      return 'at least 8 digits needed ';
                  },
                ),
                SizedBox(
                  height: 20,
                ),
                TextFormField(
                  controller: passkey1,
                  decoration: InputDecoration(
                      suffixIcon: Icon(Icons.visibility_off),
                      label: Text('your conform  password'),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10))),
                  validator: (value) {
                    if (passkey.text == passkey1.text) {
                      return null;
                    } else
                      return 'your password dosent match ';
                  },
                ),
                SizedBox(
                  height: 10,
                ),
                Row(
                  children: [
                    Icon(Icons.check_box_outlined),
                    SizedBox(
                      width: 5,
                    ),
                    Text(
                      'Remember me',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    Spacer(),
                    Text(
                      'forgot password',
                      style: TextStyle(color: Colors.blue),
                    ),
                  ],
                ),
                SizedBox(
                  height: 10,
                ),
                SizedBox(
                    width: double.infinity,
                    height: 50,
                    child: ElevatedButton(
                        style: ButtonStyle(
                            shape: WidgetStatePropertyAll(
                                RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10))),
                            backgroundColor:
                                WidgetStatePropertyAll(Colors.blue)),
                        onPressed: () {
                          if (formkey.currentState!.validate()) {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => LoginScreen(
                                    myemail: emailkey.text,
                                    mypass: passkey.text,
                                  ),
                                ));
                          } else {
                            ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                                backgroundColor: Colors.red,
                                content: Text('invalid details')));
                          }
                        },
                        child: Text(
                          'sign in',
                          style: TextStyle(color: Colors.white),
                        ))),
                Spacer(),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Text('Already have an ccount?'),
                    InkWell(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => RegistrationScreen(),
                            ));
                      },
                      child: InkWell(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => LoginScreen(),
                              ));
                        },
                        child: Text(
                          'sign in',
                          style: TextStyle(color: Colors.blue),
                        ),
                      ),
                    )
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
