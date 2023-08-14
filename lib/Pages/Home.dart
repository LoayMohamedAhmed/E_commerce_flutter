import 'package:ecommerce/Classes/products.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:flutter_image_slideshow/flutter_image_slideshow.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:fluid_bottom_nav_bar/fluid_bottom_nav_bar.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
class home extends StatefulWidget {
  const home({super.key});

  @override
  State<home> createState() => _homeState();
}

class _homeState extends State<home> {

  List<Color>barcolor=[Colors.white,
    Color.fromRGBO(255, 33, 131, 1.0),
    Colors.white,
    Colors.lightBlueAccent,
    Colors.white];

  List<IconData> listOfIcons = [
    FontAwesomeIcons.home,
    Icons.favorite,
    MdiIcons.earth,
    MdiIcons.cartOutline,
    FontAwesomeIcons.userCircle
  ];

  List<String> listOfStrings = [
    'Home',
    'favourite',
    'Explore',
    'Cart',
    'Account',
  ];

  bool fav_pressed=false;
  bool cart_pressed=false;
  TextEditingController? search_value ;
  bool ispressed=true;
  String app_name='hello';
  bool notification= true;
  Color online=Colors.green;
  Color pressed=Color.fromRGBO(2, 63, 40, 1);
  List slideShow=["Assets/Images/Sale Promotion Digital Display HD - Made with PosterMyWall.gif"];
  String Image_url= "https://images.pexels.com/photos/213780/pexels-photo-213780.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500";
  int current_index=0;
  List<IconData> navbar_icons=[FontAwesomeIcons.home,MdiIcons.earth,MdiIcons.cartOutline,FontAwesomeIcons.userCircle];


  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    List<products> home_products=[
      products('Cookies', 50, 'https://th.bing.com/th/id/OIP.6e8n0Naqmwjg-IbT1UjkewHaE6?pid=ImgDet&rs=1','Food',screenWidth*0.6 ),
      products('Cookies', 50, 'https://th.bing.com/th/id/OIP.6e8n0Naqmwjg-IbT1UjkewHaE6?pid=ImgDet&rs=1','Food',screenWidth*0.6 ),
    ];
    List<Widget> Slidshow=slideShow.map((url) =>Image.asset(url),).toList();
    return Scaffold(
      backgroundColor: Colors.transparent,
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text(
          '$app_name',
          style: const TextStyle(
            fontFamily: 'Sweety',
            color: Colors.black,
            fontSize: 30.0,
          ),
        ) ,
        elevation: 0,
        actions: [IconButton(
            onPressed: (){
          // notification page
        },
            icon: Stack(
              alignment: Alignment.topRight,
              children: [
                 Icon(
                  Icons.notifications_on_outlined,
                   size: 30,
                   color: Colors.grey,
                ),
                CircleAvatar(
                  backgroundColor: notification ? Colors.orange:Colors.transparent,
                  radius: 5,
                )
              ],
            )
        ),
           SizedBox(
             width: 20.0,
           ),
           Stack(
             alignment: Alignment.center,
             children: [
               CircleAvatar(
                 backgroundColor:online ,
                 radius: 22.0,
               ),
               CircleAvatar(
                backgroundImage: NetworkImage(
                   '$Image_url'
                ),
                 radius: 20.0,
          ),
             ],
           ),
          SizedBox(
            width: 20.0,
          ),
        ]
      ),

      body: Container(
        color: Colors.transparent,
        child: page1(screenWidth, Slidshow,home_products),
      ),

