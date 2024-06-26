import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:ecommerce/firebase_options.dart';
import 'package:ecommerce/providers/products_provider.dart';
import 'routes/app_routes.dart';
import 'package:provider/provider.dart';

void main() async {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final Future<FirebaseApp> _firebaseInitialization = Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: _firebaseInitialization,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const MaterialApp(
            home: Scaffold(
              body: Center(
                child: CircularProgressIndicator(),
              ),
            ),
          );
        } else if (snapshot.hasError) {
          return MaterialApp(
            home: Scaffold(
              body: Center(
                child: Text('An error occurred'),
              ),
            ),
          );
        }
        return MultiProvider(
          providers: [
            ChangeNotifierProvider(
              create: (_) => ProductsProvider(),
            ),
          ],
          child: MaterialApp(
            darkTheme: ThemeData.dark(),
            themeMode: ThemeMode.dark,
            debugShowCheckedModeBanner: false,
            title: 'Flutter Demo',
            initialRoute: AppRoutes.initialRoute,
            routes: AppRoutes.routes,
            onGenerateRoute: AppRoutes.onGenerateRoute,
            theme: ThemeData(
              scaffoldBackgroundColor: Colors.black,
            ),
          ),
        );
      },
    );
  }
}
