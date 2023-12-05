import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:pfizer/colors_code.dart';
import 'package:pfizer/nfc_activation.dart';
import 'package:qr_flutter/qr_flutter.dart';

class GenerateQRCode extends StatefulWidget {
  const GenerateQRCode({super.key});

  @override
  State<GenerateQRCode> createState() => _GenerateQRCodeState();
}

class _GenerateQRCodeState extends State<GenerateQRCode> {
  TextEditingController controller = TextEditingController();
  GlobalKey globalKey = GlobalKey();
  bool isTextFieldFocused = false;
  bool isVisible = false;

  // Switch button to offline mode Share
  bool isSwitched = false;

  void toggleSwitch(bool value) {
    if (isSwitched == false) {
      setState(() {
        isSwitched = true;
      });
      print('Switch Button is ON');
    } else {
      setState(() {
        isSwitched = false;
      });
      print('Switch Button is OFF');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        margin: const EdgeInsets.only(
          left: 24,
          right: 24,
        ),
        child: ListView(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const SizedBox(
                  height: 60,
                ),
                Image.asset(
                  'assets/logo.png',
                ),
                const SizedBox(
                  height: 48,
                ),
                SizedBox(
                  height: 58,
                  child: TextField(
                    controller: controller,
                    keyboardType: TextInputType.url,
                    decoration: InputDecoration(
                      filled: true,
                      fillColor: ColorsCode.fillTextField,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8),
                        borderSide: BorderSide.none,
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: ColorsCode.bckBtn,
                          width: 2,
                        ),
                      ),
                      hintText: "Please enter profile url",
                      hintStyle: TextStyle(
                        fontSize: 15,
                        color: ColorsCode.txtHint,
                        fontWeight: FontWeight.w500,
                      ),
                      suffixIcon: Container(
                        margin: const EdgeInsets.all(8),
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            minimumSize: const Size(87, 50),
                            backgroundColor: isTextFieldFocused
                                ? ColorsCode.bckBtn
                                : ColorsCode.txtGray,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8.0),
                            ),
                          ),
                          child: const Text(
                            "Generate",
                            style: TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.w400,
                              color: Colors.white,
                            ),
                          ),
                          onPressed: () {
                            setState(() {
                              // Toggle the visibility when the button is clicked
                              isVisible = !isVisible;
                            });
                          },
                        ),
                      ),
                    ),
                    onTap: () {
                      setState(() {
                        isTextFieldFocused = true;
                      });
                    },
                    // onEditingComplete: () {
                    //   setState(() {
                    //     isTextFieldFocused = false;
                    //   });
                    // },
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                Visibility(
                  visible: isVisible,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        width: double.infinity,
                        height: 400,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8),
                          color: Colors.blueGrey.shade50,
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Center(
                                child: QrImageView(
                              data: controller.text,
                              size: 260,
                              embeddedImageStyle: const QrEmbeddedImageStyle(
                                size: Size(100, 100),
                              ),
                            )),
                            const SizedBox(
                              height: 24,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Container(
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(30),
                                    color: Colors.white60,
                                  ),
                                  child: IconButton(
                                    onPressed: () {},
                                    iconSize: 35,
                                    color: Colors.black,
                                    icon: const Icon(Icons.share_outlined),
                                  ),
                                ),
                                const SizedBox(
                                  width: 56,
                                ),
                                Container(
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(30),
                                    color: Colors.white60,
                                  ),
                                  child: IconButton(
                                    onPressed: () {},
                                    iconSize: 35,
                                    color: Colors.black,
                                    icon: const Icon(
                                        Icons.file_download_outlined),
                                  ),
                                ),
                              ],
                            )
                          ],
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          const Icon(
                            Icons.wifi_off_outlined,
                            color: Colors.black,
                            size: 24,
                          ),
                          const SizedBox(
                            width: 8,
                          ),
                          const Text(
                            'Share Offline',
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.w400,
                              color: Colors.black,
                            ),
                          ),
                          const SizedBox(
                            width: 160,
                          ),
                          Transform.scale(
                            scale: 1,
                            child: Switch(
                              onChanged: toggleSwitch,
                              value: isSwitched,
                              activeColor: Colors.white,
                              activeTrackColor: Colors.blue,
                              inactiveThumbColor: Colors.white,
                              inactiveTrackColor: Colors.grey.shade300,
                            ),
                          )
                        ],
                      ),
                      const SizedBox(
                        height: 36,
                      ),
                      SizedBox(
                        height: 58,
                        width: double.infinity,
                        child: ElevatedButton(
                          onPressed: () {
                            Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                builder: ((context) {
                                  return const NfcActivation();
                                }),
                              ),
                            );
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: ColorsCode.bckBtn,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8.0),
                            ),
                          ),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              SvgPicture.asset(
                                "assets/icons/heroicons.svg",
                                color: Colors.white,
                                width: 28,
                                height: 28,
                              ),
                              const Text(
                                'Activate an Ahlan Product',
                                style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w400,
                                  color: Colors.white,
                                ),
                              ),
                              SvgPicture.asset(
                                "assets/icons/outline_arrow.svg",
                                color: Colors.white,
                                width: 24,
                                height: 24,
                              ),
                            ],
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 100,
                      )
                    ],
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
