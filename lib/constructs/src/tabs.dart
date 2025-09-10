import 'package:flutter/material.dart';
import 'package:newregentspace/constructs/morepage.dart';

class Regentspacenewcanvas extends StatefulWidget {
  const Regentspacenewcanvas({super.key});

  @override
  State<Regentspacenewcanvas> createState() => _RegentspacenewcanvasState();
}

class _RegentspacenewcanvasState extends State<Regentspacenewcanvas> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,

      initialIndex: 1,
      child: Scaffold(
        appBar: AppBar(
          title: Text('Regentspace New Canvas'),
          bottom: TabBar(
            tabs: [
              Tab(child: _previewStackContainer1()),
              Tab(text: 'Tab 2'),
              Tab(text: 'Tab 3'),
            ],
          ),
        ),
        body: TabBarView(
          children: [
            Center(child: Text('Content for Tab 1')),
            Center(child: Text('Content for Tab 2')),
            Center(child: Text('Content for Tab 3')),
          ],
        ),
        bottomNavigationBar: Container(
          padding: EdgeInsets.all(10),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              ProfileOptionTile(
                title: 'Settings',
                leading: Icon(Icons.settings_rounded),
                onTap: () {},
              ),
              SizedBox(height: 10),
            ],
          ),
        ),
      ),
    );
  }
}

  Widget _previewStackContainer1() {
    return Container(
      height: 200,
      width: 180,
      decoration: BoxDecoration(
        color: Colors.grey[100],
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Icon(Icons.image_outlined, size: 50, color: const Color.fromARGB(255, 78, 78, 78)),
          Text('App Logo', style: TextStyle(fontSize: 20, color: Colors.blue, fontWeight: FontWeight.bold))
        ],
      ) ,
    );
  }