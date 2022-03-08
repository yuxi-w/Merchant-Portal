import 'package:flutter_test/flutter_test.dart';
import 'package:merchant_app/constants/methods/validation_methods.dart';

void main() {
  test('Email input-format test', () async {
    //setup and run
    var emptyEmail = EmailFieldValidator.validate('');
    var badEmail = EmailFieldValidator.validate('asd?@zxc.asd');
    var goodEmail = EmailFieldValidator.validate('asd.qwe@zxc.asd');

    //verify
    expect(emptyEmail, "Enter Correct Email");
    expect(badEmail, "Enter Correct Email");
    expect(goodEmail, null);
  });

  test('Empty input-field test', () async {
    //setup and run
    var emptyField = EmptyFieldValidator.validate('');
    var nonEmptyField = EmptyFieldValidator.validate('Non empty input');

    //verify
    expect(emptyField, "Field can't be empty");
    expect(nonEmptyField, null);
  });

  test('Name input-format test', () async {
    //setup and run
    var emptyName = NameFieldValidator.validate('');
    var badName = NameFieldValidator.validate('Alim123 786');
    var goodName = NameFieldValidator.validate('Alim Manjiyani');

    //verify
    expect(emptyName, "Please enter a valid name");
    expect(badName, "Please enter a valid name");
    expect(goodName, null);
  });

  test('Phone input-format test', () async {
    //setup and run
    var emptyPhone = PhoneFieldValidator.validate('');
    var badPhone1 = PhoneFieldValidator.validate('asdzxc'); //characters
    var badPhone2 = PhoneFieldValidator.validate('123456'); //less than 10-digit
    var goodPhone = PhoneFieldValidator.validate('1234567890');

    //verify
    expect(emptyPhone, "Please enter a valid phone number");
    expect(badPhone1, "Please enter a valid phone number");
    expect(badPhone2, "Please enter a valid phone number");
    expect(goodPhone, null);
  });

  test('ZipCode input-format test', () async {
    //ZipCode Tested based on Canadian Zipcode Format
    //setup and run
    var emptyZip = ZipcodeFieldValidator.validate('');
    var badZip = ZipcodeFieldValidator.validate('K1N 7N8'); //no space allowed
    var goodZip1 = ZipcodeFieldValidator.validate('K1N-7N8');
    var goodZip2 = ZipcodeFieldValidator.validate('K1N7N8');

    // //verify
    expect(emptyZip, "Please enter a valid zip code");
    expect(badZip, "Please enter a valid zip code");
    expect(goodZip1, null);
    expect(goodZip2, null);
  });
}
