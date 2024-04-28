class Validator {

  static validateNonNullOrEmpty(value, fieldName) {
    if (value == null || value.toString().trim().isEmpty) {
      return '$fieldName is required';
    } else {
      return null;
    }
  }

  static isValidURL(value, fieldName, {bool required = true}) {
    final RegExp urlRegex = RegExp(
      r'^(?:http:\/\/|https:\/\/)?(?:www\.)?[a-zA-Z0-9-]+(?:\.[a-zA-Z]{2,})+(?:\/\S*)?$',
    );
    if (value == null || value.toString().trim().isEmpty) {
      if(!required){
        return null;
      }
      return '$fieldName is required';
    } 
    var isUrl = urlRegex.hasMatch(value);
    if(!isUrl){
      return '$fieldName is not a valid URL';
    }else{
      return null;
    }
  }

  static validatePhoneNumber(
    String? value, {
    String? fieldName,
    bool required = true
  }) {
    if (value == null || value.toString().trim().isEmpty) {
      if(!required){
        return null;
      }
      return '${fieldName ?? 'Mobile Number'} is required';
    } else if (value.length != 10) {
      return 'Enter a valid mobile number';
    } else if (!value.startsWith('6') &&
        !value.startsWith('7') &&
        !value.startsWith('8') &&
        !value.startsWith('9')) {
      return 'Enter a valid mobile number';
    }else{
      return null;
    }
  }

  static validateEmail(value, {bool required = true}) {
    if (value == null || value.toString().trim().isEmpty) {
      if(!required){
        return null;
      }

      return 'Email address is required';
    } else {
      final emailRegex = RegExp(
        r'^[a-zA-Z0-9.!#$%&’*+/=?^_`{|}~-]+@[a-zA-Z0-9-]+(?:\.[a-zA-Z0-9-]+)*$',
      );
      if (!emailRegex.hasMatch(value)) {
        return 'Enter a valid email address';
      } else {
        return null;
      }
    }
  }

}