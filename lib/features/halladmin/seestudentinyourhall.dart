import 'package:flutter/material.dart';
import 'package:schoolumis/common/navigation.dart';
import 'package:schoolumis/features/halladmin/addcitenshipscore.dart';
import 'package:schoolumis/features/halladmin/service/hallservice.dart';

import '../../common/costombotton.dart';
import '../model/studentinhall.dart';

class SeeStudentinyourhall extends StatefulWidget {
  const SeeStudentinyourhall({Key? key}) : super(key: key);

  @override
  State<SeeStudentinyourhall> createState() => _SeeStudentinyourhallState();
}

class _SeeStudentinyourhallState extends State<SeeStudentinyourhall> {

  final HallService hallService = HallService();

  List<StudentInyourHall>? _allstudent;

  void fetchstudent() async {
    _allstudent = await hallService.fetchstudentinhall(context);
    setState(() {

    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    fetchstudent();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
   // final allstudentinhall = _allstudent[index];
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
                child: Image.asset("image/Rectangle 129.png", height: 20, width: 20, fit: BoxFit.cover,)  ,
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
      drawer: Navigationdrawerforhall(),
      body: SingleChildScrollView(
        child: Stack(
          children: [
            Padding(padding: EdgeInsets.symmetric(horizontal: 10),
              child:  Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Student in your hall"),
                  SizedBox(height: size.height * 0.03 ,),
                  CustomButtonfortable(text: "Seng 308",),
                 Container(
                   height: 300,
                   width: double.infinity,
                   color: Colors.white,
                   child:  _allstudent == null ? Center(child: CircularProgressIndicator(),) :
                   ListView.builder(
                       itemCount: _allstudent!.length,
                       itemBuilder: ( context, index) {
                         final student = _allstudent![index];
                         return  Column(
                           crossAxisAlignment: CrossAxisAlignment.start,
                           children: [
                             SizedBox(height: 10,),
                             InkWell(
                                 onTap: () {
                                   Navigator.of(context).push(MaterialPageRoute(builder: (_) =>  AdCizentshipscore()));
                                 },
                                 child: Text(" ${student.studentname}", style: TextStyle(color: Colors.black),)),
                             SizedBox(height: 5,),
                             Image.asset("image/Rectangle 191.png",height: 2,  width: 350, fit: BoxFit.cover,),


                           ],
                         );
                       }),
                 ),

                  SizedBox(height: size.height * 0.34,),


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
          ],
        ),
      ),
    );
  }
}
