import 'package:e_commercial_app/data/repositories/auth_repository.dart';
import 'package:e_commercial_app/presentation/pages/register/signup_bloc.dart';
import 'package:e_commercial_app/presentation/pages/register/signup_event.dart';
import 'package:e_commercial_app/presentation/pages/register/signup_state.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';

import '../../../data/models/signup/signup_req.dart';
import '../../../di/service_locator.dart';
import '../../../domain/usecases/signup.dart';
import '../../widgets/basic_app_button.dart';
import '../../widgets/button_state.dart';
import '../../widgets/button_state_cubit.dart';
import '../home/home.dart';
import '../login/login_screen.dart';

class SignupPage extends StatelessWidget {
  SignupPage({super.key});

  final TextEditingController _usernameCon = TextEditingController();
  final TextEditingController _emailCon = TextEditingController();
  final TextEditingController _passwordCon = TextEditingController();
  final TextEditingController _phoneCon = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocProvider(
        create: (context) => SignupBloc(signUpUseCase: sl<SignUpUseCase>()),
        child: BlocListener<SignupBloc, SignUpState>(
          listener: (context, state) {
            if (state is SignUpSuccess) {
              Fluttertoast.showToast(
                msg: 'Đăng kí thành công!',
              );

              Fluttertoast.showToast(
                msg: 'Vui lòng dùng tài khoản mới đăng kí để đăng nhập!',
              );

              Future.delayed(Duration(seconds: 7), () {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (context) => SigninPage()),
                );
              });
            }
            else if (state is SignUpFailure) {
              Fluttertoast.showToast(
                msg: state.errorMessage,
              );
            }
          },
          child: SafeArea(
            minimum: const EdgeInsets.only(top: 100, right: 16, left: 16),
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  _signup(),
                  const SizedBox(height: 50,),
                  _userNameField(),
                  const SizedBox(height: 20,),
                  _emailField(),
                  const SizedBox(height: 20,),
                  _phoneField(),
                  const SizedBox(height: 20,),
                  _password(),
                  const SizedBox(height: 60,),
                  _createAccountButton(context),
                  const SizedBox(height: 20,),
                  _signinText(context),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _signup() {
    return const Text(
      'Sign Up',
      style: TextStyle(
          color: Color(0xff2A4ECA),
          fontWeight: FontWeight.bold,
          fontSize: 32
      ),
    );
  }

  Widget _userNameField() {
    return TextField(
      controller: _usernameCon,
      decoration: const InputDecoration(
          hintText: 'Username'
      ),
    );
  }

  Widget _emailField() {
    return TextField(
      controller: _emailCon,
      decoration: const InputDecoration(
          hintText: 'Email'
      ),
    );
  }

  Widget _phoneField() {
    return TextField(
      controller: _phoneCon,
      decoration: const InputDecoration(
          hintText: 'Phone'
      ),
    );
  }

  Widget _password() {
    return TextField(
      controller: _passwordCon,
      decoration: const InputDecoration(
          hintText: 'Password'
      ),
    );
  }

  Widget _createAccountButton(BuildContext context) {
    return Builder(
        builder: (context) {
          return BasicAppButton(
              title: 'create account',
              onPressed: () {
                context.read<SignupBloc>().add(SignUpSubmitted(
                    signUpReqParams: SignupReqParams(
                        username: _usernameCon.text,
                        email: _emailCon.text,
                        phone: _phoneCon.text,
                        password: _passwordCon.text)
                )
                );
              }
          );
        }
    );
  }

  Widget _signinText(BuildContext context) {
    return Text.rich(
      TextSpan(
          children: [
            const TextSpan(
                text: 'Do you have account?',
                style: TextStyle(
                    color: Color(0xff3B4054),
                    fontWeight: FontWeight.w500
                )
            ),
            TextSpan(
                text: ' Sign In',
                style: const TextStyle(
                    color: Color(0xff3461FD),
                    fontWeight: FontWeight.w500
                ),
                recognizer: TapGestureRecognizer()
                  ..onTap = () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => SigninPage(),
                        )
                    );
                  }
            )
          ]
      ),
    );
  }
}