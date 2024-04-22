import 'package:provider_project/model/db/database.dart';

class SignUpForm {
  // Personal Data
  String? fullName;
  String? dateOfBirth;
  String? gender;
  String? emailAddress;
  String? phoneNumber;
  String? nationality;
  String? occupation;
  String? username;
  String? password;

  // Address
  String? streetAddress;
  String? city;
  String? stateProvince;
  String? zipCode;
  String? country;

  // Payment Information
  String? creditCardNumber;
  String? expirationDate;
  String? cvv;
  String? billingAddress;
  String? paymentMethod;

  SignUpForm();
  SignUpForm.basic(this.fullName, String username) {
    this.fullName = fullName;
    this.username = username;
  }

  @override
  String toString() {
    return 'SignUpForm{'
        'fullName: $fullName, '
        'dateOfBirth: $dateOfBirth, '
        'gender: $gender, '
        'emailAddress: $emailAddress, '
        'phoneNumber: $phoneNumber, '
        'nationality: $nationality, '
        'occupation: $occupation, '
        'username: $username, '
        'password: $password, '
        'streetAddress: $streetAddress, '
        'city: $city, '
        'stateProvince: $stateProvince, '
        'zipCode: $zipCode, '
        'country: $country, '
        'creditCardNumber: $creditCardNumber, '
        'expirationDate: $expirationDate, '
        'cvv: $cvv, '
        'billingAddress: $billingAddress, '
        'paymentMethod: $paymentMethod'
        '}';
  }

  static Future<List<SignUpForm?>> findFirst() async {
    final db = await Banco.instance.database;
    List<Map<String, Object?>> lista =
        await db.rawQuery('SELECT * FROM form_provider_test');
    List<SignUpForm> dataList = [];
    if (lista.isNotEmpty) {
      for (Map<String, Object?> utemp in lista) {
        dataList.add(SignUpForm.basic(
            utemp['fullName'].toString(), utemp['username'].toString()));
      }
    }
    return dataList;
  }

  Future<int> insertRegister() async {
    final db = await Banco.instance.database;
    return db.rawInsert('''
      INSERT INTO form_provider_test(
    fullName,
    dateOfBirth,
    gender,
    emailAddress,
    phoneNumber,
    nationality,
    occupation,
    username,
    password,
    streetAddress,
    city,
    stateProvince,
    zipCode,
    country,
    creditCardNumber,
    expirationDate,
    cvv,
    billingAddress,
    paymentMethod
) VALUES (
    '${this.fullName}',
    '${this.dateOfBirth}',
    '${this.gender}',
    '${this.emailAddress}',
    '${this.phoneNumber}',
    '${this.nationality}',
    '${this.occupation}',
    '${this.username}',
    '${this.password}',
    '${this.streetAddress}',
    '${this.city}',
    '${this.stateProvince}',
    '${this.zipCode}',
    '${this.country}',
    '${this.creditCardNumber}',
    '${this.expirationDate}',
    '${this.cvv}',
    '${this.billingAddress}',
    '${this.paymentMethod}'
);''');
  }
}
