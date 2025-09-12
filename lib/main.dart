import 'package:flutter/material.dart';

void main() {
  runApp(const LayoutDemoApp());
}

class LayoutDemoApp extends StatelessWidget {
  const LayoutDemoApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const LayoutDemoPage(),
    );
  }
}

class LayoutDemoPage extends StatelessWidget {
  const LayoutDemoPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          
          Container(
            margin: const EdgeInsets.all(16.0),
            padding: const EdgeInsets.all(12.0),
            decoration: BoxDecoration(
              color: Colors.blue[300],
              borderRadius: BorderRadius.circular(12),
            ),
            child: const Center(
              child: Text(
                "Welcome to the Layout Demo!",
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
            ),
          ),

          
          Expanded(
            child: Row(
              children: [
                Expanded(
                  flex: 1,
                  child: Container(
                    color: Colors.red,
                    child: const Center(
                      child: Text(
                        "Left",
                        style: TextStyle(color: Colors.white, fontSize: 18),
                      ),
                    ),
                  ),
                ),
                Expanded(
                  flex: 2,
                  child: Container(
                    color: Colors.green,
                    child: const Center(
                      child: Text(
                        "Center",
                        style: TextStyle(color: Colors.white, fontSize: 18),
                      ),
                    ),
                  ),
                ),
                Expanded(
                  flex: 1,
                  child: Container(
                    color: Colors.orange,
                    child: const Center(
                      child: Text(
                        "Right",
                        style: TextStyle(color: Colors.white, fontSize: 18),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),

       
          Expanded(
            child: Column(
              children: [
                Expanded(
                  flex: 1,
                  child: Container(
                    color: Colors.purple,
                    child: const Center(
                      child: Text(
                        "Top Box",
                        style: TextStyle(color: Colors.white, fontSize: 18),
                      ),
                    ),
                  ),
                ),
                Expanded(
                  flex: 2,
                  child: Container(
                    color: Colors.teal,
                    child: const Center(
                      child: Text(
                        "Bottom Box",
                        style: TextStyle(color: Colors.white, fontSize: 18),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
