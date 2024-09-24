import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../../common/button_widget.dart';
import 'create_new_password.dart';

class VerifyCodeScreen extends StatefulWidget {
  const VerifyCodeScreen({super.key});

  @override
  State<VerifyCodeScreen> createState() => _VerifyCodeScreenState();
}

class _VerifyCodeScreenState extends State<VerifyCodeScreen> {
  FocusNode myFocusNode = FocusNode();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text('Forgot Password'),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Center(
            child: Column(
              children: [
                const SizedBox(
                  height: 60,
                ),
                const Text(
                  'Code has been send to +1 111 ******99',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
                ),
                const SizedBox(
                  height: 60,
                ),
                Form(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      _inputNumberVerify(myFocusNode),
                      _inputNumberVerify(null),
                      _inputNumberVerify(null),
                      _inputNumberVerify(null),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 60,
                ),
                RichText(
                  text: const TextSpan(
                    children: [
                      TextSpan(
                          text: 'Resend code in',
                          style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.w500,
                              color: Colors.black)),
                      TextSpan(
                          text: '53',
                          style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.w500,
                              color: Colors.blueAccent)),
                      TextSpan(
                          text: 's',
                          style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.w500,
                              color: Colors.black)),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 60,
                ),
                ButtonWidget(
                  onPress: () {
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (_) => const CreateNewPassword()));
                  },
                  title: 'Verify',
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  _inputNumberVerify(FocusNode? focus) {
    return SizedBox(
      height: 64,
      width: 70,
      child: TextField(
        onChanged: (value) {
          if (value.length == 1) {
            FocusScope.of(context).nextFocus();
          }
        },
        focusNode: focus?.parent,
        decoration: const InputDecoration(
          border: OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(12)),
              borderSide: BorderSide(width: 1)),
        ),
        style: Theme.of(context).textTheme.titleLarge,
        textAlign: TextAlign.center,
        keyboardType: TextInputType.number,
        inputFormatters: [
          LengthLimitingTextInputFormatter(1),
          FilteringTextInputFormatter.digitsOnly
        ],
      ),
    );
  }
}
