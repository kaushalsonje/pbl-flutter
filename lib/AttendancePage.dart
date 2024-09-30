import 'package:flutter/material.dart';

class AttendancePage extends StatelessWidget {
  static const routeName = '/attendance';

  final int lecturesAttended;
  final int totalLectures;

  AttendancePage({
    required this.lecturesAttended,
    required this.totalLectures,
  });

  @override
  Widget build(BuildContext context) {
    
    double attendancePercentage = (lecturesAttended / totalLectures) * 100;
    
    int lecturesRequiredFor75Percent = ((totalLectures * 0.75) - lecturesAttended).ceil();

    return Scaffold(
      appBar: AppBar(
        title: Text('Attendance'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          
          Text(
            'College attendance: ', 
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
          Text(
            'where every day is a gamble', 
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
          Text(
            'between attending class', 
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
          Text(
            'and catching up on sleep', 
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: 20),
          
          SizedBox(
            height: 190, 
            child: Stack(
              children: [
                Center(
                  child: SizedBox(
                    width: 200,
                    height: 200,
                    child: CircularProgressIndicator(
                      value: attendancePercentage / 100,
                      strokeWidth: 15,
                      backgroundColor: Colors.grey[500],
                      valueColor: AlwaysStoppedAnimation<Color>(Colors.black),
                    ),
                  ),
                ),
               
                Center(
                  child: Text(
                    '${attendancePercentage.toStringAsFixed(2)}%',
                    style: TextStyle(fontSize: 35, fontWeight: FontWeight.bold),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: 20),
         
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
             
              Expanded(
                child: Container(
                  padding: EdgeInsets.symmetric(vertical: 8, horizontal: 4),
                  decoration: BoxDecoration(
                    shape: BoxShape.rectangle,
                    borderRadius: BorderRadius.circular(20),
                    color: Colors.black,
                  ),
                  child: Column(
                    children: [
                      Text(
                        'Attended',
                        style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white),
                      ),
                      Text('$lecturesAttended', style: TextStyle(color: Colors.white)),
                    ],
                  ),
                ),
              ),
              SizedBox(width: 37.8), 
              
              Expanded(
                child: Container(
                  padding: EdgeInsets.symmetric(vertical: 8, horizontal: 4),
                  decoration: BoxDecoration(
                    shape: BoxShape.rectangle,
                    borderRadius: BorderRadius.circular(20),
                    color: Colors.black,
                  ),
                  child: Column(
                    children: [
                      Text(
                        'Total',
                        style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white),
                      ),
                      Text('$totalLectures', style: TextStyle(color: Colors.white)),
                    ],
                  ),
                ),
              ),
            ],
          ),
          SizedBox(height: 20),
          
          Container(
            padding: EdgeInsets.symmetric(vertical: 8, horizontal: 4),
            decoration: BoxDecoration(
              shape: BoxShape.rectangle,
              borderRadius: BorderRadius.circular(20),
              color: Colors.black,
            ),
            child: Column(
              children: [
                Text(
                  'Required for 75%',
                  style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white),
                ),
                Text('$lecturesRequiredFor75Percent', style: TextStyle(color: Colors.white)),
              ],
            ),
          ),
          SizedBox(height: 15),
          
          Container(
            padding: EdgeInsets.symmetric(vertical: 8, horizontal: 4),
            width: 400,
            height: 150,
            child: Image.asset(
              'assets/attendance.jpeg', 
              fit: BoxFit.cover,
            ),
          ),
        ],
      ),
    );
  }
}
