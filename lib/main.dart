import 'package:flutter/material.dart';

void main() => runApp(const LayoutDemoApp());

/// A small demo app showing Container, Padding, margin, Row, Column,
/// OutlinedButton / OutlineInputBorder (the "outline shortcut"), and Expanded.
/// Each example has comments explaining the concept in detail.
class LayoutDemoApp extends StatelessWidget {
  const LayoutDemoApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Layout Demo',
      theme: ThemeData(useMaterial3: true),
      home: const LayoutDemoPage(),
    );
  }
}

class LayoutDemoPage extends StatelessWidget {
  const LayoutDemoPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Layout demo — Container, Padding, Row, Column, Outline, Expanded')),
      body: SingleChildScrollView(
        // Give the whole screen some breathing room.
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          // Column organizes examples vertically.
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              // -------------------------
              // 1) CONTAINER with padding & margin
              // -------------------------
              // Container is a convenience widget that combines
              // painting (color, border), positioning (margin), and sizing.
              // It also supports an internal "padding" property (space between
              // the container's border and its child).
              const Text('1) Container with margin + padding', style: TextStyle(fontWeight: FontWeight.bold)),
              const SizedBox(height: 8),
              Container(
                // margin: space outside the container's border (pushes other widgets away).
                margin: const EdgeInsets.symmetric(vertical: 8.0),
                // padding: space between this container's child and the container edges.
                padding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 16.0),
                decoration: BoxDecoration(
                  color: Colors.blue.shade50,
                  borderRadius: BorderRadius.circular(12.0),
                  // border: visually shows the container boundary.
                  border: Border.all(color: Colors.blueAccent),
                ),
                child: const Text(
                  'This is a Container.\n'
                  '- margin: sets space *outside* the container\n'
                  '- padding: sets space *inside* the container between border and child',
                ),
              ),

              // -------------------------
              // 2) PADDING widget (vs Container.padding)
              // -------------------------
              // Padding is a dedicated widget whose whole job is to add space
              // around its child. Use this when you only need to add spacing.
              const SizedBox(height: 16),
              const Text('2) Padding widget (separate from Container)', style: TextStyle(fontWeight: FontWeight.bold)),
              const SizedBox(height: 8),
              Padding(
                padding: const EdgeInsets.all(12.0),
                child: Container(
                  // This inner container has no padding; the padding is supplied by the Padding widget.
                  padding: EdgeInsets.zero,
                  decoration: BoxDecoration(
                    color: Colors.green.shade50,
                    borderRadius: BorderRadius.circular(8),
                    border: Border.all(color: Colors.green),
                  ),
                  child: const Text(
                    'This uses a Padding widget around a Container.\n'
                    'Padding widget -> adds space around its child (pure layout).',
                  ),
                ),
              ),

