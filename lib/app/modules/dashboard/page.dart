import 'package:flutter/material.dart';
import 'package:flutter_hortifruti/app/modules/dashboard/controller.dart';
import 'package:get/get.dart';

class DashboardPage extends GetView<DashboardController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text('DashboardPage')),
        body: SafeArea(child: Text('DashboardController')));
  }
}
