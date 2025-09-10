import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_colorpicker/flutter_colorpicker.dart';
// import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_picker/image_picker.dart';

class Regentcanva extends StatefulWidget {
  const Regentcanva({super.key});

  @override
  State<Regentcanva> createState() => _RegentcanvaState();
}

class _RegentcanvaState extends State<Regentcanva> {
  // ignore: unused_field
  int _currentIndex = 0;

  late final List<Widget> _pages = [
    _previewStackContainer1(),
    _previewStackContainer2(),
    _previewStackContainer2(),
    _previewStackContainer2(),
  ];
  // for app logo image changes
  String? _selectedImagePath;
  Future _pickImage() async {
    final imagepicked = await ImagePicker().pickImage(
      source: ImageSource.gallery,
    );
    if (imagepicked == null) return;
    setState(() {
      _selectedImagePath = imagepicked.path;
    });
  }

  // for dashboard panel image change
  String? _selectedBgImagePath;
  Future _pickdashbImage() async {
    final imagepicked = await ImagePicker().pickImage(
      source: ImageSource.gallery,
    );
    if (imagepicked == null) return;
    setState(() {
      _selectedBgImagePath = imagepicked.path;
    });
  }

  final _textEditingController = TextEditingController();
  String appName = 'Input app name';

  Color myColor = Color.fromARGB(255, 255, 247, 234);

  Color appNameColor = const Color.fromARGB(204, 0, 0, 0);

  Color primaryapptheme = Color.fromARGB(255, 250, 182, 144);

