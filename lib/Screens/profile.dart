import 'package:flutter/material.dart';
import '../data/courses_json.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  ProfileScreenState createState() => ProfileScreenState();
}

class ProfileScreenState extends State<ProfileScreen> {
  final String _name = "Asaad Falah Rasul";
  final String _major = "Software Engineering";
  int _currentCourses = 0;
  int _credits = 0;
  int _semester = 0;
  bool _popUpNotificationEnabled = true;

  @override
  void initState() {
    super.initState();
    _calculateCourseData();
  }

  void _calculateCourseData() {
    for (var course in mycourses) {
      _credits += int.parse(course['credits']);
      if (course['semester'] == '4') {
        _currentCourses++;
      }
      if (int.parse(course['semester']) > _semester) {
        _semester = int.parse(course['semester']);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Profile'),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(height: 20.0),
            Row(
              children: [
                const SizedBox(width: 20.0),
                const CircleAvatar(
                  radius: 50.0,
                  backgroundImage: AssetImage('images/user_profile.png'),
                ),
                const SizedBox(width: 20.0),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      _name,
                      style: const TextStyle(
                        fontSize: 20.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 5.0),
                    Text(
                      _major,
                      style: const TextStyle(
                        fontSize: 16.0,
                      ),
                    ),
                  ],
                ),
              ],
            ),
            const SizedBox(height: 20.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                _buildCourseDataBox("Courses", _currentCourses.toString()),
                _buildCourseDataBox("Credits", _credits.toString()),
                _buildCourseDataBox("Semester", _semester.toString()),
              ],
            ),
            const SizedBox(height: 20.0),
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 20.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  _buildCategoryHeader("Account info"),
                  _buildOption("Personal info", Icons.person),
                  _buildOption("Achievements", Icons.emoji_events),
                  _buildOption("Activities", Icons.sports_basketball),
                  _buildOption("Progress", Icons.show_chart),
                  _buildCategoryHeader("Notification"),
                  _buildOptionWithToggle(
                      "Pop-up notification", Icons.notifications),
                  _buildCategoryHeader("Other"),
                  _buildOption("Contact us", Icons.contact_mail),
                  _buildOption("Privacy policy", Icons.privacy_tip),
                  _buildOption("Settings", Icons.settings),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildCategoryHeader(String label) {
    return Container(
      margin: const EdgeInsets.only(top: 20.0),
      child: Text(
        label,
        style: const TextStyle(
          fontSize: 18.0,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }

  Widget _buildOption(String label, IconData iconData) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 10.0),
      child: Row(
        children: [
          Icon(
            iconData,
            color: Colors.grey,
          ),
          const SizedBox(width: 10.0),
          Text(
            label,
            style: const TextStyle(
              fontSize: 16.0,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildCourseDataBox(String label, String value) {
    return Container(
      width: 80.0,
      height: 80.0,
      decoration: BoxDecoration(
        color: Colors.green,
        border: Border.all(
          color: Colors.green,
          width: 2.0,
        ),
        borderRadius: BorderRadius.circular(10.0),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            label,
            style: const TextStyle(
              fontSize: 14.0,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
          const SizedBox(height: 5.0),
          Text(
            value,
            style: const TextStyle(
              fontSize: 20.0,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
        ],
      ),
    );
  }


  Widget _buildOptionWithToggle(String label, IconData iconData) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 10.0),
      child: Row(
        children: [
          Icon(
            iconData,
            color: Colors.grey,
          ),
          const SizedBox(width: 10.0),
          Expanded(
            child: Text(
              label,
              style: const TextStyle(
                fontSize: 16.0,
              ),
            ),
          ),
          Switch(
            value: _popUpNotificationEnabled,
            onChanged: (value) {
              setState(() {
                _popUpNotificationEnabled = value;
              });
            },
          ),
        ],
      ),
    );
  }
}
