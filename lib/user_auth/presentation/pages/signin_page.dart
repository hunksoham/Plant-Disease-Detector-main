import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:plant_disease_detector/user_auth/presentation/pages/signup_pages.dart';
import 'package:plant_disease_detector/user_auth/presentation/pages/widget/form_container_widget.dart';
import '../../firebase_auth_implementation/firebase_auth_services.dart';
import 'package:google_fonts/google_fonts.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  bool _isSigning = false;
  final FirebaseAuthService _auth = FirebaseAuthService();
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
    backgroundColor:Colors.white,
      appBar: AppBar(
        backgroundColor: const Color(0xff296e48),
        automaticallyImplyLeading: false,
        title:  Center(child: Text(
          "Login Page",
          style:GoogleFonts.lobster(
              fontSize: 30, fontWeight: FontWeight.normal,letterSpacing: 2.5,
          ),
        )
        ),
      ),
      body: Center(
        

        child: Padding(
          
          padding: const EdgeInsets.symmetric(horizontal: 15),

          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
             Container(
              child: Image.asset('assets/images/signin.png'),
               height: 120,
               width: 400,

             ),
               Text(
                "Login",
                style:GoogleFonts.lobster(
                 fontSize: 40, fontWeight: FontWeight.normal,letterSpacing: 2.5,
                ),
              ),
              const SizedBox(
                height: 14,
              ),
              FormContainerWidget(
                controller: _emailController,
                hintText: "Email",
                isPasswordField: false,
              ),
              const SizedBox(
                height: 5,
              ),
              FormContainerWidget(
                controller: _passwordController,
                hintText: "Password",
                isPasswordField: true,
              ),
              const SizedBox(
                height: 5,
              ),
              GestureDetector(
                onTap: () {
                  _signIn();
                },
                child: Container(
                  width: double.infinity,
                  height: 45,
                  decoration: BoxDecoration(
                    color: Color(0xff296e48),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Center(

                    child: _isSigning ? const CircularProgressIndicator(
                      color: Colors.white,) :  Text(
                      "Login",
                      style: GoogleFonts.lobster(
                        color: Colors.white,
                        fontWeight: FontWeight.normal,letterSpacing: 3.5,fontSize: 15
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(height: 5,),
              GestureDetector(
                onTap: () {
                  _signInWithGoogle();

                },
                child: Container(
                  width: double.infinity,
                  height: 45,
                  decoration: BoxDecoration(

                    color:  Color(0xff296e48),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child:  Center(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(FontAwesomeIcons.google, color: Colors.white,),
                        SizedBox(width: 5,),
                        Text(
                          "Sign in with Google",
                          style: GoogleFonts.lobster(
                              color: Colors.white,
                              fontWeight: FontWeight.normal,letterSpacing: 2.5,fontSize: 15
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),


              const SizedBox(
                height: 5,
              ),

              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("Don't have an account?"),
                  const SizedBox(
                    width: 5,
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.pushAndRemoveUntil(
                        context,
                        MaterialPageRoute(builder: (context) => SignUpPage()),
                            (route) => false,
                      );
                    },
                    child: const Text(
                      "Sign Up",
                      style: TextStyle(
                        color: Colors.blue,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _signIn() async {
    setState(() {
      _isSigning = true;
    });

    String email = _emailController.text.trim();
    String password = _passwordController.text;

    User? user = await _auth.signInWithEmailAndPassword(email, password);

    setState(() {
      _isSigning = false;
    });

    if (user != null) {

      Fluttertoast.showToast(msg: "User is successfully signed in");
      Navigator.pushNamed(context, "/home");
    } else {
      Fluttertoast.showToast(msg: "some error occurred");

    }
  }


  _signInWithGoogle()async{

    final GoogleSignIn _googleSignIn = GoogleSignIn();

    try {

      final GoogleSignInAccount? googleSignInAccount = await _googleSignIn.signIn();

      if(googleSignInAccount != null ){
        final GoogleSignInAuthentication googleSignInAuthentication = await
        googleSignInAccount.authentication;

        final AuthCredential credential = GoogleAuthProvider.credential(
          idToken: googleSignInAuthentication.idToken,
          accessToken: googleSignInAuthentication.accessToken,
        );

        await _firebaseAuth.signInWithCredential(credential);
        Navigator.pushNamed(context, " /home");
      }

    }catch(e) {

      Fluttertoast.showToast(msg: "some error occured $e");
    }


  }


}
