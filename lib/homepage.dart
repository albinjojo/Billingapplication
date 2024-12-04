import 'package:flutter/material.dart';
import 'taxibill.dart'; // Imported the TaxiBillScreen
import 'createbill.dart'; // Imported the CreateBillScreen
import 'diary.dart'; // Imported the DiaryScreen
import 'previousbill.dart'; // Imported the PreviousBillScreen

void main() {
  runApp(MaterialApp(
    home: DashboardScreen(),
    debugShowCheckedModeBanner: false,
  ));
}

class DashboardScreen extends StatelessWidget {
  DashboardScreen({super.key});

  final List<Map<String, String>> items = [
    {"title": "Create Bill", "caption": "Generate a new bill for services."},
    {"title": "Taxi Bill", "caption": "Create and manage taxi-related bills."},
    {
      "title": "Previous Bills",
      "caption": "View and manage previously created bills."
    },
    {
      "title": "Diary",
      "caption": "Keep track of travel logs and important notes."
    },
    {"title": "Settings", "caption": "Adjust app settings and preferences."},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: const Text(
          'Alphonsa Tours and Travels',
          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.bold,
            fontSize: 22,
          ),
        ),
        centerTitle: true,
        actions: [
          IconButton(
            icon: const Icon(Icons.settings, color: Colors.black),
            onPressed: () {},
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView.builder(
          itemCount: items.length,
          itemBuilder: (context, index) {
            final item = items[index];
            return Padding(
              padding: const EdgeInsets.only(bottom: 24.0),
              child: GestureDetector(
                onTap: () {
                  if (item["title"] == "Taxi Bill") {
                    // Navigate to TaxiBillScreen
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => TaxiBillScreen()),
                    );
                  } else if (item["title"] == "Create Bill") {
                    // Navigate to CreateBillScreen
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => CreateBillScreen()),
                    );
                  } else if (item["title"] == "Previous Bills") {
                    // Navigate to PreviousBillScreen
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const PreviousBillScreen()),
                    );
                  } else if (item["title"] == "Settings") {
                    // Implement functionality for Settings
                  } else if (item["title"] == "Diary") {
                    // Navigate to DiaryScreen
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => DiaryScreen()),
                    );
                  }
                },
                child: Container(
                  decoration: BoxDecoration(
                    gradient: const LinearGradient(
                      colors: [
                        Color.fromARGB(255, 250, 155, 118),
                        Colors.orangeAccent
                      ],
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                    ),
                    borderRadius: BorderRadius.circular(24.0),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.1),
                        spreadRadius: 4,
                        blurRadius: 10,
                        offset: const Offset(0, 4),
                      ),
                    ],
                  ),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                        vertical: 20.0, horizontal: 16.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              item["title"]!,
                              style: const TextStyle(
                                fontSize: 22.0,
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(
                            height: 8.0), // Space between title and caption
                        Text(
                          item["caption"]!,
                          style: TextStyle(
                            fontSize: 14.0,
                            color: Colors.white.withOpacity(0.7),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
