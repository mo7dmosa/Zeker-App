import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:zeker/screens/about_screen.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int _counter = 0;
  String _content = 'أستغفر الله';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        automaticallyImplyLeading: true,
        centerTitle: true,
        actionsIconTheme: const IconThemeData(color: Colors.black),
        title: Text(
          'مسبحة الأذكار',
          style: GoogleFonts.cairo(
            fontWeight: FontWeight.bold,
            color: Colors.black,
          ),
        ),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.pushNamed(context, '/info_screen',
                  arguments: {'message': 'تطبيق مسبحة الأذكار'});
            },
            icon: Icon(Icons.info),
          ),
          IconButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => AboutScreen(message: 'About Message'),
                ),
              );
            },
            icon: Icon(Icons.question_answer),
          ),
          PopupMenuButton<String>(
            onSelected: (String value) {
              if (value != _content) {
                setState(() {
                  _content = value;
                  _counter = 0;
                });
              }
            },
            itemBuilder: (context) {
              return [
                PopupMenuItem(
                  value: 'أستغفر الله',
                  height: 30,
                  child: Text(
                    'أستغفر الله',
                    style: GoogleFonts.cairo(fontSize: 14),
                  ),
                ),
                const PopupMenuDivider(),
                PopupMenuItem(
                  value: 'الحمد لله',
                  height: 30,
                  child: Text(
                    'الحمد لله',
                    style: GoogleFonts.cairo(fontSize: 14),
                  ),
                ),
                const PopupMenuDivider(),
                PopupMenuItem(
                  value: 'سبحان الله',
                  height: 30,
                  child: Text(
                    'سبحان الله',
                    style: GoogleFonts.cairo(fontSize: 14),
                  ),
                ),
              ];
            },
          )
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          setState(() => _counter += 1);
        },
        backgroundColor: const Color(0xFF774360),
        child: const Icon(Icons.add),
      ),
      body: DecoratedBox(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: AlignmentDirectional.topStart,
            end: AlignmentDirectional.bottomEnd,
            colors: [
              Color(0xFFF7E9D7),
              Color(0xFFEBD8C3),
            ],
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // const CircleAvatar(
              //   radius: 40,
              //   backgroundImage: AssetImage('images/image_1.jpeg'),
              // ),
              Container(
                // clipBehavior: Clip.antiAlias,
                width: 80,
                height: 80,
                decoration: const BoxDecoration(
                  color: Colors.white,
                  // borderRadius: BorderRadius.circular(40)
                  shape: BoxShape.circle,
                  image: DecorationImage(
                    image: AssetImage('images/image_1.jpeg'),
                    fit: BoxFit.cover,
                  ),
                  boxShadow: [
                    BoxShadow(
                      offset: Offset(0, 0),
                      color: Colors.black45,
                      blurRadius: 6,
                    )
                  ],
                ),
                // child: Image.asset(
                //   'images/image_1.jpeg',
                //   fit: BoxFit.cover,
                // ),
              ),
              const SizedBox(height: 20),
              Card(
                margin: const EdgeInsets.only(bottom: 20),
                clipBehavior: Clip.antiAlias,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Row(
                  children: [
                    Expanded(
                      child: Text(
                        _content,
                        textAlign: TextAlign.center,
                        style: GoogleFonts.arefRuqaa(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    Container(
                      height: 50,
                      width: 50,
                      alignment: Alignment.center,
                      decoration: const BoxDecoration(color: Color(0xFFE7AB79)),
                      child: Text(
                        '$_counter',
                        style: GoogleFonts.cairo(
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                          color: Colors.black,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Row(
                children: [
                  Expanded(
                    flex: 2,
                    child: ElevatedButton(
                      onPressed: () {
                        // _counter += 1;
                        setState(() {
                          ++_counter;
                        });
                      },
                      style: ElevatedButton.styleFrom(
                        primary: const Color(0xFF4C3A51),
                        minimumSize: const Size(0, 45),
                        shape: const RoundedRectangleBorder(
                          borderRadius: BorderRadiusDirectional.only(
                            topStart: Radius.circular(15),
                            bottomStart: Radius.circular(5),
                          ),
                        ),
                      ),
                      child: Text(
                        'تسبيح',
                        style: GoogleFonts.cairo(
                          fontWeight: FontWeight.bold,
                          fontSize: 14,
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    child: ElevatedButton(
                      onPressed: () {
                        setState(() => _counter = 0);
                      },
                      style: ElevatedButton.styleFrom(
                        primary: const Color(0xFFB25068),
                        minimumSize: const Size(0, 45),
                        shape: const RoundedRectangleBorder(
                          borderRadius: BorderRadiusDirectional.only(
                            bottomEnd: Radius.circular(15),
                            topEnd: Radius.circular(5),
                          ),
                        ),
                      ),
                      child: Text(
                        'إعادة',
                        style: GoogleFonts.cairo(
                          fontWeight: FontWeight.bold,
                          fontSize: 14,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
