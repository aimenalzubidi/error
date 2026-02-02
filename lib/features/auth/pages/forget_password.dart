import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:graduation_project/core/shared/widgets/custom_textformfield.dart';
import '../../../core/util/validator.dart';

class ForgetPassword extends StatefulWidget {
  const ForgetPassword({super.key});

  @override
  State<ForgetPassword> createState() => _ForgetPasswordState();
}

class _ForgetPasswordState extends State<ForgetPassword> {
  final TextEditingController _phoneController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmController = TextEditingController();

  final GlobalKey<FormState> formState = GlobalKey<FormState>();

  bool isPasswordVisible = false;

  bool isShow = false;
  bool isScure = true;

  @override
  void dispose() {
    _phoneController.dispose();
    _passwordController.dispose();
    _confirmController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.only(top: 70.h, left: 15.w, right: 15.w),
        width: double.infinity,
        height: double.infinity,
        color: const Color(0xfff6f6f6),

        child: SingleChildScrollView(
          child: Column(
            children: [
              SvgPicture.asset(
                "assets/images/svg/forget-1.svg",
                width: 230.w,
                height: 230.h,
              ),

              SizedBox(height: 20.h),

              Text(
                "تغيير كلمة المرور",
                style: Theme.of(context).textTheme.titleLarge,
                textAlign: TextAlign.end,
              ),
              SizedBox(height: 20.h),

              Form(
                key: formState,
                child: Column(
                  children: [
                    CustomTextFormFeild(
                      textAlign: TextAlign.start,
                      width: 385.w,
                      height: 100.h,
                      controller: _phoneController,
                      labelText: "أدخل رقم الهاتف",
                      keyboardType: TextInputType.number,
                      maxLength: 9,
                      inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                      prefix: Icon(
                        Icons.phone_rounded,
                        color: Color(0xFFb3de00),
                        size: 20.r,
                      ),
                      validator: (value) => Validator.mobileNo(value),
                      onChanged: (text) {
                        formState.currentState!.validate();
                      },
                    ),
                    SizedBox(height: 20.h),
                    CustomTextFormFeild(
                      textAlign: TextAlign.start,
                      width: 385.w,
                      height: 100.h,
                      controller: _passwordController,
                      obscureText: isScure,
                      labelText: "كلمة المرور الجديدة",

                      keyboardType: TextInputType.text,
                      prefix: Icon(
                        Icons.lock,
                        color: Color(0xFFb3de00),
                        size: 20.r,
                      ),
                      validator: (value) => Validator.password(value),
                      onChanged: (text) {
                        formState.currentState!.validate();
                      },
                      sufix: IconButton(
                        onPressed: () {
                          setState(() {
                            isShow = !isShow;
                            isScure = !isScure;
                          });
                        },
                        icon: Icon(
                          isShow ? Icons.visibility : Icons.visibility_off,
                          color: const Color(0xFFb3de00),
                          size: 20.r,
                        ),
                      ),
                    ),

                    CustomTextFormFeild(
                      textAlign: TextAlign.start,
                      width: 385.w,
                      height: 100.h,
                      controller: _confirmController,
                      obscureText: isScure,
                      labelText: "تأكيد كلمة المرور ",

                      keyboardType: TextInputType.text,
                      prefix: Icon(
                        Icons.lock,
                        color: Color(0xFFb3de00),
                        size: 20.r,
                      ),
                      validator: (confirmPassword) => Validator.confirmPassword(
                        password: _passwordController.text,
                        confirmPassword: confirmPassword,
                      ),
                      onChanged: (text) {
                        formState.currentState!.validate();
                      },
                      sufix: IconButton(
                        onPressed: () {
                          setState(() {
                            isShow = !isShow;
                            isScure = !isScure;
                          });
                        },
                        icon: Icon(
                          isShow ? Icons.visibility : Icons.visibility_off,
                          color: const Color(0xFFb3de00),
                          size: 20.r,
                        ),
                      ),
                    ),
                  ],
                ),
              ),

              SizedBox(height: 30.h),

              SizedBox(
                height: 60.h,
                width: 330.w,
                child: ElevatedButton(
                  onPressed: () {
                    // if (formState.currentState!.validate()) {
                    //   Navigator.push(
                    //     context,
                    //     MaterialPageRoute(builder: (context) => SizedBox()),
                    //   );
                    // }
                  },
                  child: Text(
                    "تأكيد",
                    style: Theme.of(
                      context,
                    ).textTheme.bodyMedium!.copyWith(color: Colors.white),
                  ),
                ),
              ),
              SizedBox(height: 15.h),
              SizedBox(
                height: 60.h,
                width: 330.w,
                child: OutlinedButton(
                  style: OutlinedButton.styleFrom(
                    side: BorderSide(color: const Color(0xFFb3de00)),
                  ),

                  onPressed: () {
                    //  Navigator.of(context).pushReplacementNamed("Login");
                  },
                  child: Text(
                    "عودة إلى صفحة تسجيل الدخول",
                    style: Theme.of(
                      context,
                    ).textTheme.bodySmall!.copyWith(color: Colors.black54),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
