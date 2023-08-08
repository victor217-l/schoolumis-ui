import 'package:flutter/material.dart';

import '../../common/navigation.dart';

class SuperAdminDashboard extends StatefulWidget {
  static const String routeName = 'sudentahs';
  const SuperAdminDashboard({Key? key}) : super(key: key);

  @override
  State<SuperAdminDashboard> createState() => _SuperAdminDashboardState();
}

class _SuperAdminDashboardState extends State<SuperAdminDashboard> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      drawer: NavigationdrawerforsuperAdmin(),

      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(
              children: [
                Container(
                  height: 160,
                  width: double.infinity,
                  decoration: BoxDecoration(
                      image: DecorationImage(
                          image: AssetImage(
                              "image/forschool.png"
                          ),
                          fit: BoxFit.cover
                      )
                  ),
                ),

                Positioned(
                    right: 40,
                    bottom: 5,
                    child: Builder(builder: (BuildContext context){
                      return IconButton(onPressed: () {
                        Scaffold.of(context).openDrawer();
                      }, icon: Icon(Icons.menu, size: 30,),
                        tooltip: MaterialLocalizations.of(context).openAppDrawerTooltip,
                      );
                    },))

              ],

            ),

            SizedBox(height: 15,),
            Padding(
              padding: const EdgeInsets.all(12.0),
              child: Column(
                children: [
                  Text("Latest News"),

                ],
              ),
            ),



            Padding(
              padding: const EdgeInsets.all(14.0),
              child: Row(
                children: [
                  Image.asset("image/forschoolnews.png", height: 150,),


                ],
              ),
            ),
            SizedBox(height: size.height * 0.06,),
            Align(
              alignment: Alignment.center,
              child: Column(
                children: [
                  Text("University, institution of higher",  style: TextStyle(color: Colors.black),),
                  Text("2030@openBrawer")
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
