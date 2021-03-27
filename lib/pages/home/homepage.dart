import 'package:flutter/material.dart';
import 'package:flutter_firebase_setup/pages/home/widgets/homepage_widgets.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home'),
      ),
      body: SafeArea(
        child: Center(
          child: Column(
            children: [
              HomePageImage(),
              LogoutButton(isSubmitting: false),
            ],
          ),
        ),
      ),
    );
  }
}
