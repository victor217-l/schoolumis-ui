import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
//import 'package:rive/rive.dart';
import 'package:schoolumis/common/globalvariables.dart';
import 'package:schoolumis/features/Lecturer/lecturedashboa.dart';
import 'package:schoolumis/features/dashboardforeveryone.dart';
import 'package:schoolumis/features/halladmin/halladmindashbo.dart';
import 'package:schoolumis/features/halladmin/halllogin.dart';
import 'package:schoolumis/features/student/commenceregistration.dart';
import 'package:schoolumis/features/student/dashboardstudent.dart';
import 'package:schoolumis/features/student/login.dart';
import 'package:schoolumis/features/student/worshipcentre.dart';

import '../features/Lecturer/lectureslogin.dart';
import '../features/Lecturer/seecourses.dart';
import '../features/student/acsemester/semester.dart';

class Navigationdrawer extends StatelessWidget {
  const Navigationdrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            buildHeader(context),
            buildMenuItem(context)
          ],
        ),
      ),
    );
    
   
  }
  Widget buildHeader(BuildContext context) => Container(
    color: Color.fromARGB(255, 6, 27, 84),
    padding: EdgeInsets.only(top: 13),
    child: Column(
      children: [
        CircleAvatar(
          radius: 53,
          child: Image.asset("image/Rectangle 129.png",
          height: 30,
          width: 30,
          fit: BoxFit.cover,),
        ),
        SizedBox(height: 12,),
        Text("Name", style: TextStyle(fontSize: 18),)
      ],
    ),

  );

  Widget buildMenuItem(BuildContext context) => Padding(
      padding: EdgeInsets.all(15),
  child: Wrap(
    runSpacing: 5,
    children: [
      ListTile(
        leading: Icon(Icons.home_outlined),
        title: Text('Home'),
        onTap: () {
          Navigator.of(context).push(MaterialPageRoute(
              builder: (_) => DashboardForeveryone()));
        },
      ),
      ListTile(
        leading: Icon(Icons.sailing),
        title: Text('Student'),
        onTap: () {
          Navigator.of(context).push(MaterialPageRoute(
              builder: (_) => LoginStudent()));
        },
      ),
      ListTile(
        leading: Icon(Icons.favorite_outline),
        title: Text('Comence Registration'),
        onTap: () {
          Navigator.pop(context);

          Navigator.of(context).push(MaterialPageRoute(
              builder: (_) => CommenceRegistration()));
        },
      ),
      ListTile(
        leading: Icon(Icons.sailing),
        title: Text('Lecturer'),
        onTap: () {
          Navigator.of(context).push(MaterialPageRoute(
              builder: (_) => LoginLecturer()));
        },
      ),
      ListTile(
        leading: Icon(Icons.local_library_sharp),
        title: Text('Hall '),
        onTap: () {
          Navigator.of(context).push(MaterialPageRoute(
              builder: (_) => LoginHalladmin()));
        },
      ),
      ListTile(
        leading: Icon(Icons.church),
        title: Text('Worship'),
        onTap: () {
          Navigator.of(context).push(MaterialPageRoute(
              builder: (_) => Worshipcentre()));
        },
      ),
    ],
  ),);

}


