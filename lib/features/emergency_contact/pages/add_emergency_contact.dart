import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:graduation_project/features/emergency_contact/widgets/list_contact_widget.dart';
import '../../../core/shared/widgets/custom_textformfield.dart';
import '../../../core/util/dialogs.dart';
import '../../../core/util/validator.dart';
import 'package:remixicon/remixicon.dart';
import 'package:flutter_animate/flutter_animate.dart';


class AddEmergencyContact extends StatefulWidget {
  const AddEmergencyContact({super.key});

  @override
  State<AddEmergencyContact> createState() => _AddEmergencyContactState();
}

class _AddEmergencyContactState extends State<AddEmergencyContact> {
  

  final TextEditingController _textController = TextEditingController();
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final TextEditingController _contactController = TextEditingController();

  List<String> phoneNumbers = [];
  String textButton = "إضافة";
  

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.only(top: 110.h, left: 20.w, right: 20.w),

        color: const Color(0xfff6f6f6),

        child: SingleChildScrollView(
          child: Column(
            children: [
              SvgPicture.asset(
                "assets/images/svg/emergency-1.svg",
                width: 250.w,
                height: 250.h,
              ),

              SizedBox(height: 20.h),

              Text(
                "إضافة جهات الطوارئ",
                style: Theme.of(context).textTheme.titleLarge,
                textAlign: TextAlign.end,
              ),
              SizedBox(height: 15.h),
              Text(
                "سيمكنك خيار إضافة جهات إتصال طوارئ من إرسالة نداء إستغاثة بالإضافة الى موقعك على الخريطة عند الضغط على زر(SOS)",
                style: Theme.of(
                  context,
                ).textTheme.bodySmall!.copyWith(color: Colors.black54),
                textAlign: TextAlign.center,
              ),
               SizedBox(height: 15.h),
              SizedBox(
                height: 310.h,
                child: Container(
                 
                  decoration: BoxDecoration(
                    border: BoxBorder.all(color: Color(0xFFb3de00),width: .7),
                    borderRadius: BorderRadius.circular(15.r),
                    color: Colors.white,
                  ),  
                  child: _buildListViewContact(),
                ),
              ),
               
               SizedBox(height: 20.h),
              _buildBottomRowButtons(),
            ],
          ),
        ),
      ),
    );
  }
    @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  void _deleteContact(int index) {
    setState(() {
      phoneNumbers.removeAt(index);
      if (phoneNumbers.length < 3) {
        textButton = "إضافة";
      }
    });
  }
  void _addContact(List<String> phoneNumbers, GlobalKey<FormState> key) {
    if (phoneNumbers.length < 3) {
      showDialog(
        context: context,
        builder: (context) => Form(
          key: key,
          child: LoadingDialog(
            backgroundColor: Colors.white,
            titlePadding: EdgeInsets.all(30.r),
            contentPadding: EdgeInsets.all(25.h),
            title: "إضافة رقم طوارئ",
            content: CustomTextFormFeild(
              validator: (value) =>
                  Validator.contactNumberValidate(value, phoneNumbers),
              keyboardType: TextInputType.number,
              textAlign: TextAlign.start,
              controller: _textController,
              maxLength: 9,
              prefix: Icon(
                Icons.phone_rounded,
                color: const Color(0xFFb3de00),
                size: 20.r,
              ),
              labelText: "رقم الهاتف",
              width: 300.w,
              height: 100.h,
              fillColor: Color(0x11b3de00),
            ),
            actions: [
              OutlinedButton(
                onPressed: () {
                  Navigator.of(context).pop();
                  _textController.clear();
                },

                style: OutlinedButton.styleFrom(
                  side: BorderSide(color: const Color(0xFFb3de00)),
                ),
                child: Text(
                  "إلغاء",
                  style: Theme.of(context).textTheme.titleSmall,
                ),
              ),

              IconButton(
                onPressed: () {
                  if (key.currentState!.validate()) {
                    setState(() {
                      _contactController.text = _textController.text;
                      phoneNumbers.add(_contactController.text);
                      _textController.clear();
                      Navigator.of(context).pop();
                    });
                  }
                },
                icon: Icon(Icons.add, color: Colors.white),
                style: IconButton.styleFrom(
                  backgroundColor: const Color(0xFFb3de00),
                ),
              ),
            ],
          ),
        ),
      );
      if (phoneNumbers.length == 2) {
        textButton = "متابعة";
      }
    }
  }
  Widget _buildListViewContact()
  {
    return ListView.separated(
                    separatorBuilder: (context, index) => Divider(color: Color( 0xFFb3de00),thickness: 1,endIndent: 10,indent: 10,),
                    itemCount: phoneNumbers.length,
                    itemBuilder: (context, index) => ListTileContact(
                      deleteOnPressed: () => _deleteContact(index),
                      contactNumber: phoneNumbers[index],
                    ),
                  );
                
  }
  Widget _buildBottomRowButtons()
  {
    return  Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  SizedBox(
                    height: 60.h,
                    width: 130.w,

                    child: OutlinedButton(
                      style: OutlinedButton.styleFrom(
                        backgroundColor: Colors.white,
                        side: BorderSide(color: const Color(0xFFb3de00)),
                      ),
                      onPressed: () {},
                      child: Text(
                        "تخطي",
                        style: Theme.of(context).textTheme.titleMedium,
                      ),
                    ),
                  ),
                  SizedBox(width: 50.h),

                  SizedBox(
                    height: 60.h,
                    width: 200.w,

                    child: ElevatedButton(
                      onPressed: () => _addContact(phoneNumbers, formKey),
                      child: Text(
                        textButton,
                        style: Theme.of(
                          context,
                        ).textTheme.bodyMedium!.copyWith(color: Colors.white),
                      ),
                    ),
                  ),
                ],

              );

  }

}
