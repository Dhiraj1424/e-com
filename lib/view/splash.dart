import 'package:e_commerce_advance/viewmodelorcontoller/check.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  final CheckAuth _auth=CheckAuth();
  @override
  void initState() {
_auth.checkAuth(context);
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold();
  }
}