              // -------------------------
              // 3) ROW + EXPANDED
              // -------------------------
              // Row lays out children horizontally. Expanded tells a child to
              // take the available remaining space proportionally (using flex).
              const SizedBox(height: 16),
              const Text('3) Row with Expanded children', style: TextStyle(fontWeight: FontWeight.bold)),
              const SizedBox(height: 8),
              Container(
                padding: const EdgeInsets.all(8),
                decoration: BoxDecoration(color: Colors.orange.shade50, borderRadius: BorderRadius.circular(8), border: Border.all(color: Colors.orange)),
                child: Row(
                  children: [
                    // Expanded: this child will expand to fill available horizontal space.
                    // Since we use flex: 2 and flex:1 below, the first takes 2/3 of the row, the second 1/3.
                    Expanded(
                      flex: 2,
                      child: Container(
                        height: 60,
                        alignment: Alignment.center,
                        // padding inside this child container
                        padding: const EdgeInsets.all(8),
                        decoration: BoxDecoration(color: Colors.orange.shade100, borderRadius: BorderRadius.circular(6)),
                        child: const Text(
                          'Expanded(flex:2)\nTakes 2 parts of space',
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ),
                    const SizedBox(width: 8),
                    Expanded(
                      flex: 1,
                      child: Container(
                        height: 60,
                        alignment: Alignment.center,
                        padding: const EdgeInsets.all(8),
                        decoration: BoxDecoration(color: Colors.orange.shade200, borderRadius: BorderRadius.circular(6)),
                        child: const Text(
                          'Expanded(flex:1)\nTakes 1 part of space',
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ),
                  ],
                ),
              ),

              // -------------------------
              // 4) COLUMN with mainAxis/crossAxis alignment
              // -------------------------
              // Column arranges children vertically. You can control vertical/horizontal alignment
              // with mainAxisAlignment and crossAxisAlignment.
              const SizedBox(height: 16),
              const Text('4) Column with alignment', style: TextStyle(fontWeight: FontWeight.bold)),
              const SizedBox(height: 8),
              Container(
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(color: Colors.purple.shade50, borderRadius: BorderRadius.circular(8), border: Border.all(color: Colors.purple)),
                child: Column(
                  // mainAxis = vertical for Column. We put spaceBetween to show alignment control.
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: const [
                    Text('Top-aligned text'),
                    SizedBox(height: 12),
                    Text('Another line (middle)'),
                    SizedBox(height: 12),
                    Text('Bottom-aligned text'),
                  ],
                ),
              ),

              // -------------------------
              // 5) OUTLINE SHORTCUT: OutlinedButton & OutlineInputBorder
              // -------------------------
              // "Outline shortcut" usually refers to quick ways of producing outlined UI:
              // - OutlinedButton: a button with an outline (replacement for old OutlineButton)
              // - OutlineInputBorder: gives a TextField an outlined border
              const SizedBox(height: 16),
              const Text('5) OutlinedButton & OutlineInputBorder (outline shortcut)', style: TextStyle(fontWeight: FontWeight.bold)),
              const SizedBox(height: 8),
              Container(
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(color: Colors.teal.shade50, borderRadius: BorderRadius.circular(8), border: Border.all(color: Colors.teal)),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // OutlinedButton is the recommended "outline" style button.
                    // It's quick: you get a border and a transparent background by default.
                    // You can customize border width/color via styleFrom or ButtonStyle.
                    OutlinedButton(
                      onPressed: () {
                        // This example just prints to the console.
                        // In a real app you'd handle user interaction here.
                        debugPrint('OutlinedButton pressed');
                      },
                      style: OutlinedButton.styleFrom(
                        side: const BorderSide(width: 1.5, color: Colors.teal),
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
                        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                      ),
                      child: const Text('OutlinedButton — a quick outline-style button'),
                    ),
                    const SizedBox(height: 12),

                    // OutlineInputBorder: use this inside a TextField/InputDecoration to get a boxed outline.
                    // This is a very common "outline shortcut" for inputs.
                    TextField(
                      decoration: const InputDecoration(
                        labelText: 'Outlined TextField',
                        hintText: 'Type here...',
                        // OutlineInputBorder gives a visible rectangle border to the input.
                        border: OutlineInputBorder(),
                      ),
                    ),
                  ],
                ),
              ),

              // -------------------------
              // 6) Quick reference: when to use what
              // -------------------------
              const SizedBox(height: 20),
              const Text('Quick reference (short):', style: TextStyle(fontWeight: FontWeight.bold)),
              const SizedBox(height: 8),
              const Text(
                '- Use Container when you need multiple effects together (padding, margin, color, border, rounded corners, size).\n'
                '- Use Padding widget when you only want to add space around a child (cleaner intent).\n'
                '- Use Row for horizontal layout, Column for vertical layout.\n'
                '- Use Expanded inside Row/Column to let a child take the remaining space (flex controls proportions).\n'
                '- Use OutlinedButton for border-style buttons and OutlineInputBorder to give TextFields an outlined style.',
              ),

              const SizedBox(height: 24),
              // footer spacing so bottom padding is visible on small screens
            ],
          ),
        ),
      ),
    );
  }
}