      bottomNavigationBar:Container(
        margin: EdgeInsetsDirectional.all(screenWidth*0.01),
        height: screenWidth*0.1,
        decoration: BoxDecoration(
            boxShadow: [
              BoxShadow(
                  color: Colors.black.withOpacity(0.5),
                  offset: Offset(-15,30),
                  blurRadius: 50
              )
            ],
          color: Colors.black,
          borderRadius: BorderRadius.circular(screenWidth*0.1)
        ),
        child: ListView.builder(
          padding: EdgeInsets.symmetric(horizontal: screenWidth * .02),
          scrollDirection: Axis.horizontal,
          itemCount: 5,
          itemBuilder: (context,index)=>navBar(index, screenWidth)
        ),
      ),
    );

  }
  Widget product( products p)
  {
    return GestureDetector(
      onTap: (){

      },
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(30.0),
          color: Colors.black,
        ),
        height: p.height,
        child: ClipRRect(
          borderRadius: BorderRadius.circular(30.0),
          child: Stack(
            alignment: Alignment.topCenter,
            children: [
              Container(
                height: p.height,
                child: Image.network(
                  '${p.product_img}',
                  fit: BoxFit.cover,
                ),
              ),
              Text(
                '${p.category}',
                style: TextStyle(
                  fontFamily: 'Sweety',
                  color: Colors.white54,
                  fontSize:25.0,
                ),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Text(
                    '${p.product_name}',
                    style: TextStyle(
                      fontFamily: 'Arial',
                      color: Colors.white,
                      fontSize:30.0,
                    ),
                  ),
                  RatingBar.builder(
                    itemSize: 20.0,
                    initialRating: 3,
                    minRating: 1,
                    direction: Axis.horizontal,
                    allowHalfRating: true,
                    itemCount: 5,
                    itemPadding: EdgeInsetsDirectional.all(4.0),
                    itemBuilder: (context, _) => Icon(
                      FontAwesomeIcons.solidHeart,
                      color: Colors.white,
                    ),
                    onRatingUpdate: (rating) {
                      print(rating);
                    },
                  ),
                  SizedBox(height: 5.0,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      IconButton(onPressed: (){
                        setState(() {
                          cart_pressed=!cart_pressed;
                        });
                      },
                        icon: Icon(
                          Icons.shopping_cart_sharp,
                          color: cart_pressed? Colors.lightBlueAccent:Colors.white70,
                          size: 30.0,
                        ),
                      ),
                      Text(
                        '${p.product_price} \$ ',
                        style: TextStyle(
                          fontFamily: 'fastForward',
                          fontSize: 30.0,
                          color: Colors.white,
                        ),
                      ),
                      IconButton(
                        onPressed: (){
                          print('object');
                          setState(() {
                            fav_pressed=!fav_pressed;
                          });
                        },
                        icon: Icon(
                          Icons.favorite,
                          color: fav_pressed? Color.fromRGBO(255, 33, 131, 1.0):Colors.white70,
                          size: 30.0,
                        ),
                      ),
                    ],
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
  Widget page1( screenWidth,Slidshow,home_products)
  {
    return Padding(
      padding: EdgeInsetsDirectional.all(20.0),
      child: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsetsDirectional.only(
                bottom: 20.0,
              ),
              child:Container(
                height: 50.0,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(30.0),
                  color: Colors.grey.withOpacity(0.3),
                ),
                child: Center(
                  child: TextField(
                    controller: search_value,
                    decoration: InputDecoration(
                      enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(30.0),
                          borderSide: BorderSide(
                            color: Colors.transparent,
                          )
                      ),
                      focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: Colors.white12,
                          )
                      ),
                      prefixIcon: Icon(
                        FontAwesomeIcons.search,
                        color: Colors.grey,
                      ),
                      hintText: 'Search Product',
                      hintStyle: TextStyle(
                        fontSize: 20.0,
                        color: Colors.grey,
                      ),
                    ),
                  ),
                ),
              ),
            ),//search bar
            Padding(
                padding: EdgeInsetsDirectional.only(
                  bottom: 20.0,
                ),
                child: Container(
                  height: screenWidth*0.6,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(screenWidth*0.2),

                  ),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(screenWidth*0.2),
                    child: ImageSlideshow(
                      children: Slidshow,
                      autoPlayInterval: 3000,
                    ),
                  ),
                )
            ), // slider
            Padding(
              padding: const EdgeInsetsDirectional.only(bottom: 20.0),
              child: Row(
                children: [
                  Expanded(
                    child: Container(
                      height: 40.0,
                      decoration: BoxDecoration(
                        color: ispressed? pressed:Colors.grey.withOpacity(0.2),
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: MaterialButton(
                        onPressed:(){
                          setState(() {
                            ispressed=true;
                          });
                        },
                        child: const Text(
                          'Top Selling',
                          style: TextStyle(
                              fontSize: 20.0,
                              color: Colors.white,
                              fontFamily: 'Amperzand'
                          ),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(width: 20.0,),
                  Expanded(
                    child: Container(
                      height: 40.0,
                      decoration: BoxDecoration(
                        color: !ispressed? pressed:Colors.grey.withOpacity(0.2),
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: MaterialButton(
                        onPressed:(){
                          setState(() {
                            ispressed=false;
                          });
                        },
                        child: const Text(
                          'For you',
                          style: TextStyle(
                              fontSize: 20.0,
                              color: Colors.white,
                              fontFamily: 'Amperzand'
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ), //buttons
            ListView.separated(
              itemBuilder: (context,index)=>product(home_products[index]),
              separatorBuilder: (context,index)=>const SizedBox(
                height: 20.0,
              ),
              itemCount: home_products.length,
              physics: NeverScrollableScrollPhysics(),
              shrinkWrap: true,),
          ],
        ),
      ),
    );
  }

  Widget navBar(index,screenWidth)
  {
    return InkWell(
      onTap: (){
        setState(() {
          current_index=index;
        });
      },
      splashColor: Colors.transparent,
      highlightColor: Colors.transparent,
      child: Stack(
        children: [
          AnimatedContainer(
            duration: Duration(seconds: 1),
            curve: Curves.fastLinearToSlowEaseIn,
            width: index == current_index
                ? screenWidth * .23
                : screenWidth * .15,
            alignment: Alignment.center,
            child:  AnimatedContainer(
              duration: Duration(seconds: 1),
              curve: Curves.fastLinearToSlowEaseIn,
              height: index == current_index ? screenWidth * .12 : 0,
              width: index == current_index ? screenWidth * .23 : 0,
              decoration: BoxDecoration(
                color: index == current_index
                    ? Colors.teal.withOpacity(0.2)
                    : Colors.transparent,
                borderRadius: BorderRadius.circular(screenWidth*0.1),
              ),
            ),

          ),
          AnimatedContainer(
            duration: Duration(seconds: 1),
            curve: Curves.fastLinearToSlowEaseIn,
            width: index == current_index
                ? screenWidth * .31
                : screenWidth * .18,
            alignment: Alignment.center,
            child: Stack(
              children: [
                Row(
                  children: [
                    AnimatedContainer(
                      duration: Duration(seconds: 1),
                      curve: Curves.fastLinearToSlowEaseIn,
                      width:
                      index == current_index  ? screenWidth * .13 : 0,
                    ),
                    AnimatedOpacity(
                      opacity: index == current_index  ? 1 : 0,
                      duration: Duration(seconds: 1),
                      curve: Curves.fastLinearToSlowEaseIn,
                      child: Text(
                        index == current_index
                            ? '${listOfStrings[index]}'
                            : '',
                        style: TextStyle(
                            color: Colors.blueAccent,
                            fontWeight: FontWeight.w600,
                            fontSize: screenWidth*0.03,
                            fontFamily: 'Amperzand'
                        ),
                      ),
                    ),
                  ],
                ),
                Row(
                  children: [
                    AnimatedContainer(
                      duration: Duration(seconds: 1),
                      curve: Curves.fastLinearToSlowEaseIn,
                      width:
                      index == current_index ? screenWidth * .03 : 20,
                    ),
                    Icon(
                      listOfIcons[index],
                      size: screenWidth * .076,
                      color: index == current_index
                          ? barcolor[index]
                          : Colors.white60,
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

