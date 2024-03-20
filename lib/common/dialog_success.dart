import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class DialogSuccess extends StatelessWidget {
  const DialogSuccess({super.key});

  @override
  Widget build(BuildContext context) {
    return Dialog(
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10.0)), //this right here
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: SvgPicture.asset(
                  'lib/assets/images/icon_success.svg',
                ),
              ),
              const SizedBox(
                height: 32,
              ),
              const Center(
                child: Text('Congratulations!',
                    style: TextStyle(fontSize: 24, fontWeight: FontWeight.w600)),
              ),
              const SizedBox(
                height: 16,
              ),
              const Center(
                child: Text('Your account is ready to use. You will be redirected to the Home page in a few seconds..', textAlign: TextAlign.center,),
              ),
              const SizedBox(
                height: 16,
              ),
            ],
          ),
        ));
  }
}
