import 'package:flutter/material.dart';
import 'package:flutter_task/view/home_screen/home_screen.dart';
import 'package:flutter_task/view/registartion_screen/registration_screen.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key, this.myemail, this.mypass});
  final String? myemail, mypass;

  @override
  Widget build(BuildContext context) {
    GlobalKey<FormState> formkey = GlobalKey<FormState>();
    TextEditingController emailkey = TextEditingController();
    TextEditingController passkey = TextEditingController();

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
                    'sign in to your account',
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
                            if (emailkey.text == myemail &&
                                passkey.text == mypass) {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => HomeScreen()));
                            } else {
                              ScaffoldMessenger.of(context).showSnackBar(
                                  SnackBar(
                                      backgroundColor: Colors.red,
                                      content: Text(
                                          'email or password was incorrect')));
                            }
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
                    Text('Dont have an account?'),
                    InkWell(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => RegistrationScreen(),
                            ));
                      },
                      child: Text(
                        'sign up',
                        style: TextStyle(color: Colors.blue),
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
