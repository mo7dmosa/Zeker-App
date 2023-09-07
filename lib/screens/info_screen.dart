import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class InfoScreen extends StatelessWidget {
  InfoScreen({Key? key}) : super(key: key);

  String? _message;

  @override
  Widget build(BuildContext context) {
    ModalRoute? modalRoute = ModalRoute.of(context);
    if(modalRoute != null) {
      Map<String, dynamic> data = modalRoute.settings.arguments as Map<String, dynamic>;
      if(data.containsKey('message')){
        _message = data['message'];
      }
    }
    return Scaffold(
      appBar: AppBar(
        title: Text('عن التطبيق'),
      ),
      body: Center(
        child: Text(
          _message ?? 'Message',
          style: GoogleFonts.cairo(
            color: Colors.black,
          ),
        ),
      ),
    );
  }
}
