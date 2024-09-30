import 'package:flutter/material.dart';
import 'AttendancePage.dart';
import 'ClubsPage.dart';
import 'TodoListPage.dart';
import 'dashboard_box.dart';
import 'login_page.dart';
import 'profilepage.dart'; 
import 'timetablepage.dart';


class HomePage extends StatelessWidget {
  static const routeName = '/home';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('dashboard'),
        backgroundColor: Colors.black,
        centerTitle: true,
        leading: IconButton(
          icon: Icon(Icons.account_circle_sharp),
          onPressed: () {
            Navigator.pushNamed(context, ProfilePage.routeName);
          },
          color: Colors.white,
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.logout),
            onPressed: () {
              
              Navigator.pushReplacementNamed(context, LoginPage.routeName);
            },
            color: Colors.white,
          ),
        ],
        iconTheme: IconThemeData(color: Colors.white),
        bottom: PreferredSize(
          preferredSize: Size.fromHeight(2),
          child: Container(
            color: Colors.white,
            height: 2,
          ),
        ),
        toolbarTextStyle: Theme.of(context).textTheme.apply(
          bodyColor: Colors.white,
        ).bodyText2,
        titleTextStyle: Theme.of(context).textTheme.apply(
          bodyColor: Colors.white,
        ).headline6,
      ),
      body: Stack(
        children: [
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    DashboardBox(
                      icon: Icons.badge_outlined,
                      title: 'Timetable',
                      onTap: () {
                        Navigator.pushNamed(context, TimetablePage.routeName); 
                      },
                    ),
                    DashboardBox(
                      icon: Icons.assignment_turned_in_outlined,
                      title: 'Todo list',
                      onTap: () {
                        Navigator.pushNamed(context, TodoListPage.routeName); 
                      },
                    ),
                  ],
                ),
                SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    DashboardBox(
                      icon: Icons.event,
                      title: 'Clubs',
                      onTap: () {
                        Navigator.pushNamed(context, ClubsPage.routeName); 
                      },
                    ),
                    DashboardBox(
                      icon: Icons.co_present_outlined,
                      title: 'Attendance',
                      onTap: () {
                        Navigator.pushNamed(context, AttendancePage.routeName); 
                      },
                    ),
                  ],
                ),
              ],
            ),
          ),

          Positioned(
            bottom: 50, 
            right: 20, 
            child: Text(
              'college life chose me',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Positioned(
            bottom: 25, 
            right: 20, 
            child: Text(
              '',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Positioned(
            bottom: 80, 
            right: 20, 
            child: Text(
              'I didn''t choose the college life',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Positioned(
            top: 0,
            right: 0,
            child: SizedBox(
              width: 250, 
              child: Container(
                padding: EdgeInsets.all(8),
                width: 200,
                height: 250,
                child: Image.asset(
                  'assets/img.png', 
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
          Positioned(
            top: 50,
            left: 0,
            child: Text(
              'College: where every day',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),

          ),
          Positioned(
            top: 80,
            left: 70,
            child: Text(
              'feels like a Monday',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),

          ),

          Positioned(
            bottom: 0,
            left: 0,
            child: SizedBox(
              width: 250, 
              child: Container(
                padding: EdgeInsets.all(8),
                height: 250,
                child: Image.asset(
                  'assets/dash.png', 
                  fit: BoxFit.cover,
                ), 
              ),
            ),
          ),
        ],
      ),
    );
  }
}
