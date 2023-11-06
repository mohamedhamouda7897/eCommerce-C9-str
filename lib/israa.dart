
import 'package:ecommerce_c9_str/core/utils/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  runApp(const AppAccount());
}

class AppAccount extends StatelessWidget {
  const AppAccount({super.key});

  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
            initialRoute: Account.routeName,
            debugShowCheckedModeBanner: false,
            routes: {Account.routeName: (context) => Account()},
          );

  }
}
class Account extends StatelessWidget{
  static const String routeName="account";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Padding(
          padding: const EdgeInsets.all(12),
          child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Image.asset("assets/images/logo.png"),
              Text("Welcome, Mohamed",style:GoogleFonts.poppins(
                color: Color(0xFF06004F),
                fontSize: 18,
                fontWeight: FontWeight.w500,
              ),),
                SizedBox(height: 5,),
                Text("mohamed.N@gmail.com",style:GoogleFonts.poppins(
                  color: Color(0xFF06004F).withOpacity(.6),
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                ),),
                 SizedBox(height: 20,),
                 InputField("Your full name","please enter your name"),
                 InputField("Your E-mail","please enter your email"),
                InputField("Your Password","please enter your Password"),
                 InputField("Your mobile number","please enter your phone number"),
                 InputField("Your Address","please enter your address"),
              ],
            ),
          ),
    );
  }
}
class InputField extends StatelessWidget {
String header;
String validateMsg;
TextEditingController myController=TextEditingController();
InputField(this.header,this.validateMsg);
var formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(header,style: GoogleFonts.poppins(
            color: Color(0xFF06004F),
            fontSize: 18,
            fontWeight: FontWeight.w500,
          ),),
          SizedBox(height: 5,),
          TextFormField(
            keyboardType: TextInputType.emailAddress,
            obscureText:(header=="Your Password")?true:false,
            controller:myController,
            validator: (value) {
              if (value == null || value.isEmpty) {
                return validateMsg;
              }
            },
            decoration: InputDecoration(
              suffixIcon: Icon(Icons.edit,color: Color(0xFF06004F),),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(15),
                borderSide: BorderSide(
                  width: 1,
                  color:Color(0xFF004182).withOpacity(.3),
                ),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(15),
                borderSide: BorderSide(
                  color:Color(0xFF004182).withOpacity(.3),
                ),
              ),
            ),
          ),
          SizedBox(height: 10,),
        ],
      ),
    );
  }
}