  Color homePagebgColor = Color.fromARGB(255, 255, 247, 234);
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
              child: Text(
                'Done',
                style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
              ),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  void _appNameColorPicker() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return CupertinoAlertDialog(
          title: Text('Choose color'),
          content: SingleChildScrollView(
            child: ColorPicker(
              pickerColor: appNameColor,
              onColorChanged: changeAppNameColor,
            ),
          ),
          actions: <Widget>[
            TextButton(
              child: Text(
                'Done',
                style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
              ),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  void _primaryAppTheme() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return CupertinoAlertDialog(
          title: Text('Choose color'),
          content: SingleChildScrollView(
            child: ColorPicker(
              pickerColor: primaryapptheme,
              onColorChanged: changeAppPrimaryTheme,
            ),
          ),
          actions: <Widget>[
            TextButton(
              child: Text(
                'Done',
                style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
              ),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  void _homePagebgcolor() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return CupertinoAlertDialog(
          title: Text('Choose color'),
          content: SingleChildScrollView(
            child: ColorPicker(
              pickerColor: homePagebgColor,
              onColorChanged: changeHomePageBG,
            ),
          ),
          actions: <Widget>[
            TextButton(
              child: Text(
                'Done',
                style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
              ),
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

  void changeAppNameColor(Color color) {
    setState(() {
      appNameColor = color;
    });
  }

  void changeAppPrimaryTheme(Color color) {
    setState(() {
      primaryapptheme = color;
    });
  }

  void changeHomePageBG(Color color) {
    setState(() {
      homePagebgColor = color;
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
                width: MediaQuery.of(context).size.width * 1,
                padding: EdgeInsets.all(16),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Colors.white,
                ),
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 20.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Saved Drafts",
                        style: TextStyle(
                          fontSize: 17,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        "New Project",
                        style: TextStyle(
                          fontSize: 17,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        "Templates",
                        style: TextStyle(
                          fontSize: 17,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        "Updates",
                        style: TextStyle(
                          fontSize: 17,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            );
          },
          child: Icon(Icons.menu, size: 21),
        ),
        title: Text(
          "Canvas",
          style: GoogleFonts.sora(fontSize: 20, fontWeight: FontWeight.bold),
        ),
        actions: [
          DropdownButtonHideUnderline(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: DropdownButton(
                icon: Icon(Icons.more_vert, size: 25, color: Colors.black54),
                borderRadius: BorderRadius.circular(8),
                dropdownColor: Colors.white,
                items: [
                  DropdownMenuItem(value: 'Settings', child: Text('Settings')),
                  DropdownMenuItem(value: 'Info', child: Text('Info')),
                ],
                onChanged: (value) {
                  // Handle dropdown selection
                },
              ),
            ),
          ),
          SizedBox(width: 10),
        ],
      ),

      //body of  app starts here
      body: Column(
        children: [
          Container(
            height: MediaQuery.of(context).size.height * 0.55,
            width: MediaQuery.of(context).size.width * 1,
            decoration: BoxDecoration(
              color: Color.fromARGB(255, 255, 255, 255),
            ),
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 15.0),

              // the  first section containing list of pages to be ediitted
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: [
                  SizedBox(width: 20),

                  //laucher page of application
                  GestureDetector(
                    onTap: () => setState(() => _currentIndex = 0),
                    child: Container(
                      width: 195,
                      height: 351,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(4),
                        color: myColor,
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
                          Text(
                            appName,
                            style: TextStyle(
                              fontSize: 17,
                              color: appNameColor,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(width: 20),

                  // homepage of application
                  GestureDetector(
                    onTap: () => setState(() => _currentIndex = 1),
                    child: Container(
                      width: 195,
                      height: 351,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(4),
                        color: homePagebgColor,
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Row(
                                  children: [
                                    CircleAvatar(
                                      radius: 10,
                                      backgroundColor: Color.fromRGBO(
                                        168,
                                        168,
                                        168,
                                        1,
                                      ),
                                    ),
                                    SizedBox(width: 5),
                                    Text(
                                      'hello User',
                                      style: TextStyle(fontSize: 10),
                                    ),
                                  ],
                                ),
                                Row(
                                  children: [
                                    Container(
                                      padding: EdgeInsets.symmetric(
                                        horizontal: 6,
                                        vertical: 2,
                                      ),
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(20),
                                        border: Border.all(
                                          color: Colors.black,
                                          width: 1,
                                        ),
                                        color: primaryapptheme,
                                      ),
                                      child: Row(
                                        children: [
                                          Icon(Icons.add_circle, size: 8),
                                          SizedBox(width: 4),
                                          Text(
                                            "Add Money",
                                            style: TextStyle(fontSize: 10),
                                          ),
                                        ],
                                      ),
                                    ),
                                    SizedBox(width: 6),
                                    Icon(
                                      Icons.notifications_outlined,
                                      size: 10,
                                    ),
                                  ],
                                ),
                              ],
                            ),
                            SizedBox(height: 6),
                            Stack(
                              clipBehavior: Clip.hardEdge,

                              children: [
                                Container(
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                  child: _selectedBgImagePath == null
                                      ? Image.asset(
                                          'assets/newbg.png',
                                          width: 175,
                                          height: 70,
                                          fit: BoxFit.cover,
                                        )
                                      : Image.file(
                                          File(_selectedBgImagePath!),
                                          width: 175,
                                          height: 70,
                                          fit: BoxFit.cover,
                                        ),
                                ),
                                Container(
                                  width: 175,
                                  height: 70,
                                  padding: EdgeInsets.all(6),
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(8),
                                  ),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        "Account Balance",
                                        style: TextStyle(
                                          fontSize: 10,
                                          color: Colors.white70,
                                        ),
                                      ),
                                      Text(
                                        "₦ 2,554,706",
                                        style: GoogleFonts.lato(
                                          fontSize: 10,
                                          color: Color.fromARGB(
                                            225,
                                            253,
                                            83,
                                            0,
                                          ),
                                        ),
                                      ),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
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
                                              Clipboard.setData(
                                                ClipboardData(
                                                  text: "1100336447",
                                                ),
                                              );
                                            },
                                            child: Row(
                                              children: [
                                                Icon(
                                                  Icons.copy,
                                                  size: 12,
                                                  color: Colors.white,
                                                ),
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
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(height: 6),
                            Text(
                              "Top-up Services",
                              style: TextStyle(fontSize: 10),
                            ),
                            SizedBox(height: 5),
                            SizedBox(
                              width: 175,
                              height: 120, // instead of 200
                              child: GridView.count(
                                crossAxisCount: 4,
                                shrinkWrap: true,
                                physics: NeverScrollableScrollPhysics(),
                                crossAxisSpacing: 6,
                                mainAxisSpacing: 6,
                                childAspectRatio: 0.7,
                                children: [
                                  Icontabs(
                                    icon: Icons.phone_android,
                                    label: 'Airtime',
                                    themecolor: primaryapptheme,
                                  ),
                                  Icontabs(
                                    icon: Icons.wifi,
                                    label: 'data',
                                    themecolor: primaryapptheme,
                                  ),
                                  Icontabs(
                                    icon: Icons.bolt,
                                    label: 'electric',
                                    themecolor: primaryapptheme,
                                  ),
                                  Icontabs(
                                    icon: Icons.tv,
                                    label: 'Cable',
                                    themecolor: primaryapptheme,
                                  ),
                                  Icontabs(
                                    icon: Icons.sports_soccer,
                                    label: 'Betting',
                                    themecolor: primaryapptheme,
                                  ),
                                  Icontabs(
                                    icon: Icons.flight,
                                    label: 'Flight',
                                    themecolor: primaryapptheme,
                                  ),
                                  Icontabs(
                                    icon: Icons.shopping_cart,
                                    label: 'Shop',
                                    themecolor: primaryapptheme,
                                  ),
                                  Icontabs(
                                    icon: Icons.generating_tokens,
                                    label: 'Results',
                                    themecolor: primaryapptheme,
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(height: 3),
                            Text(
                              "Advertisements",
                              style: TextStyle(fontSize: 10),
                            ),
                            SizedBox(height: 5),
                            Expanded(
                              child: ListView(
                                scrollDirection: Axis.horizontal,
                                children: [
                                  Container(
                                    width: 175,
                                    height: 80,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(8),
                                      image: DecorationImage(
                                        image: AssetImage('assets/ads1.png'),
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                  ),
                                  SizedBox(width: 10),
                                  Container(
                                    width: 175,
                                    height: 80,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(8),
                                      image: DecorationImage(
                                        image: AssetImage('assets/ads2.png'),
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(height: 5),
                            Container(
                              width: double.infinity,
                              height: 20,
                              color: primaryapptheme,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  SizedBox(width: 20),

                  // finances page of application
                  GestureDetector(
                    onTap: () => setState(() => _currentIndex = 2),
                    child: Container(
                      width: 195,
                      height: 351,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(4),
                        color: homePagebgColor,
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          children: [
                            Container(
                              width: 175,
                              height: 50,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(8),
                                color: primaryapptheme,
                              ),
                              child: Padding(
                                padding: const EdgeInsets.all(12.0),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          'Solomon',
                                          style: TextStyle(
                                            fontSize: 10,
                                            fontWeight: FontWeight.w400,
                                          ),
                                        ),
                                        Text(
                                          'Prepaid- 5235829243',
                                          style: TextStyle(
                                            fontSize: 8,
                                            fontWeight: FontWeight.w200,
                                          ),
                                        ),
                                      ],
                                    ),
                                    Text(
                                      'Manage account',
                                      style: TextStyle(
                                        fontSize: 6,
                                        fontWeight: FontWeight.w200,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            SizedBox(height: 5,),
                            Padding(
                              padding: const EdgeInsets.symmetric(vertical: 8.0),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Usageinfo(amount: '20,000.00', rating: 'Kes', servicetype: 'Airtime',),
                                  Usageinfo(amount: '4000', rating: 'Mms', servicetype: 'Voice Bundle',),
                                  Usageinfo(amount: '2,903.00', rating: 'Mb', servicetype: 'Data Bundle',),
                                ],
                              ),
                            ),
                            SizedBox(height:6),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Container(
                                          padding: EdgeInsets.symmetric(
                                            horizontal: 10,
                                            vertical: 5,
                                          ),
                                          decoration: BoxDecoration(
                                            borderRadius: BorderRadius.circular(5),
                                            border: Border.all(
                                              color: Colors.black,
                                              width: 1,
                                            ),
                                            color: primaryapptheme,
                                          ),
                                          child: Text(
                                            "History",
                                            style: TextStyle(fontSize: 10),
                                          ),
                                        ),
                                        SizedBox(width:10),
                                Container(
                                          padding: EdgeInsets.symmetric(
                                            horizontal: 10,
                                            vertical: 5,
                                          ),
                                          decoration: BoxDecoration(
                                            borderRadius: BorderRadius.circular(5),
                                            border: Border.all(
                                              color: Colors.black,
                                              width: 1,
                                            ),
                                            color: primaryapptheme,
                                          ),
                                          child: Text(
                                            "Schedule payments",
                                            style: TextStyle(fontSize: 10),
                                          ),
                                        ),
                              ],
                            ),
                            Padding(
                              padding: const EdgeInsets.symmetric(vertical:8.0),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Text(
                                    "Recent Transactions",
                                    style: TextStyle(fontSize: 10),
                                  ),
                                ],
                              ),
                            ),
                            Expanded(
                  child: ListView.builder(
                    itemCount: 5,
                    itemBuilder: (BuildContext context, int index) {
                      return Padding(
                        padding: const EdgeInsets.all(2.0),
                        child: Container(
                            padding: EdgeInsets.all(4),
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(5),
                              border: Border.all(color: Colors.black12, width:1)
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
                      ),
                    ),
                  ),
                  SizedBox(width: 20),

                  // settings page of application
                  GestureDetector(
                    onTap: () => setState(() => _currentIndex = 3),
                    child: Container(
                      width: 195,
                      height: 351,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(4),
                        color: homePagebgColor,
                      ),
                      child:Padding(
                        padding: const EdgeInsets.all(8.0),
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
                      ),
                    ),
                  ),
                  SizedBox(width: 20),
                ],
              ),
            ),
          ),

          // pages editable section
          Expanded(
            // height: MediaQuery.of(context).size.height*0.5,
            child: IndexedStack(index: _currentIndex, children: _pages),
          ),
        ],
      ),
    );
  }

  Widget _previewStackContainer1() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
      child: ListView(
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'App Name',
                style: TextStyle(fontWeight: FontWeight.w600, fontSize: 13),
              ),
            ],
          ),
          SizedBox(height: 6),
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Expanded(
                child: Container(
                  height: 47,
                  color: const Color.fromRGBO(245, 245, 245, 1),
                  child: TextField(
                    controller: _textEditingController,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(borderSide: BorderSide.none),
                      suffixIcon: IconButton(
                        onPressed: () {
                          _textEditingController.clear();
                        },
                        icon: Icon(Icons.clear),
                      ),
                      hintText: '',
                    ),
                    style: GoogleFonts.lato(fontSize: 14),
                  ),
                ),
              ),
              SizedBox(width: 8),
              MaterialButton(
                onPressed: () {
                  setState(() {
                    appName = _textEditingController.text;
                  });
                },
                color: Color.fromRGBO(108, 0, 144, 1),
                child: Text(
                  'add',
                  style: TextStyle(color: Colors.white, fontSize: 14),
                ),
              ),
            ],
          ),
          SizedBox(height: 6),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'App Logo',
                style: TextStyle(fontWeight: FontWeight.w600, fontSize: 13),
              ),
            ],
          ),
          GestureDetector(
            onTap: _pickImage,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const Icon(
                      Icons.add_photo_alternate,
                      color: Color.fromARGB(115, 7, 7, 7),
                      size: 20,
                    ),
                    const SizedBox(width: 6),
                    Text(
                      'Add media file',
                      style: GoogleFonts.lato(fontSize: 14),
                    ),
                  ],
                ),
                IconButton(
                  icon: Icon(Icons.add_circle),
                  color: Color.fromARGB(160, 8, 8, 8),
                  onPressed: () {
                    _pickImage();
                  },
                ),
              ],
            ),
          ),
          SizedBox(height: 4),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'App Name color',
                style: TextStyle(fontWeight: FontWeight.w600, fontSize: 13),
              ),
            ],
          ),
          SizedBox(height: 6),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('select Text color', style: GoogleFonts.lato(fontSize: 14)),
              GestureDetector(
                onTap: _appNameColorPicker,
                child: Container(
                  width: 20,
                  height: 20,
                  decoration: BoxDecoration(
                    color: appNameColor,
                    borderRadius: BorderRadius.circular(40),
                    border: Border.all(color: Colors.black, width: 1),
                  ),
                ),
              ),
            ],
          ),
          SizedBox(height: 6),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Background color',
                style: TextStyle(fontWeight: FontWeight.w600, fontSize: 13),
              ),
            ],
          ),
          SizedBox(height: 4),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('select background', style: GoogleFonts.lato(fontSize: 14)),
              GestureDetector(
                onTap: _showColorPicker,
                child: Container(
                  width: 20,
                  height: 20,
                  decoration: BoxDecoration(
                    color: myColor,
                    borderRadius: BorderRadius.circular(40),
                    border: Border.all(color: Colors.black, width: 1),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _previewStackContainer2() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
      child: ListView(
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Info Panel Image',
                style: TextStyle(fontWeight: FontWeight.w600, fontSize: 13),
              ),
            ],
          ),
          SizedBox(height: 4),
          GestureDetector(
            onTap: _pickdashbImage,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const Icon(
                      Icons.add_photo_alternate,
                      color: Color.fromARGB(115, 7, 7, 7),
                      size: 20,
                    ),
                    const SizedBox(width: 6),
                    Text(
                      'Tap to change image',
                      style: GoogleFonts.lato(fontSize: 14),
                    ),
                  ],
                ),
                IconButton(
                  icon: Icon(Icons.add_circle),
                  color: Color.fromARGB(160, 8, 8, 8),
                  onPressed: () {
                    _pickdashbImage();
                  },
                ),
              ],
            ),
          ),
          SizedBox(height: 4),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Primary App Theme',
                style: TextStyle(fontWeight: FontWeight.w600, fontSize: 13),
              ),
            ],
          ),
          SizedBox(height: 6),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'select primary color for app widget',
                style: GoogleFonts.lato(fontSize: 14),
              ),
              GestureDetector(
                onTap: _primaryAppTheme,
                child: Container(
                  width: 20,
                  height: 20,
                  decoration: BoxDecoration(
                    color: primaryapptheme,
                    borderRadius: BorderRadius.circular(40),
                    border: Border.all(color: Colors.black, width: 1),
                  ),
                ),
              ),
            ],
          ),
          SizedBox(height: 6),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Background color',
                style: TextStyle(fontWeight: FontWeight.w600, fontSize: 13),
              ),
            ],
          ),
          SizedBox(height: 4),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('select background', style: GoogleFonts.lato(fontSize: 14)),
              GestureDetector(
                onTap: _homePagebgcolor,
                child: Container(
                  width: 20,
                  height: 20,
                  decoration: BoxDecoration(
                    color: homePagebgColor,
                    borderRadius: BorderRadius.circular(40),
                    border: Border.all(color: Colors.black, width: 1),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  // Widget _previewStackContainer2() {
  // }
}

class Icontabs extends StatelessWidget {
  const Icontabs({
    super.key,
    required this.icon,
    required this.label,
    required this.themecolor,
  });
  final IconData icon;
  final Color themecolor;
  final String label;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Container(
          width: 30,
          height: 30,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(6),
            border: Border.all(color: Colors.black12, width: 1),
            color: themecolor,
          ),
          child: Center(child: Icon(icon, size: 10)),
        ),
        SizedBox(height: 4),
        Text(
          label,
          textAlign: TextAlign.center,
          maxLines: 2,
          overflow: TextOverflow.ellipsis,
          style: TextStyle(
            color: Color.fromRGBO(62, 62, 62, 1),
            fontSize: 10,
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
    );
  }
}

class Usageinfo extends StatelessWidget {
  const Usageinfo({super.key, required this.amount, required this.rating, required this.servicetype});
  final String servicetype;
  final String rating;
  final String amount;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          amount,
          style: TextStyle(fontSize: 8, fontWeight: FontWeight.w600),
        ),
        SizedBox(height: 2),
        Text(
          rating,
          style: TextStyle(fontSize: 8, fontWeight: FontWeight.w600, color: Colors.red),
        ),
        SizedBox(height: 2),
        Text(
          servicetype,
          style: TextStyle(fontSize: 8, fontWeight: FontWeight.w600),
        ),
      ],
    );
  }
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
          height: 30,
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