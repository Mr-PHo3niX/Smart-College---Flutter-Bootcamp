import 'package:flutter/material.dart';
import '../data/courses_json.dart';

class CoursesScreen extends StatefulWidget {
  const CoursesScreen({Key? key}) : super(key: key);

  @override
  CoursesScreenState createState() => CoursesScreenState();
}

class CoursesScreenState extends State<CoursesScreen> {
  @override
  Widget build(BuildContext context) {
    final completedCourses =
        mycourses.where((course) => course['percentage'] == 100).toList();

    return Scaffold(
        appBar: AppBar(
          title: const Text('Completed Courses'),
        ),
        body: SingleChildScrollView(
          child: Column(
            children: List.generate(completedCourses.length, (index) {
              var data = completedCourses[index];
              var size = MediaQuery.of(context).size;
              return Padding(
                padding: const EdgeInsets.only(top: 20, bottom: 20),
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
                          SizedBox(
                              height: size.width * 0.16,
                              width: size.height * 0.075,
                              child: ClipRRect(
                                  borderRadius: BorderRadius.circular(10),
                                  child: Image.network(
                                    data['image'],
                                    fit: BoxFit.cover,
                                  ))),
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
                              child: Stack(
                                  alignment: Alignment.centerLeft,
                                  children: [
                                Container(
                                  width: size.width,
                                  height: 5,
                                  decoration: BoxDecoration(
                                      color: Colors.white.withOpacity(0.1),
                                      borderRadius: BorderRadius.circular(100)),
                                ),
                                Container(
                                  width:
                                      size.width * (data['percentage'] / 100),
                                  height: 7,
                                  decoration: BoxDecoration(
                                      color: Colors.amber.withOpacity(0.5),
                                      borderRadius: BorderRadius.circular(100),
                                      boxShadow: [
                                        BoxShadow(
                                            color:
                                                Colors.amber.withOpacity(0.5),
                                            blurRadius: 6,
                                            offset: const Offset(0, 3))
                                      ]),
                                ),
                              ])),
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
                        ],
                      )
                    ],
                  ),
                ),
              );
            }),
          ),
        ));
  }
}
