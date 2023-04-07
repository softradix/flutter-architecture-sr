import 'package:get/get.dart';

/*
We make extension over the String.
 */

extension StringExtensions on String?{

  // this ensures that string will not contains "null" entry.
  String? toStringConversion(){
    if(this == "null" || this == null) return null;
    return this;
  }

  // This method convert the string to integer, if string contains numbers only with 0 as default value.
  int toIntConversion(){
    var string = this ?? "";
    if(string != "" && string != "null" && string.isNumericOnly){
      return int.parse(string);
    }
    return 0;
  }

  // This method convert the string to integer, if string contains numbers only with 1 as default value.
  int toIntConversionDefaultOne(){
    var string = this ?? "";
    if(string != "" && string != "null" && string.isNumericOnly){
      return int.parse(string);
    }
    return 1;
  }

  // This method convert the string to double, if string contains numbers and max one dot.
  // Use this method if you want to round of the data upto 2 digits adter dot.

  double toDoubleConversionWithRoundOff(){
    var string = this ?? "";
    if(string != "" && string != "null" && RegExp(r'\d+([\.]\d+)?$').hasMatch(string)){
      var stringWithRound = double.parse(string).toStringAsFixed(2);
      return double.parse(stringWithRound);
    }
    return 0.0;
  }

  // This method convert the string to double, if string contains numbers and max one dot.
  // Use this method if you do not want to round of the data
  double toDoubleConversionWithoutRoundOff(){
    var string = this ?? "";
    if(string != "" && string != "null" && RegExp(r'\d+([\.]\d+)?$').hasMatch(string)){
      return double.parse(string);
    }
    return 0.0;
  }

}