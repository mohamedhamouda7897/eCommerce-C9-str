import 'package:flutter/material.dart';

class LoginScreen extends StatelessWidget {

  TextEditingController userNameController = TextEditingController();

  TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
            image: AssetImage("assets/images/img.png"), fit: BoxFit.cover),
      ),
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0.0,
        ),
        backgroundColor: Colors.transparent,
        body: Padding(
          padding: const EdgeInsets.all(18),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              SizedBox(height: MediaQuery
                  .of(context)
                  .size
                  .height * 0.1),
              Text("Welcome Back To Route", style: TextStyle(fontSize: 24,
                  fontWeight: FontWeight.w300,
                  color: Colors.white)),
              Text("Please sign in with your mail",
                  style: TextStyle(fontSize: 16, color: Colors.white)),
              SizedBox(height: 20),
              Text("User Name", style: TextStyle(color: Colors.white)),
              SizedBox(height: 20),
              TextFormField(
                controller: userNameController,
                keyboardType: TextInputType.emailAddress,
                decoration: InputDecoration(
                  filled: true,
                  fillColor: Colors.white,
                  hintText: 'enter your name',
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(18),
                    borderSide: BorderSide(color: Colors.transparent),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(18),
                    borderSide: BorderSide(color: Colors.transparent),
                  ),
                ),
              ),
              SizedBox(height: 20),
              Text("Password", style: TextStyle(color: Colors.white)),
              SizedBox(height: 20),
              TextFormField(
                obscureText: true,
                controller: passwordController,
                decoration: InputDecoration(
                  suffixIcon: Icon(Icons.visibility_off),
                  filled: true,
                  fillColor: Colors.white,
                  hintText: 'enter your password',
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(18),
                    borderSide: BorderSide(color: Colors.transparent),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(18),
                    borderSide: BorderSide(color: Colors.transparent),
                  ),
                ),
              ),
              SizedBox(height: 20),
              Text("Forgot Password", textAlign: TextAlign.end,
                  style: TextStyle(color: Colors.white)),
              SizedBox(height: 20),
              MaterialButton(
                shape: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                  borderSide: BorderSide(color: Colors.transparent),
                ),
                padding: EdgeInsets.all(18),
                color: Colors.white,
                child: Text("Login",
                  style: TextStyle(color: Color(0xFF004182), fontSize: 18),),
                onPressed: () {

                },),
              SizedBox(height: 20),
              Text("Don’t have an account? Create Account",
                  style: TextStyle(color: Colors.white)),
            ],
          ),
        ),
      ),
    );
  }
}
