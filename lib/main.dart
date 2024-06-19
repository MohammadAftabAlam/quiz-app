import 'package:flutter/material.dart';
import 'package:quiz_app/quiz.dart';

void main() {
  runApp(const Quiz());
}

// class MyApp extends StatelessWidget {
//   const MyApp({super.key});

//   // This widget is the root of your application.
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       debugShowCheckedModeBanner: false,
//       home: Scaffold(
//         body: Container(
//           decoration: const BoxDecoration(
//             /* **************** This is the way to add Linear color to the container ************** */
//             gradient: LinearGradient(colors: [
//               Color.fromARGB(255, 78, 13, 151),
//               Color.fromARGB(255, 107, 15, 168),
//             ], begin: Alignment.topLeft, end: Alignment.bottomRight),
//           ),
//           child: const SplashScreen(),
//         ),
//       ),
//     );
//   }
// }
