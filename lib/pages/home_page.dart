import 'package:flutter/material.dart';
import 'package:animate_do/animate_do.dart';

class HomePage extends StatefulWidget {
  final String user;

  const HomePage({Key? key, required this.user}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
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
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 35,
                            color: Colors.white,
                          ),
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
                        text: 'Go to Sleep',
                        onPressed: () {
                          setState(() {
                            lastSleepStartTime = DateTime.now();
                          });
                        },
                      ),
                      SizedBox(height: 10),
                      _buildSleepButton(
                        text: 'Wake Up',
                        onPressed: () {
                          if (lastSleepStartTime != null) {
                            setState(() {
                              lastSleepEndTime = DateTime.now();
                              totalSleepDuration += lastSleepEndTime!.difference(lastSleepStartTime!);
                              lastSleepStartTime = null;
                            });
                          }
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
        borderRadius: BorderRadius.circular(10),
        color: Colors.teal[400],
      ),
      child: Text(
        'Total Sleep Duration: $hours hours and $minutes minutes',
        style: TextStyle(
          fontSize: 18,
          color: Colors.white,
        ),
      ),
    );
  }

  Widget _buildSleepButton({required String text, required VoidCallback onPressed}) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        height: 50,
        width: 150,
        alignment: Alignment.center,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(25),
          color: Colors.orange,
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
