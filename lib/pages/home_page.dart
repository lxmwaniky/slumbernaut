import 'package:flutter/material.dart';
import 'package:animate_do/animate_do.dart';
import 'package:google_fonts/google_fonts.dart';

class HomePage extends StatefulWidget {
  final String user;

  const HomePage({Key? key, required this.user}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool isSleeping = false;
  DateTime? lastSleepStartTime;
  DateTime? lastSleepEndTime;
  Duration totalSleepDuration = Duration.zero;

  @override
  Widget build(BuildContext context) {
    // Get the current time
    DateTime now = DateTime.now();
    int hour = now.hour;

    // Define greetings based on time of day
    String greeting = '';
    if (hour < 12) {
      greeting = 'Good Morning';
    } else if (hour < 18) {
      greeting = 'Good Afternoon';
    } else {
      greeting = 'Good Evening';
    }

    return Scaffold(
      body: Stack(
        children: [
          Container(
            width: double.infinity,
            padding: EdgeInsets.symmetric(vertical: 30),
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage('lib/assets/images/homepage_background.png'),
                fit: BoxFit.cover,
              ),
            ),
          ),
          SingleChildScrollView(
            // Use SingleChildScrollView to handle overflow
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: 90,
                ),
                Padding(
                  padding: EdgeInsets.all(20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      FadeInLeft(
                        child: Text(
                          '$greeting, ${widget.user}!',
                          style: GoogleFonts.roboto(fontSize: 35, color: Colors.white, fontWeight: FontWeight.bold,),
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      if (totalSleepDuration != Duration.zero)
                        _buildTotalSleepDurationContainer(totalSleepDuration),
                      SizedBox(
                        height: 20,
                      ),
                      _buildSleepButton(
                        text: isSleeping ? 'Awake' : 'Go to Sleep',
                        color: isSleeping ? Colors.green : Colors.orange,
                        onPressed: () {
                          setState(() {
                            if (isSleeping) {
                              // User is waking up
                              lastSleepEndTime = DateTime.now();
                              totalSleepDuration += lastSleepEndTime!.difference(lastSleepStartTime!);
                              lastSleepStartTime = null;
                            } else {
                              // User is going to sleep
                              lastSleepStartTime = DateTime.now();
                            }
                            isSleeping = !isSleeping;
                          });
                        },
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildTotalSleepDurationContainer(Duration duration) {
    int hours = duration.inHours;
    int minutes = duration.inMinutes.remainder(60);
    return Container(
      padding: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(50),
          topRight: Radius.circular(150),
          bottomLeft: Radius.circular(150),
          bottomRight: Radius.circular(50),
        ),
        color: Colors.teal[400],
      ),
      child: Padding(
        padding: const EdgeInsets.all(50),
        child: Column(
          children: [
            Text(
              'Sleep Time',
              style: TextStyle(
                fontSize: 18,
                color: Colors.white,
                fontWeight: FontWeight.bold
              ),
            ),
            const SizedBox(height: 10,),
            Text('$hours H | $minutes M', style: GoogleFonts.roboto(fontSize: 25, color: Colors.white, fontWeight: FontWeight.w900),),
          ],
        ),
      ),
    );
  }

  Widget _buildSleepButton({required String text, required Color color, required VoidCallback onPressed}) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        height: 50,
        width: 150,
        alignment: Alignment.center,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(50),
            topRight: Radius.circular(150),
            bottomLeft: Radius.circular(150),
            bottomRight: Radius.circular(50),
          ),
          color: color,
        ),
        child: Text(
          text,
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
            fontSize: 18,
          ),
        ),
      ),
    );
  }
}
