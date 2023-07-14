import 'package:flutter/material.dart';

import '../../common/costombotton.dart';
import '../../common/costomtextfiel.dart';
import '../../common/navigation.dart';

class AdCizentshipscore extends StatefulWidget {
  const AdCizentshipscore({Key? key}) : super(key: key);

  @override
  State<AdCizentshipscore> createState() => _AdCizentshipscoreState();
}

class _AdCizentshipscoreState extends State<AdCizentshipscore> {
  final aadcitenship = GlobalKey<FormState>();

  final TextEditingController _nameofstudent = TextEditingController();
  final TextEditingController _scoreController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(preferredSize: Size.fromHeight(60.0) ,
        child: Padding(padding: EdgeInsets.symmetric(horizontal: 14),
          child: AppBar(
            backgroundColor: Colors.white,
            shadowColor: null,
            elevation: 0,
            leading: Padding(padding: EdgeInsets.all(10.0),
              child: ClipRRect(
                borderRadius: BorderRadius.all(Radius.circular(25.0)) ,
                child: Image.asset("image/Rectangle 129", height: 20, width: 20, fit: BoxFit.cover,)  ,
              )
              ,),
            actions: [
              Builder(builder: (BuildContext context) {
                return IconButton(onPressed: (){
                  Scaffold.of(context).openDrawer();
                }, icon: Icon(Icons.menu, ),
                  tooltip: MaterialLocalizations.of(context).openAppDrawerTooltip,
                );
              })

            ],
          )
          ,) ,),
      drawer: Navigationdrawer(),
      body: SingleChildScrollView(
        child: Stack(
          children: [
            Padding(padding: EdgeInsets.symmetric(horizontal: 12),
              child: Form(
                key: aadcitenship,
                child: Column(
                  children: [
                    Customtextfiel(controller: _nameofstudent , title: "Name of student", iconData: Icons.leaderboard_outlined,
                        hintext: "Coursename"),
                    SizedBox(height: 10,),
                    Customtextfiel(controller: _scoreController, title: "Score", iconData: Icons.swipe_left_alt_rounded,
                        hintext: "Shortname of course"),
                    SizedBox(height: 10,),
                    SizedBox(height: 10,),
                    CustomButton(text: "Add Student")







                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
