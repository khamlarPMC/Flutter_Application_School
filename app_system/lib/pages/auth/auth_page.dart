import 'package:app_system/controllers/login_controller.dart';
import 'package:app_system/controllers/registeration_controller.dart';
import 'package:app_system/pages/auth/widgets/input_fields.dart';
import 'package:app_system/pages/auth/widgets/submit_button.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AuthPage extends StatefulWidget {
  const AuthPage({super.key});

  @override
  State<AuthPage> createState() => _AuthPageState();
}

class _AuthPageState extends State<AuthPage> {
  //register controller
  RegisterationController registerationController =
      Get.put(RegisterationController());
  //login controller
  LoginController loginController = Get.put(LoginController());

  var isLogin = false.obs;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(36),
          child: Center(
            child: Obx(
              () => Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const SizedBox(
                    height: 30,
                  ),
                  const Text(
                    'WELCOME',
                    style: TextStyle(
                      fontSize: 30,
                      color: Colors.black,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      MaterialButton(
                        color: !isLogin.value ? Colors.white : Colors.amber,
                        onPressed: () {
                          isLogin.value = false;
                        },
                        child: const Text('Register'),
                      ),
                      MaterialButton(
                        color: isLogin.value ? Colors.white : Colors.amber,
                        onPressed: () {
                          isLogin.value = true;
                        },
                        child: const Text('Login'),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 80,
                  ),
                  isLogin.value ? loginWidget() : registerWidget()
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget registerWidget() {
    return Column(
      children: [
        InputTextFieldWidget(
          textEditingController: registerationController.nameController,
          hinText: 'Name',
        ),
        const SizedBox(
          height: 20,
        ),
        InputTextFieldWidget(
          textEditingController: registerationController.emailController,
          hinText: 'Email Address',
        ),
        const SizedBox(
          height: 20,
        ),
        InputTextFieldWidget(
          textEditingController: registerationController.passwordController,
          hinText: 'Password',
        ),
        const SizedBox(
          height: 20,
        ),
        SubmitButton(
          onPressed: () async {
            await registerationController.registerWithEmail;
          },
          title: 'Register',
        ),
      ],
    );
  }

  Widget loginWidget() {
    return Column(
      children: [
        InputTextFieldWidget(
          textEditingController: loginController.emailController,
          hinText: 'Email Address',
        ),
        const SizedBox(
          height: 20,
        ),
        InputTextFieldWidget(
          textEditingController: loginController.passwordController,
          hinText: 'Password',
        ),
        const SizedBox(
          height: 20,
        ),
        SubmitButton(
          onPressed: () async {
            await loginController.loginWithEmail;
          },
          title: 'Login',
        ),
      ],
    );
  }
}
