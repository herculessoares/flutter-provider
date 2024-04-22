import "package:flutter/material.dart";
import "package:provider_project/model/form.dart";

class FormProvider extends ChangeNotifier {
  SignUpForm formData = SignUpForm();

  void updatePersonalData(SignUpForm newData) {
    formData = newData;
    notifyListeners();
    print(formData.toString());
  }

  void updateAddressData(SignUpForm newData) {
    formData = newData;
    notifyListeners();
  }

  void updatePaymentData(SignUpForm newData) {
    formData = newData;
    notifyListeners();
  }
}
