import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

import 'colors_code.dart';

class NfcActivation extends StatefulWidget {
  const NfcActivation({super.key});

  @override
  State<NfcActivation> createState() => _NfcActivationState();
}

class _NfcActivationState extends State<NfcActivation> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        margin: const EdgeInsets.only(top: 40, left: 24, right: 24),
        child: ListView(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 34,),
                const Center(
                  child: Text(
                    'To Begin Activation:',
                    style: TextStyle(
                        fontSize:23,
                        fontWeight: FontWeight.w600,
                      color: Colors.black,
                    ),
                  ),
                ),
                const SizedBox(height: 24,),
                const Text(
                  "1. Hold your NFC device near your phone.  \n"
                  '\n'
                  '2. Press “Begin Activation” button',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w400,
                    color: Colors.black87,
                  ),
                ),
                const SizedBox(
                  height: 40,
                ),
                Center(
                  child: Lottie.asset("assets/lottie/activation.json",
                      width: 285,
                      height: 285,
                      fit: BoxFit.fill,
                      animate: true,
                      alignment: Alignment.center),
                ),
                const SizedBox(
                  height: 80,
                ),
                SizedBox(
                  height: 58,
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      backgroundColor: ColorsCode.bckBtn,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                    ),
                    child: const Text(
                      'Begin Activation',
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.w400,
                        fontSize: 20,
                      ),
                    ),
                  ),
                ),

              ],
            ),
          ],
        ),
      ),
    );
  }
}
