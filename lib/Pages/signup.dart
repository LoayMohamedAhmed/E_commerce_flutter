
import 'package:ecommerce/Pages/Initial_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'login.dart';

class SignUp extends StatefulWidget {
  const SignUp({super.key});

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  final GlobalKey<FormState> _globalKey = GlobalKey<FormState>();
  String? _email, _password, _confirmPass, _name, _phone;

  // Person_info person=Person_info("Loay Mohamed", "01121510042", "looay432@gmail.com","2001369105694");
  // // late Person_info person;
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPpasswordController = TextEditingController();


  @override
  Widget build(BuildContext context) {
    final currentWidth = MediaQuery.of(context).size.width;
    final currentHeight = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: Colors.white,
      body: Form(
        key: _globalKey,
        child: SafeArea(
          child: SingleChildScrollView(
            child: Padding(
              padding:  EdgeInsets.all(currentWidth*0.1),
              child: Column(
                children: [
                  Container(
                    height: currentWidth,
                    child: Image.asset("Assets/Images/sign up.jpg"),
                  ),
                  Text(
                    'Create new account',
                    style: TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF7EAA92),
                    ),
                    textAlign: TextAlign.center,
                  ),
                  Text(
                    'please fill the form to continue...',
                    style: TextStyle(
                      color: Colors.grey,
                    ),
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  TextFormField(
                    keyboardType: TextInputType.name,
                    decoration: InputDecoration(
                      prefixIcon: Icon(
                        Icons.person,
                        color: Color(0xFF7EAA92),
                      ),

                      labelText: "Full Name",
                      labelStyle:const TextStyle(
                        fontFamily: "Sweety",
                        color: Colors.black54,
                        fontSize: 20.0,
                      ),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.0),
                        borderSide: const BorderSide(
                          color: Colors.white,
                        ),
                      ),
                    ),
                    onSaved: (value) {
                      _name = value!;
                    },
                    controller: _nameController,
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  TextFormField(
                    decoration: InputDecoration(
                      prefixIcon: const Icon(
                        Icons.phone,
                        color: Color(0xFF7EAA92),
                      ),
                      labelText: "Phone number",
                      labelStyle: const TextStyle(
                        fontFamily: "Sweety",
                        color: Colors.black54,
                        fontSize: 20.0,
                      ),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.0),
                        borderSide: BorderSide(
                          color: Colors.white,
                        ),
                      ),
                    ),
                    keyboardType: TextInputType.phone,
                    onSaved: (value) {
                      _phone = value!;
                    }, controller: _phoneController,
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  TextFormField(
                    decoration: InputDecoration(
                      prefixIcon: const Icon(
                        Icons.email,
                        color: Color(0xFF7EAA92),
                      ),

                      labelText: "Email",
                      labelStyle: const TextStyle(
                        fontFamily: "Sweety",
                        color: Colors.black54,
                        fontSize: 20.0,
                      ),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.0),
                        borderSide: const BorderSide(
                          color: Colors.white,
                        ),
                      ),
                    ),

                    keyboardType: TextInputType.emailAddress,
                    onSaved: (value) {
                      _email = value!;
                    }, controller: _emailController,
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  TextFormField(
                    decoration: InputDecoration(
                      prefixIcon: const Icon(
                        Icons.lock,
                        color: Color(0xFF7EAA92),
                      ),
                      labelText: "Password",
                      labelStyle: const TextStyle(
                        fontFamily: "Sweety",
                        color: Colors.black54,
                        fontSize: 25.0,
                      ),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.0),
                        borderSide:const BorderSide(
                          color: Colors.white,
                        ),
                      ),
                    ),
                    obscureText: true,
                    onSaved: (value) {
                      _password = value!;
                    },
                    controller: _passwordController,
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  TextFormField(
                    decoration: InputDecoration(
                      prefixIcon: const Icon(
                        Icons.lock,
                        color: Color(0xFF7EAA92),
                      ),
                      labelText: "confirm password",
                      labelStyle: const TextStyle(
                        fontFamily: "Sweety",
                        color: Colors.black54,
                        fontSize: 20.0,
                      ),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.0),
                        borderSide:const BorderSide(
                          color: Colors.white,
                        ),
                      ),
                    ),
                    obscureText: true,
                    onSaved: (value) {
                      _confirmPass = value!;
                    }, controller: _confirmPpasswordController,
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  Container(
                    width: currentWidth * 0.6,
                    height: currentHeight * 0.13,
                    child: Builder(builder: (context) {
                      return ElevatedButton(
                        onPressed: () async {
                          Navigator.push(context, MaterialPageRoute(builder: (context)=>home()));
                          // if (_globalKey.currentState!.validate()) {
                          //   if (_password == _confirmPass) {
                          //     print("on buttun");
                          //     try {
                          //       _globalKey.currentState!.save();
                          //
                          //       final authResult =
                          //       await _auth.SignUp(_email!, _password!);
                          //       Fluttertoast.showToast(
                          //           msg: "Registered Successfully",
                          //           toastLength: Toast.LENGTH_SHORT,
                          //           gravity: ToastGravity.TOP,
                          //           timeInSecForIosWeb: 1,
                          //           backgroundColor: KMainColor,
                          //           textColor: Colors.white,
                          //           fontSize: 16.0);
                          //       _signUp(context);
                          //       // _store.addUser(Users(
                          //       //     name: _name,
                          //       //     phone: _phone,
                          //       //     email: _email,
                          //       //     password: _password));
                          //       // Navigator.of(context).push(MaterialPageRoute(builder: (context) => Profile(userId: userId)));
                          //     } catch (e) {
                          //       ScaffoldMessenger.of(context).showSnackBar(
                          //         SnackBar(
                          //           backgroundColor: KMainColor,
                          //           shape: RoundedRectangleBorder(
                          //             borderRadius: BorderRadius.only(
                          //                 topLeft: Radius.circular(20),
                          //                 topRight: Radius.circular(20)),
                          //           ),
                          //           content: Text(
                          //             e.toString(),
                          //           ),
                          //         ),
                          //       );
                          //     }
                          //   } else {
                          //     print('error');
                          //   }
                          //   // print(_email);
                          //   // print(_password);
                          //   // print(_confirmPass);
                          // }
                        },
                        child: Text(
                          'Register',
                          style: TextStyle(
                            fontSize: 20,
                          ),
                        ),
                        style: ButtonStyle(
                            backgroundColor:
                            MaterialStatePropertyAll<Color>(Color(0xFF7EAA92)),
                            shape: MaterialStateProperty.all<
                                RoundedRectangleBorder>(
                                RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(24.0),
                                    side: BorderSide(color: Colors.white)))),
                      );
                    }),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                     const  Text(
                        'Have an Account?',
                        style: TextStyle(fontSize: 15),
                      ),
                      TextButton(
                        onPressed: () {
                          Navigator.of(context).push(
                              MaterialPageRoute(builder: (context) => Login()));
                        },
                        child: const Text(
                          'Sign in',
                          style: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.bold,
                            color: Color(0xFF7EAA92),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}