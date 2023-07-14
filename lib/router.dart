
import 'package:flutter/material.dart';
import 'package:schoolumis/features/student/dashboardstudent.dart';

Route<dynamic> generateRoute (RouteSettings routeSettings) {
  switch (routeSettings.name) {
    case DashboardStudent.routeName:
      return MaterialPageRoute(
          settings: routeSettings,
          builder: (_) => DashboardStudent());
      default:
      return MaterialPageRoute(builder: (_) =>
          Scaffold(
            body: Center(child: Text("page not "),),));
  }
}