import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_colorpicker/flutter_colorpicker.dart';
import 'package:image_picker/image_picker.dart';
import 'package:newregentspace/constructs/previews/homepreview.dart';

class RegentCanvaPage extends StatefulWidget {
  const RegentCanvaPage({super.key}) ;
  @override
  State<RegentCanvaPage> createState() => _RegentCanvaPageState();
}

class _RegentCanvaPageState extends State<RegentCanvaPage> {




  final _textEditingController = TextEditingController();
  String appName = 'App Name';
 
  Color colorFromHue(double hue) {
    return HSLColor.fromAHSL(1.0, hue, 1.0, 0.4).toColor();
  }
  double _currentHue = 210; 
  Color get _currentColor => colorFromHue(_currentHue);


    Color myColor =  Color.fromRGBO(240, 240, 240, 1);
  // ignore: unused_element
  void _showColorPicker() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return CupertinoAlertDialog(
          title: Text('Choose color'),
          content: SingleChildScrollView(
            child: ColorPicker(
              pickerColor: myColor,
              onColorChanged: changeColor,
            ),
          ),
          actions: <Widget>[
            TextButton(
              child: Text('Done', style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

void changeColor(Color color) {
    setState(() {
      myColor = color;
    });
  }

String? _selectedImagePath;
Future _pickImage() async{
 final imagepicked = await ImagePicker().pickImage(source: ImageSource.gallery);
 if(imagepicked == null) return;
   setState((){
    _selectedImagePath = imagepicked.path;
 });
 }




  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        leading: GestureDetector(
          onTap: () {
            showModalBottomSheet(
               context: context,
               shape: RoundedRectangleBorder(
                 borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
               ),
               builder: (context) => Container(
                 height: 300,
                 width: MediaQuery.of(context).size.width*1,
                 padding: EdgeInsets.all(16),
                 decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Colors.white
                 ),
                 child: Padding(
                   padding: const EdgeInsets.symmetric(vertical:20.0),
                   child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                     children: [
                       Text("Saved Drafts", style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold)),
                       Text("New Project", style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold)),
                       Text("Templates", style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold)),
                       Text("Updates", style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold)),
                      
                     ],
                   ),
                 ),
               ),
             );
          },
          child: Icon(Icons.menu, size: 21,)),
        title:Text(
                "Canvas",
                style: GoogleFonts.sora(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ), 
        actions: [
           DropdownButtonHideUnderline(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: DropdownButton(
                  icon: Icon(Icons.more_vert, size: 25, color: Colors.black54,),
                  borderRadius: BorderRadius.circular(8),
                  dropdownColor: Colors.white,
                  items: [
                    DropdownMenuItem(
                      value: 'Settings',
                      child: Text('Settings'),
                    ),
                    DropdownMenuItem(
                      value: 'Info',
                      child: Text('Info'),
                    ),
                  ],
                  onChanged: (value) {
                    // Handle dropdown selection
                  },
                ),
              ),
            ),
            SizedBox(width: 10,),
        ],
      ),
      body: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        height: MediaQuery.of(context).size.height*1,
        child: ListView(
          children: [
            SizedBox(height: 8),
            Text('App manifest', style: TextStyle(
              fontSize: 16, fontWeight: FontWeight.w700
            )),
            SizedBox(height: 8),
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(
                  width: 70,
                  child: Text('App Name', style: TextStyle(fontWeight: FontWeight.w600, fontSize: 13)),
                ),
                const SizedBox(width: 8),
                Expanded(
                  child: 
                    Container(
                      height: 47,
                      color:const Color.fromRGBO(245, 245, 245, 1),
                      child: TextField(
                        controller: _textEditingController,
                        decoration: InputDecoration(
                          border: OutlineInputBorder(
                            borderSide: BorderSide.none,
                          ),
                          suffixIcon: IconButton(onPressed: (){
                            _textEditingController.clear();
                          }, icon: Icon(Icons.clear)),
                          hintText: ''),
                        style: GoogleFonts.lato(fontSize: 14),
                      ),
                    ),
                  
                ),
                SizedBox(width: 8,),
                MaterialButton(
                  onPressed: (){
                    setState(() {
                      appName = _textEditingController.text;
                    });
                  },
                  color: Color.fromRGBO(108, 0, 144, 1),
                  child: Text('add', style: TextStyle(color: Colors.white, fontSize: 14)),
                )
              ],
            ),
            const SizedBox(height: 16),
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(
                  width: 70,
                  child: Text(
                    'Theme',
                    style: TextStyle(fontWeight: FontWeight.w600, fontSize: 13),
                  ),
                ),
                const SizedBox(width: 8),
                Expanded(
                  child: softContainer(
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8),
                      child: Row(
                        children: [
                          Expanded(
                            child: Container(
                              height: 8,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20),
                                gradient: const LinearGradient(
                                  colors: [
                                    Color.fromARGB(255, 201, 16, 3),
                                    Colors.orange,
                                    Colors.yellow,
                                    Colors.green,
                                    Colors.cyan,
                                    Colors.blue,
                                    Colors.purple,
                                    Colors.red, // wrap around
                                  ],
                                ),
                              ),
                              child: SliderTheme(
                                data: SliderTheme.of(context).copyWith(
                                  trackHeight: 20,
                                  thumbColor: Colors.white,
                                  activeTrackColor: Colors.transparent,
                                  inactiveTrackColor: Colors.transparent,
                                  overlayColor: _currentColor
                                ),
                                child: Slider(
                                  value: _currentHue,
                                  min: 0,
                                  max: 360,
                                  onChanged: (double value) {
                                    setState(() {
                                      _currentHue = value;
                                    });
                                  },
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(width: 8),
                          Container(
                            width: 20,
                            height: 20,
                            decoration: BoxDecoration(
                              color: _currentColor,
                              shape: BoxShape.circle,
                              border: Border.all(color: Colors.grey.shade300),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              
              ],
            ),
            SizedBox(height: 16),
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  width: 70,
                  child: Text('BG theme', style: TextStyle(fontWeight: FontWeight.w600, fontSize: 13)),
                ),
                const SizedBox(width: 8),
                Expanded(
                  child: softContainer(
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text('choose background', style: GoogleFonts.lato(fontSize: 14)),
                        GestureDetector(
                          onTap: _showColorPicker,
                          child: Container(
                            width: 20,
                            height: 20,
                            decoration: BoxDecoration(
                              color: myColor,
                              borderRadius: BorderRadius.circular(40),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.grey,
                                  blurRadius: 4,
                                  offset: Offset(0, 0),
                                ),
                              ]
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 16),
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(
                  width: 70,
                  child: Text('Logo', style: TextStyle(fontWeight: FontWeight.w600, fontSize: 13)),
                ),
                const SizedBox(width: 8),
                Expanded(
                  child: softContainer(
                    GestureDetector(
                      onTap: _pickImage,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              const Icon(Icons.add_photo_alternate, color: Color.fromARGB(115, 7, 7, 7), size: 20),
                              const SizedBox(width: 6),
                              Text('Add media file', style: GoogleFonts.lato(fontSize: 14)),
                            ],
                          ),
                          IconButton(
                              icon:Icon(Icons.add_circle), 
                              color: Color.fromARGB(160, 8, 8, 8), 
                              onPressed: () { 
                                _pickImage();
                               },),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
              
              
            SizedBox(height: 24),
            Text('Page Previews', style: TextStyle(fontWeight: FontWeight.w600, fontSize: 16)),
            SizedBox(height: 8),
            SizedBox(
              height: 300,
              width: MediaQuery.of(context).size.width*1,
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: [
                  _previewStackContainer1(),
                  SizedBox(width:20),
                  _previewStackContainer2(),
                  SizedBox(width:20),
                  _previewStackContainer3(),
                ]
              ),
            ),
            SizedBox(height: 10),
            Row(
              children: [
                MaterialButton(
                  onPressed: () {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Center(child: Text('Project saved to draft')),
                        duration: Duration(seconds: 2),
                        backgroundColor: const Color.fromARGB(195, 0, 0, 0),
                         shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                    );
                  },
                  color: Color.fromRGBO(175, 175, 175, 1),
                  child: Text('Save draft', style: TextStyle(color: Colors.white, fontSize: 14)),),
                  const SizedBox(width: 10),
                Expanded(
                  child: MaterialButton(
                    onPressed: () {
                      Navigator.push(context, MaterialPageRoute(builder: (context) => Homepreview(
                        bgcolor: _currentColor,
                        myColor: myColor,
                      )));
                    },
                    color: Color.fromRGBO(191, 40, 241, 1),
                    child: Text('Preview', style: TextStyle(color: Colors.white, fontSize: 14)),
                  ),
                ),
                const SizedBox(width: 10),
                MaterialButton(
                  onPressed: () {
                    // Save or submit action
                  },
                  color: Color.fromRGBO(108, 0, 144, 1),
                  child: Text('Deploy', style: TextStyle(color: Colors.white, fontSize: 14)),)
              ],
            )
              
              
              ],
            ),
      )
    );
    
  }




  Widget _previewStackContainer1() {
    return Container(
      height: 300,
      width: 180,
      decoration: BoxDecoration(
        color: myColor,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          CircleAvatar(
            radius: 50,
            backgroundColor: Colors.transparent,
            child: _selectedImagePath == null
                ? Image.asset('assets/addLogo.png')
                : Image.file(File(_selectedImagePath!)),
          ),
          Text(appName, style: TextStyle(fontSize: 17, color:Colors.black45, fontWeight: FontWeight.bold))
        ],
      ) ,
    );
  }

  Widget _previewStackContainer2() {
    return Container(
      height: 300,
      width: 180,
      decoration: BoxDecoration(
        color: myColor,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Column(children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Hi, User",
                    style: TextStyle(fontSize: 10, fontWeight: FontWeight.bold),
                  ),
                  TextButton(
                    onPressed: () {},
                    style: TextButton.styleFrom(
                      foregroundColor: _currentColor,
                    ),
                    child: Row(
                      children: [
                        const Text("Add Money", style: TextStyle(fontSize: 10)),
                        const SizedBox(width: 3),
                        Icon(
                          Icons.add_circle,
                          color: _currentColor,
                          size: 9,
                        ),
                      ],
                    ),
                  ), ],
                    ),
                    Container(
                      width: double.infinity,
                      height: 70,
                      padding: EdgeInsets.all(6),
                      decoration: BoxDecoration(
                        color: _currentColor,
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Center(
                            child: Text(
                              "Account Balance",
                              style: TextStyle(
                                fontSize: 10,
                                color: Colors.white70,
                              ),
                            ),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Center(
                                child: Text(
                                  "₦ 2,554,706",
                                  style: GoogleFonts.lato(
                                    fontSize: 10,
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                            
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                "Moniepoint",
                                style: GoogleFonts.lato(
                                  color: Colors.white,
                                  fontSize: 10.5,
                                ),
                              ),
                              SizedBox(width: 3),
                              GestureDetector(
                                onTap: () {
                                  Clipboard.setData(ClipboardData(text: "1100336447"));
                                },
                                child: Row(
                                  children: [
                                    Icon(Icons.copy, size: 12, color: Colors.white),
                                    SizedBox(width: 4),
                                    Text(
                                      "1100336447",
                                      style: GoogleFonts.lato(
                                        color: Colors.white,
                                        fontSize: 10.5,
                                      ),
                                    ),
                                  ],
                                ),
                              )
                            ],
                          ),
                        ],
                      ),
                    ),
            ],),
              SizedBox(height: 10),

              // Services
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Container(
                        width: 15,
                        height: 15,
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            image: AssetImage("assets/images/phone.png"),
                            fit: BoxFit.contain)
                        )
                      ),
                      Text("Airtime", style: TextStyle(fontSize: 8))
                    ],
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Container(
                        width: 15,
                        height: 15,
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            image: AssetImage("assets/images/wifi.png"),
                            fit: BoxFit.contain)
                        )
                      ),
                      Text("Data", style: TextStyle(fontSize: 8))
                    ],
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Container(
                         width: 15,
                        height: 15,
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            image: AssetImage("assets/images/tv.png"),
                            fit: BoxFit.contain)
                        )
                      ),
                      Text("Cable TV", style: TextStyle(fontSize: 8))
                    ],
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Container(
                         width: 15,
                        height: 15,
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            image: AssetImage("assets/images/bulb.png"),
                            fit: BoxFit.contain)
                        )
                      ),
                      Text("Electricity", style: TextStyle(fontSize: 9))
                    ],
                  ),
                ],
              ),
            SizedBox(height: 5),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("Recent Transactions", style: TextStyle(fontSize: 9, fontWeight: FontWeight.bold)),
                    Text("see all", style: TextStyle(fontSize: 8)),
                  ],
                ),
            
                Expanded(
                  child: ListView.builder(
                    itemCount: 5,
                    itemBuilder: (BuildContext context, int index) {
                      return Padding(
                        padding: const EdgeInsets.all(4.0),
                        child: Container(
                            margin: EdgeInsets.symmetric(vertical: 2),
                            padding: EdgeInsets.all(4),
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(5),
                              boxShadow: [
                                BoxShadow(
                                  color: const Color.fromARGB(94, 158, 158, 158),
                                  blurRadius: 6,
                                  offset: Offset(2, 2),
                                ),
                              ],
                            ),
                            child: Row(
                              children: [
                                // Image
                                Container(
                                  width: 10,
                                  height: 10,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(8),
                                    color: Colors.grey[100],
                                  ),
                                  child: Padding(
                                    padding: const EdgeInsets.all(6.0),
                                    child: Icon(Icons.wallet_outlined, size: 8,)
                                  ),
                                ),

                                SizedBox(width: 12),

                                // Title and Time
                                Expanded(
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        'loan payment',
                                        style: TextStyle(
                                          fontSize: 9,
                                          fontWeight: FontWeight.w500,
                                        ),
                                      ),
                                      SizedBox(height: 2),
                                      Text(
                                        '12:00pm',
                                        style: TextStyle(
                                          fontSize: 8,
                                          color: Colors.grey[600],
                                        ),
                                      ),
                                    ],
                                  ),
                                ),

                                // Amount
                                Text(
                                  '+3,000',
                                  style: TextStyle(
                                    fontSize: 7,
                                    color:Colors.red ,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ],
                            ),
                          )
                      );
                    },
                  ),
                )
               
          ],
        ),
      )
    );
  }

  Widget _previewStackContainer3() {
    return Container(
      height: 300,
      width: 180,
      decoration: BoxDecoration(
        color: myColor,
        borderRadius: BorderRadius.circular(12),
      ),
      child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 3), // ⬅ Horizontal screen padding
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ProfileOptionNewTile(
                title: 'Profile',
                leading: Image.asset(
                  'assets/images/profile.png',
                  width: 10,
                  height: 10,
                ),
                onTap: () {
                  },
              ),

              SizedBox(height: 3),

              ProfileOptionNewTile(
                title: 'Linked Accounts',
                leading: Image.asset(
                  'assets/images/linkedacct.png',
                  width: 10,
                  height: 10,
                ),
                onTap: () {},
              ),

              SizedBox(height: 3),

              ProfileOptionNewTile(
                title: 'Saved Cards',
                leading: Image.asset(
                  'assets/images/savedcards.png',
                  width: 10,
                  height: 10,
                ),
                onTap: () {},
              ),

              SizedBox(height: 3),

              ProfileOptionNewTile(
                title: 'Referrals',
                leading: Image.asset(
                  'assets/images/referrals.png',
                  width: 10,
                  height: 10,
                ),
                onTap: () {},
              ),

              SizedBox(height: 3),

              ProfileOptionNewTile(
                title: 'Security',
                leading: Image.asset(
                  'assets/images/security.png',
                  width: 10,
                  height: 10,
                ),
                onTap: () {
                  },
              ),

              SizedBox(height: 3),

              ProfileOptionNewTile(
                title: 'Support',
                leading: Image.asset(
                  'images/support.png',
                  width: 10,
                  height: 10,                ),
                onTap: () {},
              ),

              SizedBox(height: 3),

              ProfileOptionNewTile(
                title: 'About Us',
                leading: Image.asset(
                  'assets/images/aboutus.png',
                  width: 10,
                  height: 10,
                ),
                onTap: () {},
              ),

              SizedBox(height: 3),

              ProfileOptionNewTile(
                title: 'FAQs',
                leading: Image.asset(
                  'assets/images/FAQs.png',
                  width: 10,
                  height: 10,
                ),
                onTap: () {},
              ),

              SizedBox(height: 3),

              ProfileOptionNewTile(
                title: 'Privacy Policy',
                leading: Image.asset(
                  'images/privacypolicy.png',
                  width: 10,
                  height: 10,
                ),
                onTap: () {},
              ),

              SizedBox(height: 3),

              ProfileOptionNewTile(
                title: 'Log Out',
                leading: Image.asset(
                  'assets/images/logout.png',
                  width: 10,
                  height: 10,
                ),
                onTap: () {},
              ),

            ],
          ),
        ),
      ),
    );
  }



}






Widget softContainer(Widget child) {
  return Material(
    color: Color.fromARGB(255, 240, 240, 240),
    borderRadius: BorderRadius.circular(8),
    elevation: 0.5,
    child: Container(
      height: 47,
      alignment: Alignment.centerLeft,
      padding: const EdgeInsets.symmetric(horizontal: 12),
      child: child,
    ),
  );
}

class ProfileOptionNewTile extends StatelessWidget {
  final String title;
  final VoidCallback onTap;
  final Widget leading;

  const ProfileOptionNewTile({
    super.key,
    required this.title,
    required this.onTap,
    required this.leading,
  });

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.white,
      //color: Colors.grey.shade100,
      borderRadius: BorderRadius.circular(12),
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(12),
        child: Container(
          height: 35,
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Row(
            children: [
              leading,
              const SizedBox(width: 12),
              Expanded(
                child: Text(
                  title,
                  style: const TextStyle(
                    fontSize: 10,
                    fontWeight: FontWeight.w500,
                    color: Color(0xFF1D3A70),
                  ),
                ),
              ),
              const Icon(
                Icons.arrow_forward_ios_sharp,
                color: Color(0xFF1D3A70),
                size: 10,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

