import 'package:flutter/material.dart';
void main(){

  runApp(MaterialApp(
    title: 'Counting the students',
    home: Home(),
  ));
}
class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {

  int _studentsCounter = 0;
  String _message = "The laboratory has space for more students";

  void incrementCounter(int increment){
    setState(() {
      if(increment == -1){
        if(_studentsCounter > 0) {
          _studentsCounter--;
        }
      }else if(increment == 1){
        _studentsCounter++;
      }
      checkNumberStudents(_studentsCounter);
    });
  }

  void checkNumberStudents(int numberStudents){
    setState(() {
      if(numberStudents >= 36){
        _message = "The laboratory has no more space for additional students";
      }else if(numberStudents < 36){
        _message = "The laboratory has space for more students";
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
        children: <Widget>[
          Image.asset(
            "images/wallpaper.png",
            fit: BoxFit.cover,
            height: 1000,
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(
                "Students: $_studentsCounter",
                style: const TextStyle(color: Colors.greenAccent, fontWeight: FontWeight.bold, fontSize: 50),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Padding(
                    padding: EdgeInsets.all(10.0),
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.red,
                        elevation: 20,
                        shadowColor: Colors.redAccent,
                      ),
                      child: const Text('-1'),
                      onPressed: () {
                        incrementCounter(-1);
                      },
                    ),
                  ),

                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.green,
                        elevation: 20,
                        shadowColor: Colors.greenAccent,
                      ),
                      child: const Text('+1'),
                      onPressed: () {
                        incrementCounter(1);
                      },
                    ),
                  ),
                ],
              ),
              Text(
                "$_message",
                style: const TextStyle(color: Colors.greenAccent, fontWeight: FontWeight.bold, fontSize: 30),
              ),
            ],
          ),
        ],
      );
  }
}
