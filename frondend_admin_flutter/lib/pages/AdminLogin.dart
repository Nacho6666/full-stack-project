import 'package:flutter/material.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold( // 添加了 Scaffold
      body: Padding(
        padding: EdgeInsets.symmetric(
            vertical: MediaQuery.of(context).size.height / 6),
        child: Container(
          // width: 320,
          child: Center(child: _formLogin()),
        ),
      ),
    );
  }

  Widget _formLogin() {
    return SizedBox(
      width: 320,
      child: Column(
        children: [
          TextField(
            decoration: InputDecoration(
              hintText: 'Enter email or Phone number',
              filled: true,
              fillColor: Colors.blueGrey[50],
              labelStyle: const TextStyle(fontSize: 12),
              contentPadding: const EdgeInsets.only(left: 30),
              enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.blueGrey.shade50),
                borderRadius: BorderRadius.circular(15),
              ),
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.blueGrey.shade50),
                borderRadius: BorderRadius.circular(15),
              ),
            ),
          ),
          SizedBox(height: 30),
          TextField(
            decoration: InputDecoration(
              hintText: 'Password',
              counterText: 'Forgot password?',
              suffixIcon: const Icon(
                Icons.visibility_off_outlined,
                color: Colors.grey,
              ),
              filled: true,
              fillColor: Colors.blueGrey[50],
              labelStyle: TextStyle(fontSize: 12),
              contentPadding: EdgeInsets.only(left: 30),
              enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.blueGrey.shade50),
                borderRadius: BorderRadius.circular(15),
              ),
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.blueGrey.shade50),
                borderRadius: BorderRadius.circular(15),
              ),
            ),
          ),
          SizedBox(height: 40),
          Container(
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(30),
              boxShadow: [
                BoxShadow(
                  color: Colors.deepPurple.shade100,
                  spreadRadius: 10,
                  blurRadius: 20,
                ),
              ],
            ),
            child: ElevatedButton(
              child: Container(
                  width: double.infinity,
                  height: 50,
                  child: Center(child: Text("Sign In"))),
              onPressed: () => print("it's pressed"),
              style: ElevatedButton.styleFrom(
                primary: Colors.deepPurple,
                onPrimary: Colors.white,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _loginWithButton({required String image, bool isActive = false}) {
    return Container(
      width: 90,
      height: 70,
      decoration: isActive
          ? BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.grey.shade300,
            spreadRadius: 10,
            blurRadius: 30,
          )
        ],
        borderRadius: BorderRadius.circular(15),
      )
          : BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        border: Border.all(color: Colors.grey.shade400),
      ),
      child: Center(
          child: Container(
            decoration: isActive
                ? BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(35),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.shade400,
                  spreadRadius: 2,
                  blurRadius: 15,
                )
              ],
            )
                : BoxDecoration(),
            child: Image.asset(
              '$image',
              width: 35,
            ),
          )),
    );
  }
}
