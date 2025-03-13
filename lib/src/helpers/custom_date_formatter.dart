import 'dart:math';

import 'package:flutter/services.dart';

class CustomDateTextFormatter extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(
      TextEditingValue oldValue, TextEditingValue newValue) {
    var text = _format(newValue.text, '-', oldValue);
    return newValue.copyWith(
        text: text, selection: _updateCursorPosition(text, oldValue));
  }
}

String _format(String value, String separator, TextEditingValue old) {
  var finalString = '';
  var dd = '';
  var mm = '';
  var yyy = '';
  var oldVal = old.text;
  var tempOldval = oldVal;
  var tempValue = value;
  if (!oldVal.contains(separator) ||
      oldVal.isEmpty ||
      separator.allMatches(oldVal).length < 2) {
    oldVal += '---';
  }
  if (!value.contains(separator) || _backSlashCount(value) < 2) {
    value += '---';
  }
  var splitArrOLD = oldVal.split(separator);
  var splitArrNEW = value.split(separator);
  for (var i = 0; i < 3; i++) {
    splitArrOLD[i] = splitArrOLD[i].toString().trim();
    splitArrNEW[i] = splitArrNEW[i].toString().trim();
  }
  // block erasing
  if ((splitArrOLD[0].isNotEmpty &&
      splitArrOLD[2].isNotEmpty &&
      splitArrOLD[1].isEmpty &&
      tempValue.length < tempOldval.length &&
      splitArrOLD[0] == splitArrNEW[0] &&
      splitArrOLD[2].toString().trim() ==
          splitArrNEW[1].toString().trim()) ||
      (_backSlashCount(tempOldval) > _backSlashCount(tempValue) &&
          splitArrNEW[1].length > 2) ||
      (splitArrNEW[0].length > 2 && _backSlashCount(tempOldval) == 1) ||
      (_backSlashCount(tempOldval) == 2 &&
          _backSlashCount(tempValue) == 1 &&
          splitArrNEW[0].length > splitArrOLD[0].length)) {
    finalString = tempOldval; // making the old date as it is
  } else {
    if (splitArrNEW[0].length > splitArrOLD[0].length) {
      if (splitArrNEW[0].length < 3) {
        dd = splitArrNEW[0];
      } else {
        for (var i = 0; i < 2; i++) {
          dd += splitArrNEW[0][i];
        }
      }
      if (dd.length == 2 && !dd.contains(separator)) {
        dd += separator;
      }
    } else if (splitArrNEW[0].length == splitArrOLD[0].length) {
      if (oldVal.length > value.length && splitArrNEW[1].isEmpty) {
        dd = splitArrNEW[0];
      } else {
        dd = splitArrNEW[0] + separator;
      }
    } else if (splitArrNEW[0].length < splitArrOLD[0].length) {
      if (oldVal.length > value.length &&
          splitArrNEW[1].isEmpty &&
          splitArrNEW[0].isNotEmpty) {
        dd = splitArrNEW[0];
      } else if (tempOldval.length > tempValue.length &&
          splitArrNEW[0].isEmpty &&
          _backSlashCount(tempValue) == 2) {
        dd += separator;
      } else {
        if (splitArrNEW[0].isNotEmpty) {
          dd = splitArrNEW[0] + separator;
        }
      }
    }

    if (dd.isNotEmpty) {
      finalString = dd;
      if (dd.length == 2 &&
          !dd.contains(separator) &&
          oldVal.length < value.length &&
          splitArrNEW[1].isNotEmpty) {
        if (separator.allMatches(dd).isEmpty) {
          finalString += separator;
        }
      } else if (splitArrNEW[2].isNotEmpty &&
          splitArrNEW[1].isEmpty &&
          tempOldval.length > tempValue.length) {
        if (separator.allMatches(dd).isEmpty) {
          finalString += separator;
        }
      } else if (oldVal.length < value.length &&
          (splitArrNEW[1].isNotEmpty || splitArrNEW[2].isNotEmpty)) {
        if (separator.allMatches(dd).isEmpty) {
          finalString += separator;
        }
      }
    } else if (_backSlashCount(tempOldval) == 2 && splitArrNEW[1].isNotEmpty) {
      dd += separator;
    }
    if (splitArrNEW[0].length == 3 && splitArrOLD[1].isEmpty) {
      mm = splitArrNEW[0][2];
    }

    if (splitArrNEW[1].length > splitArrOLD[1].length) {
      if (splitArrNEW[1].length < 3) {
        mm = splitArrNEW[1];
      } else {
        for (var i = 0; i < 2; i++) {
          mm += splitArrNEW[1][i];
        }
      }
      if (mm.length == 2 && !mm.contains(separator)) {
        mm += separator;
      }
    } else if (splitArrNEW[1].length == splitArrOLD[1].length) {
      if (splitArrNEW[1].isNotEmpty) {
        mm = splitArrNEW[1];
      }
    } else if (splitArrNEW[1].length < splitArrOLD[1].length) {
      if (splitArrNEW[1].isNotEmpty) {
        mm = splitArrNEW[1] + separator;
      }
    }

    if (mm.isNotEmpty) {
      finalString += mm;
      if (mm.length == 2 && !mm.contains(separator)) {
        if (tempOldval.length < tempValue.length) {
          finalString += separator;
        }
      }
    }
    if (splitArrNEW[1].length == 3 && splitArrOLD[2].isEmpty) {
      yyy = splitArrNEW[1][2];
    }

    if (splitArrNEW[2].length > splitArrOLD[2].length) {
      if (splitArrNEW[2].length < 5) {
        yyy = splitArrNEW[2];
      } else {
        for (var i = 0; i < 4; i++) {
          yyy += splitArrNEW[2][i];
        }
      }
    } else if (splitArrNEW[2].length == splitArrOLD[2].length) {
      if (splitArrNEW[2].isNotEmpty) {
        yyy = splitArrNEW[2];
      }
    } else if (splitArrNEW[2].length < splitArrOLD[2].length) {
      yyy = splitArrNEW[2];
    }

    if (yyy.isNotEmpty) {
      if (_backSlashCount(finalString) < 2) {
        if (splitArrNEW[0].isEmpty && splitArrNEW[1].isEmpty) {
          finalString = separator + separator + yyy;
        } else {
          finalString = finalString + separator + yyy;
        }
      } else {
        finalString += yyy;
      }
    } else {
      if (_backSlashCount(finalString) > 1 && oldVal.length > value.length) {
        var valueUpdate = finalString.split(separator);
        finalString = valueUpdate[0] + separator + valueUpdate[1];
      }
    }

  }


  return finalString;
}

TextSelection _updateCursorPosition(String text, TextEditingValue oldValue) {
  var endOffset = max(
    oldValue.text.length - oldValue.selection.end,
    0,
  );
  var selectionEnd = text.length - endOffset;
  return TextSelection.fromPosition(TextPosition(offset: selectionEnd));
}

int _backSlashCount(String value) {
  return '-'.allMatches(value).length;
}