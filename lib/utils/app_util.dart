
formatPhoneNumber(String phoneNumber) {
  if (phoneNumber == null || phoneNumber.isEmpty) return '';

  phoneNumber = phoneNumber.replaceAll(RegExp(r'\D'), '');
  if (phoneNumber.length < 11) {
    phoneNumber = '1' + phoneNumber;
  }

  return phoneNumber;
}