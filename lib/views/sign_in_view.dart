import 'package:flutter/material.dart';
import 'package:https/viewmodels/sign_in_view_model.dart';
import 'package:provider/provider.dart';

class SignInView extends StatefulWidget {
  const SignInView({super.key});

  @override
  State<SignInView> createState() => _SignInViewState();
}

class _SignInViewState extends State<SignInView> {
  final SignInViewModel _signInViewModel = SignInViewModel();

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => _signInViewModel,
      child: Scaffold(
        body: SafeArea(
          child: Consumer<SignInViewModel>(
            builder: (_, viewModel, __) {
              return Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 20,
                  vertical: 10
                ),
                child: Column(
                  children: [
                    TextField(
                      controller: viewModel.userController,
                    ),
                    TextField(
                      controller: viewModel.passController,
                    ),
                    ElevatedButton(
                        onPressed: () {viewModel.onClickLoginButton(context);},
                        child: const Text("Login")
                    )
                  ],
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
