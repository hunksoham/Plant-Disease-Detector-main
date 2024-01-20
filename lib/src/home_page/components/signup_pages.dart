// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:flutter/material.dart';
// import 'package:fluttertoast/fluttertoast.dart';
//
// import '../../../user_auth/firebase_auth_implementation/firebase_auth_services.dart';
// import '../../../user_auth/presentation/pages/home_page.dart';
// import '../../../user_auth/presentation/pages/signin_page.dart';
// import '../../../user_auth/presentation/pages/widget/form_container_widget.dart';
// import 'package:google_fonts/google_fonts.dart';
//
// class SignUpPage extends StatefulWidget {
//   const SignUpPage({super.key});
//
//   @override
//   State<SignUpPage> createState() => _SignUpPageState();
// }
//
// class _SignUpPageState extends State<SignUpPage> {
//   final FirebaseAuthService _auth = FirebaseAuthService();
//
//   final TextEditingController _usernameController = TextEditingController();
//   final TextEditingController _emailController = TextEditingController();
//   final TextEditingController _passwordController = TextEditingController();
//
//   bool isSigningUp = false;
//
//   @override
//   void dispose() {
//     _usernameController.dispose();
//     _emailController.dispose();
//     _passwordController.dispose();
//     super.dispose();
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         backgroundColor: const Color(0xff296e48),
//         automaticallyImplyLeading: false,
//         title: Center(child: Text("Sign Up",
//             style: GoogleFonts.lobster(
//             fontSize: 25
//         ),
//         )
//         ),
//       ),
//       body: Center(
//         child: Padding(
//           padding: const EdgeInsets.symmetric(horizontal: 15),
//           child: Column(
//             mainAxisAlignment: MainAxisAlignment.center,
//             children: [
//               Container(
//                 child: Image.asset('assets/images/signup.png'),
//                 height: 124,
//
//               ),
//                Text(
//                 "Sign Up",
//                 style:GoogleFonts.lobster(
//                     fontSize: 27,
//                     fontWeight: FontWeight.normal
//                 ),
//               ),
//               const SizedBox(
//                 height: 20,
//               ),
//               FormContainerWidget(
//                 controller: _usernameController,
//                 hintText: "Username",
//                 isPasswordField: false,
//               ),
//               const SizedBox(
//                 height: 10,
//               ),
//               FormContainerWidget(
//                 controller: _emailController,
//                 hintText: "Email",
//                 isPasswordField: false,
//               ),
//               const SizedBox(
//                 height: 10,
//               ),
//               FormContainerWidget(
//                 controller: _passwordController,
//                 hintText: "Password",
//                 isPasswordField: true,
//               ),
//               const SizedBox(
//                 height: 30,
//               ),
//               GestureDetector(
//                 onTap:  (){
//                   _signUp();
//
//                 },
//                 child: Container(
//                   width: double.infinity,
//                   height: 45,
//                   decoration: BoxDecoration(
//                     color: Color(0xff296e48),
//                     borderRadius: BorderRadius.circular(10),
//                   ),
//                   child: Center(
//                       child: isSigningUp ? const CircularProgressIndicator(color: Colors.white,):const Text(
//                         "Sign Up",
//                         style: TextStyle(
//                             color: Colors.white, fontWeight: FontWeight.normal),
//                       )),
//                 ),
//
//               ),
//               const SizedBox(
//                 height: 20,
//               ),
//               Row(
//                 mainAxisAlignment: MainAxisAlignment.center,
//                 children: [
//                   Text("Already have an account?"),
//                   const SizedBox(
//                     width: 5,
//                   ),
//                   GestureDetector(
//                       onTap: () {
//                         Navigator.pushAndRemoveUntil(
//                             context,
//                             MaterialPageRoute(
//                                 builder: (context) => LoginPage()),
//                                 (route) => false);
//                       },
//                       child: const Text(
//                         "Login",
//                         style: TextStyle(
//                             color: Colors.blue, fontWeight: FontWeight.bold),
//                       ))
//                 ],
//               )
//             ],
//           ),
//         ),
//       ),
//     );
//   }
//
//   void _signUp() async {
//
//     setState(() {
//       isSigningUp = true;
//     });
//
//     String username = _usernameController.text;
//     String email = _emailController.text.trim();
//     String password = _passwordController.text;
//
//     User? user = await _auth.signUpWithEmailAndPassword(email, password);
//
//     setState(() {
//       isSigningUp = false;
//     });
//     if (user != null) {
//       Fluttertoast. showToast(msg: "User is successfully created");
//       Navigator.pushReplacement(context,
//           MaterialPageRoute(builder: (_) => const Home()));
//     } else {
//       Fluttertoast.showToast(msg: "Some error happend");
//     }
//   }
// }
//