class Navigationdrawerforstudent extends StatelessWidget {
  const Navigationdrawerforstudent({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            buildHeader(context),
            buildMenuItem(context)
          ],
        ),
      ),
    );


  }
  Widget buildHeader(BuildContext context) => Container(
    color: Color.fromARGB(255, 6, 27, 84),
    padding: EdgeInsets.only(top: 13),
    child: Column(
      children: [
        CircleAvatar(
          radius: 53,
          child: Image.asset("image/Rectangle 129.png",
            height: 30,
            width: 30,
            fit: BoxFit.cover,),
        ),
        SizedBox(height: 12,),
        Text("Name", style: TextStyle(fontSize: 18),)
      ],
    ),

  );

  Widget buildMenuItem(BuildContext context) => Padding(
    padding: EdgeInsets.all(15),
    child: Wrap(
      runSpacing: 5,
      children: [
        // ListTile(
        //   leading: Icon(Icons.home_outlined),
        //   title: Text('Home'),
        //   onTap: () {
        //   onTap: () {
        //     Navigator.of(context).push(MaterialPageRoute(
        //         builder: (_) => DashboardForeveryone()));
        //   },
        // ),
        ListTile(
          leading: Icon(Icons.sailing),
          title: Text('Student'),
          onTap: () {
            Navigator.of(context).push(MaterialPageRoute(
                builder: (_) => LoginStudent()));
          },
        ),
        ListTile(
          leading: Icon(Icons.favorite_outline),
          title: Text('Comence Registration'),
          onTap: () {
            Navigator.pop(context);

            Navigator.of(context).push(MaterialPageRoute(
                builder: (_) => CommenceRegistration()));
          },
        ),
        ListTile(
          leading: Icon(Icons.sailing),
          title: Text('Semester result'),
          onTap: () {
            Navigator.of(context).push(MaterialPageRoute(
                builder: (_) => Semester()));
          },
        ),
        ListTile(
          leading: Icon(Icons.local_library_sharp),
          title: Text('CourseList '),
          onTap: () {
            Navigator.of(context).push(MaterialPageRoute(
                builder: (_) => HallAdminDashboard()));
          },
        ),
        // ListTile(
        //   leading: Icon(Icons.church),
        //   title: Text('Worship'),
        //   onTap: () {
        //     Navigator.of(context).push(MaterialPageRoute(
        //         builder: (_) => Worshipcentre()));
        //   },
        // ),
      ],
    ),);

}



class NavigationdrawerforLecturer extends StatelessWidget {
  const NavigationdrawerforLecturer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            buildHeader(context),
            buildMenuItem(context)
          ],
        ),
      ),
    );


  }
  Widget buildHeader(BuildContext context) => Container(
    color: Color.fromARGB(255, 6, 27, 84),
    padding: EdgeInsets.only(top: 13),
    child: Column(
      children: [
        CircleAvatar(
          radius: 53,
          child: Image.asset("image/Rectangle 129.png",
            height: 30,
            width: 30,
            fit: BoxFit.cover,),
        ),
        SizedBox(height: 12,),
        Text("Name", style: TextStyle(fontSize: 18),)
      ],
    ),

  );

  Widget buildMenuItem(BuildContext context) => Padding(
    padding: EdgeInsets.all(15),
    child: Wrap(
      runSpacing: 5,
      children: [
        ListTile(
          leading: Icon(Icons.home_outlined),
          title: Text('Home'),
          onTap: () {
            Navigator.of(context).push(MaterialPageRoute(
                builder: (_) => LectureDashboard()));

          },
        ),
        ListTile(
          leading: Icon(Icons.sailing),
          title: Text('Login Lecturer'),
          onTap: () {
            Navigator.of(context).push(MaterialPageRoute(
                builder: (_) => LoginStudent()));
          },
        ),
        ListTile(
          leading: Icon(Icons.favorite_outline),
          title: Text('Student score '),
          onTap: () {
            Navigator.pop(context);

            Navigator.of(context).push(MaterialPageRoute(
                builder: (_) => CommenceRegistration()));
          },
        ),
        ListTile(
          leading: Icon(Icons.sailing),
          title: Text('Courses'),
          onTap: () {
            Navigator.of(context).push(MaterialPageRoute(
                builder: (_) => SeeCourses()));
          },
        ),
        // ListTile(
        //   leading: Icon(Icons.local_library_sharp),
        //   title: Text('Course'),
        //   onTap: () {
        //     Navigator.of(context).push(MaterialPageRoute(
        //         builder: (_) => HallAdminDashboard()));
        //   },
        // ),
        // ListTile(
        //   leading: Icon(Icons.church),
        //   title: Text('Worship'),
        //   onTap: () {
        //     Navigator.of(context).push(MaterialPageRoute(
        //         builder: (_) => Worshipcentre()));
        //   },
        // ),
      ],
    ),);

}

//Navigationdrawerforhall


