import 'package:flutter/material.dart';
import 'package:smartcollege/Screens/all_courses.dart';
import 'package:smartcollege/Screens/courses.dart';
import '../data/courses_json.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  HomeScreenState createState() => HomeScreenState();
}

class HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(""),
        elevation: 0,
        backgroundColor: Colors.transparent,
      ),
      extendBodyBehindAppBar: true,
      // backgroundColor: Colors.transparent,
      body: getBody(),
    );
  }

  Widget getBody() {
    var majorCourses =
        courses.where((element) => element['category'] == '1').toList();
    var minorCourses =
        courses.where((element) => element['category'] == '2').toList();
    var electiveCourses =
        courses.where((element) => element['category'] == '3').toList();
    var generalCourses =
        courses.where((element) => element['category'] == '4').toList();

    return SingleChildScrollView(
      padding: const EdgeInsets.only(bottom: 5),
      child: Column(children: [
        Column(
          children: [
            Container(
                padding: const EdgeInsets.only(top: 50, left: 20, right: 20),
                height: 200,
                decoration: const BoxDecoration(
                    borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(20),
                        bottomRight: Radius.circular(20)),
                    image: DecorationImage(
                        image: AssetImage('images/appbar.jpg'),
                        fit: BoxFit.cover)),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text(
                          'Hello \nAsaad Falah',
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 20,
                              fontWeight: FontWeight.bold),
                        ),
                        Container(
                          height: 40,
                          width: 40,
                          decoration: const BoxDecoration(
                              shape: BoxShape.circle,
                              color: Color.fromARGB(255, 1, 104, 132)),
                          child: const Padding(
                              padding: EdgeInsets.all(8),
                              child: Icon(Icons.notifications,
                                  color: Colors.white)),
                        )
                      ],
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    TextFormField(
                      decoration: const InputDecoration(
                        prefixIcon:
                            Icon(Icons.search, color: Colors.grey, size: 26),
                        suffixIcon:
                            Icon(Icons.mic, color: Colors.lightBlue, size: 26),
                        labelText: 'Search',
                        labelStyle: TextStyle(color: Colors.grey),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(45)),
                        ),
                      ),
                    ),
                  ],
                ))
          ],
        ),
        const SizedBox(height: 10),
        Padding(
          padding: const EdgeInsets.only(left: 10, right: 10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                'Academic Courses',
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 20,
                    fontWeight: FontWeight.bold),
              ),
              GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const AllCourses()),
                  );
                },
                child: const Text(
                  'See All',
                  style: TextStyle(
                    color: Colors.lightBlue,
                    fontSize: 15,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ],
          ),
        ),
        const SizedBox(height: 10),

        // courses to be fetched from json file
        SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            padding: const EdgeInsets.all(10),
            child: Wrap(
              children: List.generate(5, (index) {
                //BuildContext? context;
                var data = courses[index];
                final bool isTaken =
                    mycourses.any((element) => element['id'] == data['id']);
                var size = MediaQuery.of(context).size;

                return Padding(
                    padding: const EdgeInsets.only(right: 15, bottom: 20),
                    child: Container(
                      width: size.width * 0.6,
                      alignment: Alignment.topCenter,
                      padding: const EdgeInsets.all(7),
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(17),
                          boxShadow: [
                            BoxShadow(
                                color: Colors.black.withOpacity(0.1),
                                blurRadius: 5,
                                offset: const Offset(0, 5))
                          ]),
                      child: Column(
                        children: [
                          Stack(
                            alignment: Alignment.bottomLeft,
                            children: [
                              Container(
                                  height: size.width * 0.4,
                                  width: size.width * 0.6,
                                  child: ClipRRect(
                                      borderRadius: BorderRadius.circular(15),
                                      child: Image.network(
                                        data['image'],
                                        fit: BoxFit.cover,
                                      ))),
                              Positioned(
                                  bottom: 7,
                                  left: 7,
                                  child: Container(
                                    width: 90,
                                    height: 30,
                                    alignment: Alignment.center,
                                    decoration: BoxDecoration(
                                        color: Colors.white,
                                        borderRadius:
                                            BorderRadius.circular(100)),
                                    child: Text(
                                      '${data['semester']} Semester',
                                      style: const TextStyle(
                                          color: Colors.black87,
                                          fontSize: 14,
                                          fontWeight: FontWeight.w700),
                                    ),
                                  ))
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
                                      fontWeight: FontWeight.w700)
                                  : const TextStyle(
                                      color: Colors.black87,
                                      fontSize: 17,
                                      fontWeight: FontWeight.w700),
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
                                Container(
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
                                        fontSize: 13,
                                      ),
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
                          )
                        ],
                      ),
                    ));
              }),
            )),
        const SizedBox(height: 10),
        Padding(
          padding: const EdgeInsets.only(left: 10, right: 10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                'Current Courses',
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 20,
                    fontWeight: FontWeight.bold),
              ),
              GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const CoursesScreen()),
                  );
                },
                child: const Text(
                  'See completed',
                  style: TextStyle(
                    color: Colors.lightBlue,
                    fontSize: 15,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ],
          ),
        ),
        const SizedBox(height: 25),
        Column(
          children: List.generate(mycourses.length, (index) {
            var data = mycourses[index];
            var size = MediaQuery.of(context).size;
            return Padding(
              padding: const EdgeInsets.only(bottom: 20),
              child: Container(
                  margin: const EdgeInsets.only(left: 10, right: 10),
                  padding: const EdgeInsets.all(15),
                  decoration: BoxDecoration(
                    color: const Color.fromARGB(255, 19, 66, 92),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          Stack(
                            alignment: Alignment.centerLeft,
                            children: [
                              SizedBox(
                                  height: size.width * 0.16,
                                  width: size.height * 0.075,
                                  child: ClipRRect(
                                      borderRadius: BorderRadius.circular(10),
                                      child: Image.network(
                                        data['image'],
                                        fit: BoxFit.cover,
                                      ))),
                            ],
                          ),
                          const SizedBox(
                            width: 3,
                          ),
                          Expanded(
                              child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                data['title'],
                                maxLines: 2,
                                overflow: TextOverflow.ellipsis,
                                style: const TextStyle(
                                    color: Colors.white,
                                    fontSize: 17,
                                    fontWeight: FontWeight.w700),
                              ),
                              const SizedBox(
                                height: 5,
                              ),
                              Row(
                                children: [
                                  Container(
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
                                  Container(
                                    width: 100,
                                    alignment: Alignment.centerLeft,
                                    child: Text(
                                      data['instructor_name'],
                                      style: const TextStyle(
                                        color: Colors.white,
                                        fontSize: 13,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ))
                        ],
                      ),
                      Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Expanded(
                              child: SizedBox(
                                width: size.width *
                                    0.6, // adjust the width as needed
                                child: Stack(
                                  alignment: Alignment.centerLeft,
                                  children: [
                                    Container(
                                      width: size.width,
                                      height: 5,
                                      decoration: BoxDecoration(
                                        color: Colors.white.withOpacity(0.1),
                                        borderRadius:
                                            BorderRadius.circular(100),
                                      ),
                                    ),
                                    Container(
                                      width: size.width *
                                          (data['percentage'] / 100),
                                      height: 7,
                                      decoration: BoxDecoration(
                                        color: Colors.amber.withOpacity(0.5),
                                        borderRadius:
                                            BorderRadius.circular(100),
                                        boxShadow: [
                                          BoxShadow(
                                            color:
                                                Colors.amber.withOpacity(0.5),
                                            blurRadius: 6,
                                            offset: const Offset(0, 3),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            const SizedBox(width: 10),
                            Container(
                              width: 50,
                              alignment: Alignment.centerRight,
                              child: Text(
                                '${data['percentage']}%',
                                style: const TextStyle(
                                    color: Colors.amber,
                                    fontSize: 13,
                                    fontWeight: FontWeight.w700),
                              ),
                            )
                          ])
                    ],
                  )),
            );
          }),
        ),
        const SizedBox(height: 10),
        // Major Courses using SingleChildScrollView horizontally and fetching data from json file using
        // category key which is "1" for major courses
        Padding(
          padding: const EdgeInsets.only(left: 10, right: 10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: const [
              Text(
                'Major Courses',
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 20,
                    fontWeight: FontWeight.bold),
              ),
            ],
          ),
        ),
        SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            padding: const EdgeInsets.all(10),
            child: Wrap(
              children: List.generate(majorCourses.length, (index) {
                //check if the course is already taken or not
                bool isTaken = mycourses
                    .where(
                        (element) => element['id'] == majorCourses[index]['id'])
                    .isNotEmpty;
                var size = MediaQuery.of(context).size;

                return Padding(
                    padding: const EdgeInsets.only(right: 15, bottom: 20),
                    child: Container(
                      width: size.width * 0.6,
                      alignment: Alignment.topCenter,
                      padding: const EdgeInsets.all(7),
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(17),
                          boxShadow: [
                            BoxShadow(
                                color: Colors.black.withOpacity(0.1),
                                blurRadius: 5,
                                offset: const Offset(0, 5))
                          ]),
                      child: Column(
                        children: [
                          Stack(
                            alignment: Alignment.bottomLeft,
                            children: [
                              Container(
                                  height: size.width * 0.4,
                                  width: size.width * 0.6,
                                  child: ClipRRect(
                                      borderRadius: BorderRadius.circular(15),
                                      child: Image.network(
                                        majorCourses[index]['image'],
                                        fit: BoxFit.cover,
                                      ))),
                              Positioned(
                                  bottom: 7,
                                  left: 7,
                                  child: Container(
                                    width: 90,
                                    height: 30,
                                    alignment: Alignment.center,
                                    decoration: BoxDecoration(
                                        color: Colors.white,
                                        borderRadius:
                                            BorderRadius.circular(100)),
                                    child: Text(
                                      '${majorCourses[index]['semester']} Semester',
                                      style: const TextStyle(
                                          color: Colors.black87,
                                          fontSize: 14,
                                          fontWeight: FontWeight.w700),
                                    ),
                                  ))
                            ],
                          ),
                          const SizedBox(
                            height: 15,
                          ),
                          Container(
                            padding: const EdgeInsets.only(left: 7, right: 7),
                            child: Text(
                              majorCourses[index]['title'],
                              style: isTaken
                                  ? const TextStyle(
                                      decoration: TextDecoration.lineThrough,
                                      color: Colors.black87,
                                      fontSize: 17,
                                      fontWeight: FontWeight.w700)
                                  : const TextStyle(
                                      color: Colors.black87,
                                      fontSize: 17,
                                      fontWeight: FontWeight.w700),
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
                                Container(
                                  height: 30,
                                  width: 30,
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(100),
                                    child: Image.network(
                                      majorCourses[index]['instructor_profile'],
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
                                      majorCourses[index]['instructor_name'],
                                      style: const TextStyle(
                                        color: Colors.black87,
                                        fontSize: 13,
                                      ),
                                    ),
                                  ),
                                ),
                                const SizedBox(
                                  width: 10,
                                ),
                                Container(
                                  alignment: Alignment.centerRight,
                                  child: Text(
                                    '${majorCourses[index]['credits']} Credits',
                                    style: const TextStyle(
                                      color: Colors.lightBlue,
                                      fontSize: 13,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          )
                        ],
                      ),
                    ));
              }),
            )),
        const SizedBox(height: 10),
        // Minor Courses using SingleChildScrollView horizontally and fetching data from json file using
        // category key which is "2" for minor courses
        Padding(
          padding: const EdgeInsets.only(left: 10, right: 10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: const [
              Text(
                'Minor Courses',
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 20,
                    fontWeight: FontWeight.bold),
              ),
            ],
          ),
        ),
        SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            padding: const EdgeInsets.all(10),
            child: Wrap(
              children: List.generate(minorCourses.length, (index) {
                //check if the course is already taken or not
                bool isTaken = mycourses
                    .where(
                        (element) => element['id'] == minorCourses[index]['id'])
                    .isNotEmpty;
                var size = MediaQuery.of(context).size;

                return Padding(
                    padding: const EdgeInsets.only(right: 15, bottom: 20),
                    child: Container(
                      width: size.width * 0.6,
                      alignment: Alignment.topCenter,
                      padding: const EdgeInsets.all(7),
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(17),
                          boxShadow: [
                            BoxShadow(
                                color: Colors.black.withOpacity(0.1),
                                blurRadius: 5,
                                offset: const Offset(0, 5))
                          ]),
                      child: Column(
                        children: [
                          Stack(
                            alignment: Alignment.bottomLeft,
                            children: [
                              Container(
                                  height: size.width * 0.4,
                                  width: size.width * 0.6,
                                  child: ClipRRect(
                                      borderRadius: BorderRadius.circular(15),
                                      child: Image.network(
                                        minorCourses[index]['image'],
                                        fit: BoxFit.cover,
                                      ))),
                              Positioned(
                                  bottom: 7,
                                  left: 7,
                                  child: Container(
                                    width: 90,
                                    height: 30,
                                    alignment: Alignment.center,
                                    decoration: BoxDecoration(
                                        color: Colors.white,
                                        borderRadius:
                                            BorderRadius.circular(100)),
                                    child: Text(
                                      '${minorCourses[index]['semester']} Semester',
                                      style: const TextStyle(
                                          color: Colors.black87,
                                          fontSize: 14,
                                          fontWeight: FontWeight.w700),
                                    ),
                                  ))
                            ],
                          ),
                          const SizedBox(
                            height: 15,
                          ),
                          Container(
                            padding: const EdgeInsets.only(left: 7, right: 7),
                            child: Text(
                              minorCourses[index]['title'],
                              style: isTaken
                                  ? const TextStyle(
                                      decoration: TextDecoration.lineThrough,
                                      color: Colors.black87,
                                      fontSize: 17,
                                      fontWeight: FontWeight.w700)
                                  : const TextStyle(
                                      color: Colors.black87,
                                      fontSize: 17,
                                      fontWeight: FontWeight.w700),
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
                                Container(
                                  height: 30,
                                  width: 30,
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(100),
                                    child: Image.network(
                                      minorCourses[index]['instructor_profile'],
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
                                      minorCourses[index]['instructor_name'],
                                      style: const TextStyle(
                                        color: Colors.black87,
                                        fontSize: 13,
                                      ),
                                    ),
                                  ),
                                ),
                                const SizedBox(
                                  width: 10,
                                ),
                                Container(
                                  alignment: Alignment.centerRight,
                                  child: Text(
                                    '${minorCourses[index]['credits']} Credits',
                                    style: const TextStyle(
                                      color: Colors.lightBlue,
                                      fontSize: 13,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          )
                        ],
                      ),
                    ));
              }),
            )),
        const SizedBox(height: 10),
        // Elective Courses using SingleChildScrollView horizontally and fetching data from json file using
        // category key which is "3" for elective courses
        Padding(
          padding: const EdgeInsets.only(left: 10, right: 10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: const [
              Text(
                'Elective Courses',
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 20,
                    fontWeight: FontWeight.bold),
              ),
            ],
          ),
        ),
        SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            padding: const EdgeInsets.all(10),
            child: Wrap(
              children: List.generate(electiveCourses.length, (index) {
                //check if the course is already taken or not
                bool isTaken = mycourses
                    .where((element) =>
                        element['id'] == electiveCourses[index]['id'])
                    .isNotEmpty;
                var size = MediaQuery.of(context).size;

                return Padding(
                    padding: const EdgeInsets.only(right: 15, bottom: 20),
                    child: Container(
                      width: size.width * 0.6,
                      alignment: Alignment.topCenter,
                      padding: const EdgeInsets.all(7),
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(17),
                          boxShadow: [
                            BoxShadow(
                                color: Colors.black.withOpacity(0.1),
                                blurRadius: 5,
                                offset: const Offset(0, 5))
                          ]),
                      child: Column(
                        children: [
                          Stack(
                            alignment: Alignment.bottomLeft,
                            children: [
                              Container(
                                  height: size.width * 0.4,
                                  width: size.width * 0.6,
                                  child: ClipRRect(
                                      borderRadius: BorderRadius.circular(15),
                                      child: Image.network(
                                        electiveCourses[index]['image'],
                                        fit: BoxFit.cover,
                                      ))),
                              Positioned(
                                  bottom: 7,
                                  left: 7,
                                  child: Container(
                                    width: 90,
                                    height: 30,
                                    alignment: Alignment.center,
                                    decoration: BoxDecoration(
                                        color: Colors.white,
                                        borderRadius:
                                            BorderRadius.circular(100)),
                                    child: Text(
                                      '${electiveCourses[index]['semester']} Semester',
                                      style: const TextStyle(
                                          color: Colors.black87,
                                          fontSize: 14,
                                          fontWeight: FontWeight.w700),
                                    ),
                                  ))
                            ],
                          ),
                          const SizedBox(
                            height: 15,
                          ),
                          Container(
                            padding: const EdgeInsets.only(left: 7, right: 7),
                            child: Text(
                              electiveCourses[index]['title'],
                              style: isTaken
                                  ? const TextStyle(
                                      decoration: TextDecoration.lineThrough,
                                      color: Colors.black87,
                                      fontSize: 17,
                                      fontWeight: FontWeight.w700)
                                  : const TextStyle(
                                      color: Colors.black87,
                                      fontSize: 17,
                                      fontWeight: FontWeight.w700),
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
                                Container(
                                  height: 30,
                                  width: 30,
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(100),
                                    child: Image.network(
                                      electiveCourses[index]
                                          ['instructor_profile'],
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
                                      electiveCourses[index]['instructor_name'],
                                      style: const TextStyle(
                                        color: Colors.black87,
                                        fontSize: 13,
                                      ),
                                    ),
                                  ),
                                ),
                                const SizedBox(
                                  width: 10,
                                ),
                                Container(
                                  alignment: Alignment.centerRight,
                                  child: Text(
                                    '${electiveCourses[index]['credits']} Credits',
                                    style: const TextStyle(
                                      color: Colors.lightBlue,
                                      fontSize: 13,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          )
                        ],
                      ),
                    ));
              }),
            )),
        const SizedBox(height: 10),
        // General Courses using SingleChildScrollView horizontally and fetching data from json file using
        // category key which is "4" for general courses
        Padding(
          padding: const EdgeInsets.only(left: 10, right: 10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: const [
              Text(
                'General Courses',
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 20,
                    fontWeight: FontWeight.bold),
              ),
            ],
          ),
        ),
        SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            padding: const EdgeInsets.all(10),
            child: Wrap(
              children: List.generate(generalCourses.length, (index) {
                //check if the course is already taken or not
                bool isTaken = mycourses
                    .where((element) =>
                        element['id'] == generalCourses[index]['id'])
                    .isNotEmpty;
                var size = MediaQuery.of(context).size;

                return Padding(
                    padding: const EdgeInsets.only(right: 15, bottom: 20),
                    child: Container(
                      width: size.width * 0.6,
                      alignment: Alignment.topCenter,
                      padding: const EdgeInsets.all(7),
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(17),
                          boxShadow: [
                            BoxShadow(
                                color: Colors.black.withOpacity(0.1),
                                blurRadius: 5,
                                offset: const Offset(0, 5))
                          ]),
                      child: Column(
                        children: [
                          Stack(
                            alignment: Alignment.bottomLeft,
                            children: [
                              Container(
                                  height: size.width * 0.4,
                                  width: size.width * 0.6,
                                  child: ClipRRect(
                                      borderRadius: BorderRadius.circular(15),
                                      child: Image.network(
                                        generalCourses[index]['image'],
                                        fit: BoxFit.cover,
                                      ))),
                              Positioned(
                                  bottom: 7,
                                  left: 7,
                                  child: Container(
                                    width: 90,
                                    height: 30,
                                    alignment: Alignment.center,
                                    decoration: BoxDecoration(
                                        color: Colors.white,
                                        borderRadius:
                                            BorderRadius.circular(100)),
                                    child: Text(
                                      '${generalCourses[index]['semester']} Semester',
                                      style: const TextStyle(
                                          color: Colors.black87,
                                          fontSize: 14,
                                          fontWeight: FontWeight.w700),
                                    ),
                                  ))
                            ],
                          ),
                          const SizedBox(
                            height: 15,
                          ),
                          Container(
                            padding: const EdgeInsets.only(left: 7, right: 7),
                            child: Text(
                              generalCourses[index]['title'],
                              style: isTaken
                                  ? const TextStyle(
                                      decoration: TextDecoration.lineThrough,
                                      color: Colors.black87,
                                      fontSize: 17,
                                      fontWeight: FontWeight.w700)
                                  : const TextStyle(
                                      color: Colors.black87,
                                      fontSize: 17,
                                      fontWeight: FontWeight.w700),
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
                                Container(
                                  height: 30,
                                  width: 30,
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(100),
                                    child: Image.network(
                                      generalCourses[index]
                                          ['instructor_profile'],
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
                                      generalCourses[index]['instructor_name'],
                                      style: const TextStyle(
                                        color: Colors.black87,
                                        fontSize: 13,
                                      ),
                                    ),
                                  ),
                                ),
                                const SizedBox(
                                  width: 10,
                                ),
                                Container(
                                  alignment: Alignment.centerRight,
                                  child: Text(
                                    '${generalCourses[index]['credits']} Credits',
                                    style: const TextStyle(
                                      color: Colors.lightBlue,
                                      fontSize: 13,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          )
                        ],
                      ),
                    ));
              }),
            )),
      ]),
    );
  }
}
