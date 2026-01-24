class Validator {
  static String? mobileNo(String? mobile) {
    if (mobile == null || mobile.isEmpty) {
      return "الرجاء إدخال رقم الهاتف";
    } else if (!mobile.startsWith('7')) {
      return "رقم الهاتف يجب أن يبدأ بالرقم 7";
    } else if (mobile.length != 9) {
      return "رقم الهاتف يجب أن يتكون من 9 أرقام";
    }
    return null;
  }

  static String? password(String? password) {
    if (password != null && password.isEmpty) {
      return "هذا الحقل مطلوب ";
    } else {
      return null;
    }
  }

  static String? confirmPassword({String? password, String? confirmPassword}) {
    if (confirmPassword != null && confirmPassword.isEmpty) {
      return 'الرجاء تاكيد كلمة المرور';
    } else if (password != confirmPassword) {
      print(" ------------------ ");
      return 'كلمة المرور وتاكيد كلمة المرور غير متطابقة';
    }
    return null;
  }

  static String? nameUser(String? name) {
    if (name != null && name.isEmpty) {
      return "هذا الحقل مطلوب ";
    } else if (name!.length < 2) {
      return 'الإسم الأول يجب أن لايقل عن حرفين';
    }
    return null;
  }


  static String? contactNumberValidate(String? number,List<String>phoneNumber)
  {
      final moblieNo=mobileNo(number);

      if(moblieNo!=null)
      {
        return moblieNo;
      }
      if(phoneNumber.contains(number))
      {
        return "رقم الهاتف تمت إضافته مسبقا";
      }
    return null;
  }
}
