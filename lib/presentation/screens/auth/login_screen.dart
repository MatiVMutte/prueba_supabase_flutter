import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:prueba_flutte/presentation/providers/auth/user_provider.dart';

class LoginScreen extends ConsumerWidget {

  static const name = "/";
  final TextEditingController emailText = TextEditingController();
  final TextEditingController passwordText = TextEditingController();

  LoginScreen({ super.key });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = Theme.of(context).colorScheme;

    return Scaffold(

      backgroundColor: theme.onPrimary,

      appBar: AppBar(
        title: Text("L o g  I n"),
        backgroundColor: theme.primaryContainer,
        centerTitle: true,
      ),

      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Center(
          child: Column(
            spacing: 20,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
        
        
              SizedBox(
                width: 500,
                child: TextField(
                  controller: emailText,
                  decoration: InputDecoration(
                    prefixIcon: Icon(Icons.email),
                    hintText: "Email",
                    hintStyle: TextStyle(
                      color: theme.secondary
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: theme.secondary
                      )
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: theme.secondary,
                        width: 2
                      )
                    )
                  ),
                ),
              ),
        
              SizedBox(
                width: 500,
                child: TextField(
                  controller: passwordText,
                  obscureText: true,
                  decoration: InputDecoration(
                    prefixIcon: Icon(Icons.lock),
                    hintText: "Password",
                    hintStyle: TextStyle(
                      color: theme.secondary
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: theme.secondary
                      )
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: theme.secondary,
                        width: 2
                      )
                    )
                  ),
                ),
              ),
        
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  maximumSize: Size(500, 60),
                  minimumSize: Size(500, 60),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10)
                  ),
                  backgroundColor: theme.primaryContainer
                ),
                onPressed: () async {

                  bool state = false;
            
                  if( emailText.text.isEmpty || passwordText.text.isEmpty ) {
                    return;
                  }

                  await ref.read( userSignInProvider.notifier ).signInWithCredentials(email: emailText.text, password: passwordText.text);

                  // state = ref.read( userSignInProvider );

                  if( state ) {
                    // ignore: use_build_context_synchronously
                    context.go("/home");
                  }

                },
                child: Text(
                  "Log In",
                  style: GoogleFonts.montserrat(
                    fontSize: 20,
                    letterSpacing: 2,
                    color: theme.onPrimaryContainer
                  ),
                ),
              )

            ],
          ),
        ),
      ),

    );
  }
}