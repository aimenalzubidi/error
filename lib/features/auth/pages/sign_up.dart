import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:graduation_project/core/shared/widgets/custom_textformfield.dart';
import 'package:graduation_project/core/util/validator.dart';
import 'package:graduation_project/features/auth/controller/sign_up_controller.dart';

class SignUp extends StatefulWidget {
  const SignUp({super.key});

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  GlobalKey<FormState> formState = GlobalKey();
  TextEditingController confirmPasswordController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController phonecontroller = TextEditingController();

  bool isShow = false;
  bool isObscure = true;
  bool isLoading = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GetBuilder<SignupController>(
        init: SignupController(),

        builder: (controller) {
          return Container(
            padding: EdgeInsets.only(
              left: 20.w,
              right: 20.w,
              bottom: 20.h,
              top: 150.h,
            ),
            color: const Color(0xfff6f6f6),

            child: SingleChildScrollView(
              child: Form(
                key: formState,
                child: Column(
                  children: [
                    Text(
                      "إنشاء حساب جديد",
                      style: Theme.of(context).textTheme.titleLarge,
                    ),
                    SizedBox(height: 40.h),
                    CustomTextFormFeild(
                      inputFormatters: [
                        FilteringTextInputFormatter.allow(
                          RegExp(r'[a-zA-Z\u0600-\u06FF]'),
                        ),
                      ],
                      textAlign: TextAlign.right,
                      textDirection: TextDirection.rtl,
                      labelAlignment: Alignment.centerRight,
                      labelText: "الإسم الأول",
                      maxLength: 30,
                      width: 380.w,
                      height: 100.h,
                      prefix: Icon(
                        Icons.person,
                        color: const Color(0xFFb3de00),
                        size: 25.r,
                      ),
                      validator: (name) => Validator.nameUser(name),
                      onChanged: (text) => formState.currentState!.validate(),
                    ),
                    CustomTextFormFeild(
                      inputFormatters: [
                        FilteringTextInputFormatter.allow(
                          RegExp(r'[a-zA-Z\u0600-\u06FF]'),
                        ),
                      ],
                      textAlign: TextAlign.right,
                      textDirection: TextDirection.rtl,
                      labelAlignment: Alignment.centerRight,
                      labelText: "الإسم الأخير",
                      maxLength: 30,
                      width: 380.w,
                      height: 100.h,
                      prefix: Icon(
                        Icons.person,
                        color: const Color(0xFFb3de00),
                        size: 25.r,
                      ),
                      validator: (name) => Validator.nameUser(name),
                      onChanged: (text) => formState.currentState!.validate(),
                    ),
                    CustomTextFormFeild(
                      controller: phonecontroller,

                      textAlign: TextAlign.start,
                      errortext: controller.phoneerror,
                      width: 385.w,
                      height: 100.h,
                      maxLength: 9,
                      labelText: "رقم الهاتف",
                      keyboardType: TextInputType.number,
                      prefix: Icon(
                        Icons.phone_rounded,
                        color: const Color(0xFFb3de00),
                        size: 20.r,
                      ),
                      validator: (value) => Validator.mobileNo(value),
                      onChanged: (text) => formState.currentState!.validate(),
                    ),

                    CustomTextFormFeild(
                      controller: passwordController,
                      textAlign: TextAlign.start,
                      errortext: controller.passworderror,
                      width: 385.w,
                      height: 100.h,
                      //   validator: (value) => Validator.password(value),
                      obscureText: isObscure,
                      labelText: "كلمة المرور",
                      maxLength: 8,
                      keyboardType: TextInputType.text,
                      prefix: Icon(
                        Icons.lock,
                        color: const Color(0xFFb3de00),
                        size: 20.r,
                      ),

                      sufix: IconButton(
                        onPressed: () {
                          setState(() {
                            isShow = !isShow;
                            isObscure = !isObscure;
                          });
                        },
                        icon: Icon(
                          isShow ? Icons.visibility : Icons.visibility_off,
                          color: const Color(0xFFb3de00),
                          size: 20.r,
                        ),
                      ),
                    ),
                    SizedBox(height: 10.h),
                    CustomTextFormFeild(
                      textAlign: TextAlign.start,
                      width: 385.w,
                      height: 100.h,
                      controller: confirmPasswordController,
                      validator: (confirmPassword) => Validator.confirmPassword(
                        password: passwordController.text,
                        confirmPassword: confirmPassword,
                      ),
                      onChanged: (text) {
                        formState.currentState!.validate();
                      },
                      obscureText: isObscure,
                      labelText: "تأكيد كلمة المرور",
                      maxLength: 8,
                      keyboardType: TextInputType.text,
                      prefix: Icon(
                        Icons.lock,
                        color: const Color(0xFFb3de00),
                        size: 20.r,
                      ),

                      sufix: IconButton(
                        onPressed: () {
                          setState(() {
                            isShow = !isShow;
                            isObscure = !isObscure;
                          });
                        },
                        icon: Icon(
                          isShow ? Icons.visibility : Icons.visibility_off,
                          color: const Color(0xFFb3de00),
                          size: 20.r,
                        ),
                      ),
                    ),
                    SizedBox(height: 20.h),

                    SizedBox(
                      height: 60.h,
                      width: 230.w,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15.r),
                          ),
                        ),

                        onPressed: () {
                          setState(() {
                            controller.createaccount(
                              phone: phonecontroller.text,
                              password: passwordController.text,
                            );
                          });
                        },
                        child: isLoading
                            ? SizedBox(
                                height: 25.h,
                                width: 25.w,
                                child: const CircularProgressIndicator(
                                  color: Colors.white,
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

                    SizedBox(height: 30.h),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        TextButton(
                          onPressed: () {
                            //  Navigator.of(context).pushReplacementNamed("Login");
                          },

                          child: Text(
                            "تسجيل الدخول ",
                            style: Theme.of(context).textTheme.titleSmall!
                                .copyWith(fontWeight: FontWeight.bold),
                          ),
                        ),
                        Text(
                          "لــدي حســاب ؟",
                          style: Theme.of(context).textTheme.bodySmall!
                              .copyWith(color: Colors.black54),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
