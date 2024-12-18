import 'package:flutter/material.dart';
import 'package:projectpemmob/pages/cart_page.dart';
import 'package:projectpemmob/pages/checkout_page.dart';
import 'package:projectpemmob/pages/checkout_succes_page.dart';
import 'package:projectpemmob/pages/edit_profile_page.dart';
import 'package:projectpemmob/pages/home/main_page.dart';
import 'package:projectpemmob/pages/sign_in_page.dart';
import 'package:projectpemmob/pages/sign_up_page.dart';
import 'package:projectpemmob/pages/splash_page.dart';
import 'package:projectpemmob/providers/auth_provider.dart';
import 'package:projectpemmob/providers/cart_provider.dart';
import 'package:projectpemmob/providers/page_provider.dart';
import 'package:projectpemmob/providers/product_provider.dart';
import 'package:projectpemmob/providers/transaction_provider.dart';
import 'package:projectpemmob/providers/wishlist_provider.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  //await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => AuthProvider(),
        ),
        ChangeNotifierProvider(
          create: (context) => ProductProvider(),
        ),
        ChangeNotifierProvider(
          create: (context) => WishlistProvider(),
        ),
        ChangeNotifierProvider(
          create: (context) => CartProvider(),
        ),
        ChangeNotifierProvider(
          create: (context) => TransactionProvider(),
        ),
        ChangeNotifierProvider(
          create: (context) => PageProvider(),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        routes: {
          '/': (context) => SplashPage(),
          '/sign-in': (context) => SignInPage(),
          '/sign-up': (context) => SignUpPage(),
          '/home': (context) => MainPage(),
          '/edit-profile': (context) => EditProfilePage(),
          '/cart': (context) => CartPage(),
          '/checkout': (context) => CheckoutPage(),
          '/checkout-success': (context) => CheckoutSuccessPage(),
        },
      ),
    );
  }
}
