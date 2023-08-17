import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:image_picker/image_picker.dart';

import '../Classes/Personal_info.dart';
class Profile_page extends StatefulWidget {
  final Person_info user;
  const Profile_page(this.user );

  @override
  State<Profile_page> createState() => _Profile_pageState();
}

class _Profile_pageState extends State<Profile_page> {
  IconData pass_eye=MdiIcons.eyeLock;
  bool eye_pressed=false;
  String pass="*********";
  Color save_changes= Color.fromRGBO(1, 70, 66, 1.0);

  TextEditingController user_name=TextEditingController();
  TextEditingController phone=TextEditingController();
  TextEditingController email=TextEditingController();
  TextEditingController password=TextEditingController();
  String profile_image_path='';
  double screenWidth=0;
  @override
  Widget build(BuildContext context) {
    final screenWidth1 = MediaQuery.of(context).size.width;
    screenWidth=screenWidth1;
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [

              Stack(
                alignment: Alignment.topCenter,
                children: [
                  Container(
                    height: 0.6*screenWidth,
                    width: screenWidth,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(0.2*screenWidth),
                        color: Colors.black
                    ),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(0.2*screenWidth),
                      child: Image.asset("Assets/Images/image_processing20200825-24260-1l1hr8o.gif",fit: BoxFit.cover,),
                    ),
                  ),
                  Stack(
                    alignment: Alignment.bottomCenter,
                    children: [
                      Container(
                          height: screenWidth*0.9,
                          width: screenWidth,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(screenWidth*0.2),
                              color: Colors.transparent
                          )),
                      Container(
                        width: screenWidth*0.28*2,
                        height: screenWidth*0.28*2,
                        decoration: BoxDecoration(
                            color:Colors.black,
                            shape: BoxShape.circle
                        ),
                        child: Stack(
                          alignment: Alignment.bottomRight,
                          children: [
                            CircleAvatar(
                              backgroundColor: Colors.black54,
                              radius: screenWidth*0.28,
                              child: CircleAvatar(
                                radius: screenWidth*0.27,
                                backgroundImage: profile_image_path==''? AssetImage(
                                  "Assets/Images/image_processing20210910-22853-1777qya.gif",
                                ):Image.file(File(profile_image_path) ).image,
                              ),
                            ),
                            InkWell(
                              onTap: (){
                                setState(() {
                                  selectImage();
                                });
                              },
                              child: CircleAvatar(
                                backgroundImage: AssetImage("Assets/Images/camera.png"),
                                radius: screenWidth*0.09,
                              ),
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              SizedBox(height: screenWidth*0.04,),
              Text(
                'Loay',
                style: TextStyle(
                  fontSize: screenWidth*0.1,
                  fontFamily: "sweety",
                  color: Colors.black12,
                ),
              ),
              SizedBox(height: screenWidth*0.04,),
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(screenWidth*0.05),
                  color: Colors.black12,
                ),
                child: TextField(
                  controller: user_name,
                  decoration: InputDecoration(
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: Colors.transparent,
                        ),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                            color: Color.fromRGBO(1, 126, 120, 1.0),
                            width: 2
                        ),
                        borderRadius: BorderRadius.circular(screenWidth*0.05),
                      ),
                      hintText: "${widget.user.name}",
                      hintStyle: TextStyle(
                        overflow: TextOverflow.fade,
                        fontFamily: 'Amperzand',
                        fontSize: screenWidth*0.05,
                        color: Colors.white,
                      ),
                      labelText: "user name",
                      labelStyle: TextStyle(
                        fontSize: screenWidth*0.06,
                        fontFamily: "Sweety",

                      ),
                      prefixIcon: Icon(FontAwesomeIcons.userCircle,
                        color: Colors.black,)
                  ),
                ),
              ),
              SizedBox(height: screenWidth*0.04,),
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(screenWidth*0.05),
                  color: Colors.black12,
                ),
                child: TextField(
                  controller: phone,
                  decoration: InputDecoration(
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: Colors.transparent,
                        ),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                            color: Color.fromRGBO(1, 126, 120, 1.0),
                            width: 2
                        ),
                        borderRadius: BorderRadius.circular(screenWidth*0.05),
                      ),
                      hintText: "${widget.user.phone}",
                      hintStyle: TextStyle(
                        overflow: TextOverflow.fade,
                        fontFamily: 'Amperzand',
                        fontSize: screenWidth*0.05,
                        color: Colors.white,
                      ),
                      labelText: "phone number",
                      labelStyle: TextStyle(
                        fontSize: screenWidth*0.06,
                        fontFamily: "Sweety",

                      ),
                      prefixIcon: Icon(FontAwesomeIcons.phoneVolume,
                        color: Colors.black,)
                  ),
                ),
              ),
              SizedBox(height: screenWidth*0.04,),
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(screenWidth*0.05),
                  color: Colors.black12,
                ),
                child: TextField(
                  controller: email,
                  decoration: InputDecoration(
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: Colors.transparent,
                        ),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                            color: Color.fromRGBO(1, 126, 120, 1.0),
                            width: 2
                        ),
                        borderRadius: BorderRadius.circular(screenWidth*0.05),
                      ),
                      hintText: "${widget.user.mail}",
                      hintStyle: TextStyle(
                        overflow: TextOverflow.fade,
                        fontFamily: 'Amperzand',
                        fontSize: screenWidth*0.05,
                        color: Colors.white,
                      ),
                      labelText: "Email",
                      labelStyle: TextStyle(
                        fontSize: screenWidth*0.06,
                        fontFamily: "Sweety",

                      ),
                      prefixIcon: Icon(MdiIcons.emailBox,
                        color: Colors.black,)
                  ),
                ),
              ),
              SizedBox(height: screenWidth*0.04,),
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(screenWidth*0.05),
                  color: Colors.black12,
                ),
                child: TextField(
                  controller: password,
                  decoration: InputDecoration(
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: Colors.transparent,
                        ),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                            color: Color.fromRGBO(1, 126, 120, 1.0),
                            width: 2
                        ),
                        borderRadius: BorderRadius.circular(screenWidth*0.05),
                      ),
                      hintText: "$pass",
                      hintStyle: TextStyle(
                        overflow: TextOverflow.fade,
                        fontFamily: 'Amperzand',
                        fontSize: screenWidth*0.05,
                        color: Colors.white,
                      ),
                      labelText: "Password",
                      labelStyle: TextStyle(
                        fontSize: screenWidth*0.06,
                        fontFamily: "Sweety",

                      ),
                      prefixIcon: Icon(Icons.password_sharp,
                        color: Colors.black,),
                      suffixIcon: IconButton(
                        onPressed: (){
                          setState(() {
                            eye_pressed=!eye_pressed;
                            pass_eye=eye_pressed?MdiIcons.eyeCheck:MdiIcons.eyeLock;
                            pass=eye_pressed?widget.user.password:"*********";
                          });
                        },
                        icon: Icon(pass_eye),
                      )
                  ),
                  obscureText: true,
                ),
              ),
              SizedBox(height: screenWidth*0.06,),
              MaterialButton(
                onPressed: (){
                  setState(() {
                    save_changes=Color.fromRGBO(1, 126, 120, 1.0);
                    widget.user.name=user_name.text!=''?user_name.text:widget.user.name;
                    widget.user.phone=phone.text!=''?phone.text:widget.user.phone;
                    widget.user.mail=email.text!=''?email.text:widget.user.mail;
                    widget.user.password=password.text!=''?password.text:widget.user.password;
                    print(user_name.text);
                    print(widget.user.name);

                  });
                },
                child: Container(
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.black87,width: 2),
                    borderRadius: BorderRadius.circular(screenWidth*0.05),
                    color: save_changes,
                  ),
                  width: screenWidth*0.5,
                  height: screenWidth*0.2,
                  child: Center(
                      child: Text(
                        'Save changes',
                        style: TextStyle(
                            fontFamily: "Amperzand",
                            fontSize: screenWidth*0.09,
                            color: Colors.white
                        ),
                      )
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
  Future selectImage()
  {
    return showDialog(
        context: context,
        builder: (BuildContext context) {
          return Dialog(
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20.0)),
            child: Container(
                height: screenWidth*0.7,
                child:Padding(
                  padding: EdgeInsetsDirectional.all(20.0),
                  child: Column(
                    children: [
                      Text(
                        'Choose the photo source',
                        style: TextStyle(
                          fontSize: screenWidth*0.06,
                          fontFamily: "Amperzand",
                          color: Colors.black45,
                        ),
                      ),
                      SizedBox(height: screenWidth*0.1,),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              GestureDetector(
                                onTap: ()async{
                                  profile_image_path=await wallpaper();
                                  if(profile_image_path.isNotEmpty)
                                  {
                                    Navigator.pop(context);
                                    setState(() {
                                    });
                                  }
                                },
                                child: Container(
                                    width: screenWidth*0.2,
                                    height: screenWidth*0.2,
                                    child: Image.asset("Assets/Images/wallpaper.png")
                                ),
                              ),
                              SizedBox(height: 10.0,),
                              Text(
                                'Wallpaper',
                                style: TextStyle(
                                  fontFamily: 'Sweety',
                                  fontSize: screenWidth*0.06,
                                  color: Colors.black,
                                ),
                              )
                            ],
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              GestureDetector(
                                onTap: ()async{
                                  profile_image_path=await camera();
                                  if(profile_image_path.isNotEmpty)
                                  {
                                    Navigator.pop(context);
                                    setState(() {
                                    });
                                  }
                                },
                                child: Container(
                                    width: screenWidth*0.2,
                                    height: screenWidth*0.2,
                                    child: Image.asset("Assets/Images/camera (1).png")
                                ),
                              ),
                              SizedBox(height: 10.0,),
                              Text(
                                'Camera',
                                style: TextStyle(
                                  fontFamily: 'Sweety',
                                  fontSize: screenWidth*0.06,
                                  color: Colors.black,
                                ),
                              )
                            ],
                          ),
                        ],
                      )
                    ],
                  ),
                )

            ),
          );
        }
    );
  }
  wallpaper() async{
    XFile? image_file= await ImagePicker().pickImage(source: ImageSource.gallery,imageQuality: 10);
    if(image_file!=null)
      return image_file.path;
    else
      return '';
  }

  camera() async{
    XFile? image_file= await ImagePicker().pickImage(source: ImageSource.camera,imageQuality: 10);
    if(image_file!=null)
      return image_file.path;
    else
      return '';
  }
}

