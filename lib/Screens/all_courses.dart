import 'package:flutter/material.dart';
import '../data/courses_json.dart';

class AllCourses extends StatefulWidget {
  const AllCourses({Key? key}) : super(key: key);

  @override
  _AllCoursesState createState() => _AllCoursesState();
}

class _AllCoursesState extends State<AllCourses> {
  String _filterCategory = 'All';

  @override
  Widget build(BuildContext context) {
    const List<dynamic> myCourses = mycourses;

    List filteredCourses = courses.where((course) {
      if (_filterCategory == 'All') {
        return true;
      } else {
        return course['category'] == _filterCategory[0];
      }
    }).toList();

    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: SizedBox(
          width: double.infinity,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 165),
                child: DropdownButton<String>(
                  value: _filterCategory,
                  onChanged: (String? newValue) {
                    setState(() {
                      _filterCategory = newValue!;
                    });
                  },
                  elevation: 2,
                  icon: const Icon(Icons.arrow_drop_down),
                  iconSize: 28,
                  iconEnabledColor: Colors.white,
                  // align the text to the center
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 15.0,
                    fontWeight: FontWeight.w700,
                  ),
                  dropdownColor: Colors.lightBlue,
                  underline: Container(
                    height: 2,
                    color: Colors.white,
                  ),
                  items: <String>[
                    'All',
                    '1',
                    '2',
                    '3',
                    '4',
                  ].map<DropdownMenuItem<String>>((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Center(
                        child: Text(
                          value == 'All'
                              ? value
                              : value == '1'
                                  ? 'Major Courses'
                                  : value == '2'
                                      ? 'Minor Courses'
                                      : value == '3'
                                          ? 'Elective Courses'
                                          : 'General Courses',
                        ),
                      ),
                    );
                  }).toList(),
                ),
              ),
            ],
          ),
        ),
      ),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        padding: const EdgeInsets.all(10),
        child: Wrap(
          children: List.generate(filteredCourses.length, (index) {
            var data = filteredCourses[index];
            final bool isTaken =
                myCourses.any((myCourses) => myCourses['id'] == data['id']);
            var size = MediaQuery.of(context).size;
            return Padding(
              padding: const EdgeInsets.only(bottom: 20),
              // center of the screen
              child: Center(
                child: Container(
                  width: size.width * 0.8,
                  alignment: Alignment.center,
                  padding: const EdgeInsets.all(7),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(17),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.1),
                        blurRadius: 5,
                        offset: const Offset(0, 5),
                      ),
                    ],
                  ),
                  child: Column(
                    children: [
                      Stack(
                        alignment: Alignment.bottomLeft,
                        children: [
                          SizedBox(
                            height: size.width * 0.6,
                            width: size.width * 0.8,
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(15),
                              child: Image.network(
                                data['image'],
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                          Positioned(
                            bottom: 7,
                            left: 7,
                            child: Container(
                              width: 90,
                              height: 30,
                              alignment: Alignment.center,
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(100),
                              ),
                              child: Text(
                                '${data['semester']} Semester',
                                style: const TextStyle(
                                  color: Colors.black87,
                                  fontSize: 12,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      Container(
                        padding: const EdgeInsets.only(left: 7, right: 7),
                        child: Text(
                          data['title'],
                          style: isTaken
                              ? const TextStyle(
                                  decoration: TextDecoration.lineThrough,
                                  color: Colors.black87,
                                  fontSize: 17,
                                  fontWeight: FontWeight.w700,
                                )
                              : const TextStyle(
                                  color: Colors.black87,
                                  fontSize: 17,
                                  fontWeight: FontWeight.w700,
                                ),
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 7, right: 7),
                        child: Row(
                          children: [
                            SizedBox(
                              height: 30,
                              width: 30,
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(100),
                                child: Image.network(
                                  data['instructor_profile'],
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                            const SizedBox(
                              width: 10,
                            ),
                            Expanded(
                              child: Container(
                                alignment: Alignment.centerLeft,
                                child: Text(
                                  data['instructor_name'],
                                  style: const TextStyle(
                                    color: Colors.black87,
                                    fontSize: 14,
                                    fontWeight: FontWeight.w700,
                                  ),
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ),
                            ),
                            const SizedBox(
                              width: 10,
                            ),
                            Container(
                              alignment: Alignment.centerRight,
                              child: Text(
                                '${data['credits']} Credits',
                                style: const TextStyle(
                                  color: Colors.lightBlue,
                                  fontSize: 13,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            );
          }),
        ),
      ),
    );
  }
}
