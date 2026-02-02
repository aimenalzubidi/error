import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';


import 'package:get/get.dart';
import 'package:graduation_project/features/auth/controllers/sign_in_controller.dart';
import 'package:graduation_project/features/auth/pages/sign_up.dart';

class SignIn extends StatefulWidget {
  const SignIn({super.key});

  @override
  State<SignIn> createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  late TextEditingController emailController;
  late TextEditingController passswordController;

  @override
  void initState() {
    emailController = TextEditingController();
    passswordController = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    emailController.dispose();
    passswordController.dispose();
    super.dispose();
  }

  bool isShow = false;
  bool isObscure = true;
  bool isLoading = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GetBuilder<SignInController>(
        init: SignInController(),
        builder: (controller) {
          return Container(
            padding: EdgeInsets.only(left: 20, right: 20, bottom: 20, top: 150),
            color: const Color(0xfff6f6f6),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                 SvgPicture.asset("assets/images/svg/logo-1.svg", width: 250),
                  const SizedBox(height: 16),
                  TextFormField(
                    controller: emailController,
                    //  onChanged: (text) => formState.currentState!.validate(),
                    decoration: InputDecoration(
                      errorText: controller.emailError,
                      prefixIcon: Icon(
                        Icons.email,
                        color: Color(0xFFb3de00),
                        size: 25,
                      ),
                      fillColor: Colors.white,
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.transparent),
                        borderRadius: BorderRadius.circular(20),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: const Color(0xFFb3de00)),
                        borderRadius: BorderRadius.circular(20),
                      ),
                      labelText: "البريد الإلكتروني",
                      hintText: "example@gmail.com",
                      border: OutlineInputBorder(
                        borderSide: BorderSide(color: const Color(0xFFb3de00)),
                        borderRadius: BorderRadius.circular(20),
                      ),
                    ),
                  ),
                 
                  const SizedBox(height: 16),
                  TextFormField(
                    controller: passswordController,
                    //  onChanged: (text) => formState.currentState!.validate(),
                    decoration: InputDecoration(
                      prefixIcon: Icon(
                        Icons.lock,
                        color: const Color(0xFFb3de00),
                        // size: 20,
                      ),
                      fillColor: Colors.white,
                      errorText: controller.passwordError,
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.transparent),
                        borderRadius: BorderRadius.circular(20),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: const Color(0xFFb3de00)),
                        borderRadius: BorderRadius.circular(20),
                      ),
                      labelText: "كلمة المرور",
                      hintText: " example@123 ",
                      border: OutlineInputBorder(
                        borderSide: BorderSide(color: const Color(0xFFb3de00)),
                        borderRadius: BorderRadius.circular(20),
                      ),
                      suffix: IconButton(
                        onPressed: () {
                          setState(() {
                            isShow = !isShow;
                            isObscure = !isObscure;
                          });
                        },
                        icon: Icon(
                          isShow ? Icons.visibility : Icons.visibility_off,
                          color: const Color(0xFFb3de00),
                          // size: 20,
                        ),
                      ),
                    ),
                  ),
                 
                  const SizedBox(height: 16),
                  SizedBox(
                    height: 60,
                    width: 230,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Color(0xFFb3de00),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15),
                        ),
                      ),

                      onPressed: () {
                        setState(() {
                          controller.signIn(
                            email: emailController.text,
                            password: passswordController.text,
                          );
                        });
                        emailController.clear();
                        passswordController.clear();
                      },
                      child: isLoading
                          ? SizedBox(
                              height: 25,
                              width: 25,
                              child: const CircularProgressIndicator(
                                color: Color.fromARGB(255, 255, 255, 255),
                                strokeWidth: 3,
                              ),
                            )
                          : Text(
                              "إنشاء حساب",
                              style: Theme.of(context).textTheme.bodyMedium!
                                  .copyWith(color: Colors.white),
                            ),
                    ),
                  ),
                  SizedBox(height: 10),
                  Text(
                    "أو",
                    style: Theme.of(context).textTheme.titleSmall?.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
                  ),

                  SizedBox(height: 10),
                  SizedBox(
                    height: 60,
                    width: 370,
                    child: OutlinedButton.icon(
                      label: Text(
                        "تسجيل الدخول بإستخدام حساب قوقل",
                        style: Theme.of(context).textTheme.bodySmall?.copyWith(
                          color: Colors.black54,
                          fontSize: 14,
                        ),
                        textAlign: TextAlign.center,
                      ),
                      icon: Icon(
                        Icons.g_mobiledata,
                        color: const Color(0xFFb3de00),
                        size: 35,
                      ),
                      style: OutlinedButton.styleFrom(
                        backgroundColor: Colors.white,
                        side: BorderSide(
                          color: const Color(0xFFb3de00),
                          width: .7,
                        ),
                      ),

                      onPressed: () {},
                    ),
                  ),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "ليس لديك حساب ؟",
                        style: Theme.of(
                          context,
                        ).textTheme.bodySmall?.copyWith(color: Colors.black54),
                      ),
                      TextButton(
                        onPressed: () {
                          Get.to(() => SignUp());
                        },
                        child: Text(
                          " إنشاء حساب ",
                          style: Theme.of(context).textTheme.titleSmall
                              ?.copyWith(fontWeight: FontWeight.bold),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
