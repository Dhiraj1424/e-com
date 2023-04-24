import 'package:e_commerce_advance/constants/theme.dart';
import 'package:e_commerce_advance/repositery/shared_prefs.dart';
import 'package:e_commerce_advance/utils/routes/route_name.dart';
import 'package:e_commerce_advance/view/auth/login_page.dart';
import 'package:e_commerce_advance/view/auth/widget/provider/changecolor_provider.dart';
import 'package:e_commerce_advance/viewmodelorcontoller/cart_provider.dart';
import 'package:e_commerce_advance/viewmodelorcontoller/login.dart';
import 'package:e_commerce_advance/viewmodelorcontoller/navbar.dart';
import 'package:e_commerce_advance/viewmodelorcontoller/product_controller.dart';
import 'package:e_commerce_advance/viewmodelorcontoller/single_product.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

import 'utils/routes/routes_constant.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
    systemNavigationBarColor: Colors.transparent, // navigation bar color

    statusBarColor: Colors.transparent, // status bar color
  ));
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(360, 690),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) {
        return MultiProvider(
          providers: [
            ChangeNotifierProvider(create: (_) => NavBarProvider()),
            ChangeNotifierProvider(create: (_) => ProductProvider()),
            ChangeNotifierProvider(create: (_) => SingleProvider()),
                                    ChangeNotifierProvider(create: (_) => SharedPrefs()),

                        ChangeNotifierProvider(create: (_) => LoginProvider()),
                                                ChangeNotifierProvider(create: (_) => ChangeColor()),
                                                ChangeNotifierProvider(create: (_) => CartProvider()),


          ],
          child: MaterialApp(
            debugShowCheckedModeBanner: false,
            title: 'First Method',
            // theme: ThemeData(
            //   //primarySwatch: MaterialStateProperty<Color>
            //   textTheme: Typography.englishLike2018.apply(fontSizeFactor: 1.sp),
            // ),
            theme: AppTheme.lightTheme,
            initialRoute: RouteConstant.splashPage,
            onGenerateRoute: RouteClass.onGenerateRoute,
             //home:const LoginPage(),
          ),
        );
      },
      // child: const HomePage(title: 'First Method'),
    );
  }
}
