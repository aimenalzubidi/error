import 'package:flutter/material.dart';


import 'package:get/get.dart';
import 'package:graduation_project/features/auth/controllers/sign_up_controller.dart';
import 'package:graduation_project/features/auth/pages/sign_in.dart';

class SignUp extends StatefulWidget {
  const SignUp({super.key});

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  late TextEditingController nameController;
  late TextEditingController emailController;
  late TextEditingController passswordController;

  @override
  void initState() {
    nameController = TextEditingController();
    emailController = TextEditingController();
    passswordController = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    nameController.dispose();
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
      appBar: AppBar(),
      body: GetBuilder<SignUpController>(
        init: SignUpController(),
        builder: (controller) {
          return Container(
            padding: EdgeInsets.only(left: 20, right: 20, bottom: 20, top: 50),
            color: const Color(0xfff6f6f6),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  const SizedBox(height: 16),

                  Text(
                    "إنشاء حساب جديد",
                    style: Theme.of(context).textTheme.titleLarge,
                  ),
                  const SizedBox(height: 16),
                  TextFormField(
                    controller: nameController,
                   
                    decoration: InputDecoration(
                      prefixIcon: Icon(
                        Icons.person,
                        color: const Color(0xFFb3de00),
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
                      labelText: "الاسم",
                      hintText: "Ahmed ",
                      border: OutlineInputBorder(
                        borderSide: BorderSide(color: const Color(0xFFb3de00)),
                        borderRadius: BorderRadius.circular(20),
                      ),
                    ),
                  ),
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
                      hintText: " example123 ",
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
                          controller.createAccount(
                            email: emailController.text.trim(),
                            password: passswordController.text.trim(),
                          );
                        });
                        emailController.clear();
                        passswordController.clear();
                        nameController.clear();
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
                 
                  const SizedBox(height: 16),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "لــدي حســاب ؟",
                        style: Theme.of(
                          context,
                        ).textTheme.bodySmall!.copyWith(color: Colors.black54),
                      ),
                      TextButton(
                        onPressed: () {
                          Get.to(() => SignIn());
                        },
                        child: Text(
                          "تسجيل الدخول ",
                          style: Theme.of(context).textTheme.titleSmall!
                              .copyWith(fontWeight: FontWeight.bold),
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
