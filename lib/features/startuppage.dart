import 'package:flutter/material.dart';
import 'package:schoolumis/features/dashboardforeveryone.dart';

class StartupPage extends StatefulWidget {
  const StartupPage({Key? key}) : super(key: key);

  @override
  State<StartupPage> createState() => _StartupPageState();
}

class _StartupPageState extends State<StartupPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal:10),
        child: InkWell(
          onTap: () {
            Navigator.of(context).push(MaterialPageRoute(builder: (_) => DashboardForeveryone()));
          },
          child: Container(
            height: 500,
            width: double.infinity,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.only(bottomRight: Radius.circular(24),
              bottomLeft: Radius.circular(24)),
              image: DecorationImage(
                image: AssetImage("image/Rectangle 129.png",),
                fit: BoxFit.cover,
              )
            ),
            child: Center(
              child: Text("School porter", style: TextStyle(color: Colors.white, fontSize: 14,),),
            ),

          ),
        ),
      ),
    );
  }
}