class Navigationdrawerforhall extends StatelessWidget {
  const Navigationdrawerforhall({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            buildHeader(context),
            buildMenuItem(context)
          ],
        ),
      ),
    );


  }
  Widget buildHeader(BuildContext context) => Container(
    color: Color.fromARGB(255, 6, 27, 84),
    padding: EdgeInsets.only(top: 13),
    child: Column(
      children: [
        CircleAvatar(
          radius: 53,
          child: Image.asset("image/Rectangle 129.png",
            height: 30,
            width: 30,
            fit: BoxFit.cover,),
        ),
        SizedBox(height: 12,),
        Text("Name", style: TextStyle(fontSize: 18),)
      ],
    ),

  );

  Widget buildMenuItem(BuildContext context) => Padding(
    padding: EdgeInsets.all(15),
    child: Wrap(
      runSpacing: 5,
      children: [
        ListTile(
          leading: Icon(Icons.home_outlined),
          title: Text('Home'),
          onTap: () {
            Navigator.of(context).push(MaterialPageRoute(
                builder: (_) => LectureDashboard()));

          },
        ),
        ListTile(
          leading: Icon(Icons.sailing),
          title: Text('Login Halladmin'),
          onTap: () {
            Navigator.of(context).push(MaterialPageRoute(
                builder: (_) => LoginStudent()));
          },
        ),
        ListTile(
          leading: Icon(Icons.favorite_outline),
          title: Text('Allsruden '),
          onTap: () {
            Navigator.pop(context);

            Navigator.of(context).push(MaterialPageRoute(
                builder: (_) => CommenceRegistration()));
          },
        ),
        ListTile(
          leading: Icon(Icons.sailing),
          title: Text('Logout'),
          onTap: () {
            Navigator.of(context).push(MaterialPageRoute(
                builder: (_) => SeeCourses()));
          },
        ),
        // ListTile(
        //   leading: Icon(Icons.local_library_sharp),
        //   title: Text('Course'),
        //   onTap: () {
        //     Navigator.of(context).push(MaterialPageRoute(
        //         builder: (_) => HallAdminDashboard()));
        //   },
        // ),
        // ListTile(
        //   leading: Icon(Icons.church),
        //   title: Text('Worship'),
        //   onTap: () {
        //     Navigator.of(context).push(MaterialPageRoute(
        //         builder: (_) => Worshipcentre()));
        //   },
        // ),
      ],
    ),);

}

// class SideBar extends StatefulWidget {
//   const SideBar({Key? key}) : super(key: key);
//
//   @override
//   State<SideBar> createState() => _SideBarState();
// }
//
// class _SideBarState extends State<SideBar> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Container(
//         width: 200,
//         height: double.infinity,
//         color: Color(0xFF172014),
//         child: SafeArea(
//           child: Column(
//             children: [
//
//               ListTile(
//                 leading: CircleAvatar(
//                   backgroundColor: Colors.white24,
//                   child: Icon(
//                     CupertinoIcons.person,
//                     color: Colors.white,
//                   ),
//                 ),
//                 title:  Text(
//                   'Aba Anmar',
//                   style: TextStyle(color: Colors.white),
//                 ),
//                 subtitle: Text(
//                   'professin',
//                   style: TextStyle(color: Colors.white),
//                 ),
//               ),
//               Padding(
//                 padding: const EdgeInsets.only(left: 24.0),
//                 child: Text('Browse'.toUpperCase(), style: Theme.of(context).textTheme.titleMedium!.copyWith(color: Colors.white) , ),
//               ),
//               ...sideMenus.map((menu) => SideMenuTile(
//                 menu: menu,
//                 riveonInit: (artboard){
//                   //LET Show if user clicks
//                   StateMachineController controller = RiverUtils.getRiveController(artboard,stateMachineName:
//                   menu.stateMachineName);
//                   menu.input = controller.findSMI("active") as SMIBool;
//                 },
//                 press: () {
//                   menu.inputz.change(true);
//                 },
//                 isActive: false
//               )),
//
//
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
//
// class SideMenuTile extends StatelessWidget {
//   const SideMenuTile({
//     super.key, this.menu, required this.press, required this.riveonInit, required this.isActive,
//   });
//
//   final  RiveAsset menu;
//   final VoidCallback press;
//   final ValueChanged<Artboard> riveonInit;
//   final bool isActive;
//
//   @override
//   Widget build(BuildContext context) {
//     return Column(
//       children: [
//         Divider(
//           color: Colors.white24,
//           height: 1,
//         ),
//         ListTile(
//           leading: SizedBox(
//             height: 34,
//             width: 34,
//             child: RiveAnimation.asset(menu.src,
//                 artboard:menu.artboard,
//                 onInit:riveonInit
//             ),
//           ),
//           title: Text(
//             menu.title,
//             style: TextStyle(color: Colors.white),
//           ),
//         )
//
//       ],
//     );
//   }
// }
//
