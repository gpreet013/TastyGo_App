import "package:flutter/material.dart";
import "package:food_delivery_app/Components/my_button.dart";
import "package:food_delivery_app/Components/my_textfield.dart";
import "package:food_delivery_app/services/auth/auth_service.dart";

class RegisterPage extends StatefulWidget {
  final void Function()? onTap;

  const RegisterPage({
    super.key,
    required this.onTap,
  });

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  //text editing controllers
  final TextEditingController emailcontroller = TextEditingController();
  final TextEditingController passwordcontroller = TextEditingController();
  final TextEditingController confirmcontroller = TextEditingController();

  //register method
  void register() async {
    //  get auth service
    final _authService = AuthService();
    // check of the password match -> create user
    if (passwordcontroller.text == confirmcontroller.text) {
      // trying creating user
      try {
        await _authService.signUpWithEmailPassword(
            emailcontroller.text, passwordcontroller.text);
      }
      // display any error
      catch (e) {
        showDialog(
          // ignore: use_build_context_synchronously
          context: context,
          builder: (context) => AlertDialog(
            title: Text(e.toString()),
          ),
        );
      }
    }

    //if passwords dont  match ->show error
    else {
      showDialog(
        context: context,
        builder: (context) => const AlertDialog(
          title: Text("Password Don't match!"),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // logo
            Icon(
              Icons.lock_open_rounded,
              size: 100,
              color: Theme.of(context).colorScheme.inversePrimary,
            ),
            const SizedBox(height: 25),

            // msg
            Text(
              "Let's create account for you",
              style: TextStyle(
                  fontSize: 16,
                  color: Theme.of(context).colorScheme.inversePrimary),
            ),

            const SizedBox(height: 25),

            // email textfield
            MyTextField(
              controller: emailcontroller,
              hintText: "Enter Your Email",
              obscureText: false,
            ),

            const SizedBox(height: 10),

            //passwords textfields
            MyTextField(
              controller: passwordcontroller,
              hintText: "Password",
              obscureText: true,
            ),

            const SizedBox(height: 10),
            //confirm passwords textfields
            MyTextField(
              controller: confirmcontroller,
              hintText: " Confirm password",
              obscureText: true,
            ),
            const SizedBox(height: 25),
            //sign up  button
            MyButton(
              text: "Sign Up",
              onTap: register,
            ),

            const SizedBox(height: 25),

            //Alreay have an account? Login here
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Alreay have an account? ",
                  style: TextStyle(
                      color: Theme.of(context).colorScheme.inversePrimary),
                ),
                const SizedBox(width: 4),
                GestureDetector(
                  onTap: widget.onTap,
                  child: Text(
                    "Login Now",
                    style: TextStyle(
                      color: Theme.of(context).colorScheme.inversePrimary,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
