import 'package:flutter/material.dart';

class Billpreview extends StatelessWidget {
  const Billpreview({super.key, required this.bgcolor, required this.myColor});

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
              //  Navigator.push(context, MaterialPageRoute(builder: (context) => Billpreview()));
             },
            color: const Color.fromARGB(255, 154, 3, 180),
            child: Text('next', style: TextStyle(fontSize: 15, color: Colors.white),)),
            SizedBox(width: 10)
        ],
        backgroundColor: Colors.white,
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(25, 10, 25, 0),
          child: Container(
              height: MediaQuery.of(context).size.height * 0.85,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                color: myColor,
            ),
            child: Center(
              child:  Padding(
            padding: const EdgeInsets.fromLTRB(15, 0, 15, 0),
            child:Column(
          children: [
            // Refer and Earn Banner
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Container(
                width: double.infinity,
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(
                  color: bgcolor,
                  borderRadius: BorderRadius.circular(16),
                ),
                child: Row(
                  children: [
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children:  [
                          Text(
                            'Refer and Earn',
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.normal,
                                fontSize: 14),
                          ),
                          SizedBox(height: 4),
                          Text(
                            'Refer a friend and win prizes',
                            style: TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold),
                          ),
                          SizedBox(height: 8),
                          ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.white,
                              padding: EdgeInsets.symmetric(horizontal: 16),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.all(Radius.circular(8)),
                              ),
                            ),
                            onPressed: null,
                            child: Text(
                              'Refer Now',
                              style: TextStyle(
                                  color: Color.fromARGB(255, 255, 255, 255),
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(width: 8),
                    Image.asset(
                      'assets/images/thumbsup.png',
                      height: 101.46,
                      width: 103.11,
                    ),
                  ],
                ),
              ),
            ),

            // Recent List (right screen)
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    "Recents",
                    style: TextStyle(
                        fontWeight: FontWeight.bold, fontSize: 16),
                  ),
                  const SizedBox(height: 10),
                  SizedBox(
                    height: 70,
                    child: ListView(
                      scrollDirection: Axis.horizontal,
                      children: [
                        _buildRecentItem("assets/images/airtel.png", "0909412201"),
                        _buildRecentItem("assets/images/William.png", "Loui William"),
                        _buildRecentItem("assets/images/mtn.png", "0909461201"),
                        _buildRecentItem("assets/images/glo.png", "0908432201"),
                      ],
                    ),
                  )
                ],
              ),
            ),

            const SizedBox(height: 16),

            // Biller Grid
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: const [
                  Text(
                    "Biller List",
                    style: TextStyle(
                        fontWeight: FontWeight.bold, fontSize: 16),
                  ),
                  SizedBox(height: 12),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: GridView.count(
                crossAxisCount: 4,
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                childAspectRatio: 0.8,
                children: [
                  _buildBillerItem("assets/images/Airtime.png", "Airtime"),
                  _buildBillerItem("assets/images/Electricbill.png", "Electric bill"),
                  _buildBillerItem("assets/images/Television.png", "Television"),
                  _buildBillerItem("assets/images/Internet.png", "Internet"),
                  _buildBillerItem("assets/images/Market.png", "Market"),
                  _buildBillerItem("assets/images/Medical.png", "Medical"),
                  _buildBillerItem("assets/images/Television.png", "Television"),
                  _buildBillerItem("assets/images/Waterbill.png", "Waterbill"),
                ],
              ),
            ),
            const SizedBox(height: 30),
          ],
        ),)))))
      );
  }
}

Widget _buildRecentItem(String imagePath, String label) {
    return Padding(
      padding: const EdgeInsets.only(right: 16),
      child: Column(
        children: [
          CircleAvatar(
            radius: 22,
            backgroundImage: AssetImage(imagePath),
          ),
          const SizedBox(height: 6),
          Text(
            label,
            style: const TextStyle(fontSize: 12),
            overflow: TextOverflow.ellipsis,
          )
        ],
      ),
    );
  }

 Widget _buildBillerItem(String imagePath, String label) {
    return Column(
      children: [
        Container(
          height: 48,
          width: 48,
          decoration: BoxDecoration(
            color: Colors.grey.shade200,
            borderRadius: BorderRadius.circular(12),
          ),
          child: Center(
            child: Image.asset(imagePath, width: 28, height: 28),
          ),
        ),
        const SizedBox(height: 6),
        Text(
          label,
          style: const TextStyle(fontSize: 12),
          textAlign: TextAlign.center,
        )
      ],
    );
  }

