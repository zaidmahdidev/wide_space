import '../constants.dart';

validateEditTextField(String? val, String fieldName) {
  if (val!.isEmpty) {
    return fieldName + emptyErrorMessage;
  }
}
