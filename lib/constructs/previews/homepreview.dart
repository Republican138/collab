import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:newregentspace/constructs/homeowetransactionless.dart';
import 'package:newregentspace/constructs/previews/billpreview.dart';

class Homepreview extends StatelessWidget {
  const Homepreview({super.key, required this.bgcolor, required this.myColor});

  final Color bgcolor;
  final Color myColor;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 255, 255, 255),
      appBar: AppBar(
        automaticallyImplyLeading: false,
        leading: IconButton(onPressed: (){
          Navigator.pop(context);
        }, icon: Icon(Icons.arrow_back_ios, size: 17)),
        title: Text(
          "Preview",
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
        actions: [
          MaterialButton(
            onPressed: () { 
               Navigator.push(context, MaterialPageRoute(builder: (context) => Billpreview(bgcolor: bgcolor,myColor: myColor,)));
             },
            color: const Color.fromARGB(255, 154, 3, 180),
            child: Text('next', style: TextStyle(fontSize: 15, color: Colors.white),)),
            SizedBox(width: 10)
        ],
        backgroundColor: Colors.white,
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(23, 10, 23, 0),
          child: Container(
              height: MediaQuery.of(context).size.height * 0.85,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                color: myColor,
            ),
            child: Center(
              child:  Padding(
            padding: const EdgeInsets.fromLTRB(23, 5, 23, 0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Header
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Hi, User 👋🏿",
                      style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                    TextButton(
                      onPressed: () {
                        // Navigator.push(
                        //   context,
                        //   MaterialPageRoute(builder: (context) => const AddMoneyPage()),
                        // );
                      },
                      style: TextButton.styleFrom(
                        foregroundColor: Colors.blue,
                      ),
                      child: Row(
                        children: const [
                          Text("Add Money"),
                          SizedBox(width: 6),
                          Icon(
                            Icons.add_circle,
                            color: Color.fromRGBO(29, 58, 112, 1),
                          ),
                        ],
                      ),
                    ),
            
                  ],
                ),
            
                SizedBox(height: 16),
            
                // Balance Card
                Container(
                  width: double.infinity,
                  height: 141,
                  padding: EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    color: bgcolor,
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Center(
                        child: Text(
                          "Account Balance",
                          style: GoogleFonts.lato(
                            fontSize: 16,
                            color: Colors.white70,
                          ),
                        ),
                      ),
                      SizedBox(height: 10),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Center(
                            child: Text(
                              "₦ 2,554,706",
                              style: GoogleFonts.lato(
                                fontSize: 27,
                                color: Colors.white,
                              ),
                            ),
                          ),
                          
                        ],
                      ),
                      SizedBox(height: 10),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "Moniepoint",
                            style: GoogleFonts.lato(
                              color: Colors.white,
                              fontSize: 16.5,
                            ),
                          ),
                          SizedBox(width: 10),
                          GestureDetector(
                            onTap: () {
                              Clipboard.setData(ClipboardData(text: "1100336447"));
                            },
                            child: Row(
                              children: [
                                Icon(Icons.copy, size: 16, color: Colors.white),
                                SizedBox(width: 4),
                                Text(
                                  "1100336447",
                                  style: GoogleFonts.lato(
                                    color: Colors.white,
                                    fontSize: 16.5,
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
            
                SizedBox(height: 24),
            
                // Services
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    serviceButton("assets/images/phone.png", "Airtime", () {
                      
                    }),
                    serviceButton("assets/images/wifi.png", "Data", () {
                      
                    }),
                    serviceButton("assets/images/tv.png", "Cable TV", () {
                      
                    }),
            
                    serviceButton("assets/images/bulb.png", "Electricity", () {
                      
                    }),
                  ],
                ),
            
            
                SizedBox(height: 24),
            
                // Recent Transactions
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Recent Transactions",
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    Text(
                      "See all",
                      style: TextStyle(
                        fontSize: 14,
                        color: Colors.black,
                        fontWeight: FontWeight.w500,
                      ),
                    )
                  ],
                ),
            
                SizedBox(height: 8),
                Row(
                  children: [
                    Icon(Icons.access_time_filled,
                        size: 16, color: Colors.grey[600]),
                    SizedBox(width: 6),
                    Text(
                      "Today",
                      style: TextStyle(color: Colors.grey[600]),
                    ),
                  ],
                ),
                SizedBox(height: 8),
            
                // Transactions List (scrollable only for this section)
                Flexible(
                  child: ListView(
                    padding: EdgeInsets.zero,
                    shrinkWrap: true,
                    children: [
                      transactionTile(
                        title: "Loan Repayment",
                        time: "10:30pm",
                        amount: "-₦ 1,800,400",
                        isDebit: true,
                        imagePath: "assets/images/loan.png",
                      ),
                      transactionTile(
                        title: "Wallet Top Up",
                        time: "5:45pm",
                        amount: "+₦ 2,500",
                        isDebit: false,
                        imagePath: "assets/images/topup.png",
                      ),
                      transactionTile(
                        title: "Victor Isaac",
                        time: "10:45pm",
                        amount: "+₦ 800,000",
                        isDebit: false,
                        imagePath: "assets/images/vi.png",
                      ),
                    ],
                  ),
                ),
            
              ],
                  ),
                ),
            ),
          )
        ),
      ),
    );
  }
}

Widget transactionTile({
    required String title,
    required String time,
    required String amount,
    required bool isDebit,
    required String imagePath,
  }) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 6),
      padding: EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
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
            width: 40,
            height: 40,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              color: Colors.grey[100],
            ),
            child: Padding(
              padding: const EdgeInsets.all(6.0),
              child: Image.asset(
                imagePath,
                fit: BoxFit.contain,
              ),
            ),
          ),

          SizedBox(width: 12),

          // Title and Time
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                SizedBox(height: 4),
                Text(
                  time,
                  style: TextStyle(
                    fontSize: 12,
                    color: Colors.grey[600],
                  ),
                ),
              ],
            ),
          ),

          // Amount
          Text(
            amount,
            style: TextStyle(
              fontSize: 16,
              color: isDebit ? Colors.red : Colors.green,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }
