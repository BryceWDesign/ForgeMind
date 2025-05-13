import 'package:flutter/material.dart';

void main() => runApp(ForgeMindApp());

class ForgeMindApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'ForgeMind',
      theme: ThemeData.dark(),
      home: ForgeMindHome(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class ForgeMindHome extends StatefulWidget {
  @override
  _ForgeMindHomeState createState() => _ForgeMindHomeState();
}

class _ForgeMindHomeState extends State<ForgeMindHome> {
  final _controller = TextEditingController();
  String _output = '';

  void _generateCode() {
    setState(() {
      _output = "// [Mocked] Code generation output for:\n\n${_controller.text}";
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('ForgeMind')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: _controller,
              decoration: InputDecoration(
                hintText: 'Describe the code you want...',
                border: OutlineInputBorder(),
              ),
              minLines: 3,
              maxLines: 5,
            ),
            SizedBox(height: 12),
            ElevatedButton(
              onPressed: _generateCode,
              child: Text('Generate Offline Code'),
            ),
            SizedBox(height: 16),
            Expanded(
              child: SingleChildScrollView(
                child: Text(
                  _output,
                  style: TextStyle(fontFamily: 'monospace'),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
