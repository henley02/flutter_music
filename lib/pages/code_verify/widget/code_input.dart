import 'package:flutter/material.dart';
import 'package:flutter_music/res/style.dart';
import 'package:flutter_music/widgets/verifacation_box/verification_box.dart';
import 'package:flutter_music/widgets/verifacation_box/verification_type.dart';

class CodeInput extends StatelessWidget {
  final Function(int code) onCodeComplete;

  const CodeInput({
    Key? key,
    required this.onCodeComplete,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return VerificationBox(
      count: 4,
      type: VerificationBoxItemType.underline,
      borderColor: Colors.white,
      textStyle: Style.puhui30whitebold,
      autoFocus: true,
      cursorEndIndent: 5,
      borderWidth: 2.5,
      onSubmitted: (value) => onCodeComplete(int.parse(value)),
    );
  }
}
