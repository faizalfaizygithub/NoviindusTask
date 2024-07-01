import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:task/controller/provider/login_provider.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController numberController = TextEditingController();
  final TextEditingController codeController = TextEditingController();
  final fkey = GlobalKey<FormState>();
  // @override
  // void initState() {
  //   WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
  //     Provider.of<LoginProvider>(context, listen: false);
  //   });
  //   super.initState();
  // }

  @override
  void dispose() {
    numberController.dispose();
    codeController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<LoginProvider>(
      builder: (context, value, child) => Scaffold(
        body: Padding(
          padding: const EdgeInsets.only(left: 20.0, top: 50, right: 10),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Enter Your\nMobile Number',
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                const Text(
                  'Lorem ipsum dolor sit amet consecture.Porta at id hac vitae .Et tourtor at vehicula eisumood mi viverra',
                  style: TextStyle(color: Colors.grey, fontSize: 8),
                ),
                const SizedBox(
                  height: 30,
                ),
                Form(
                  key: fkey,
                  child: Row(children: [
                    SizedBox(
                      height: 80,
                      width: 80,
                      child: TextFormField(
                        controller: numberController,
                        style:
                            const TextStyle(color: Colors.white, fontSize: 12),
                        validator: (value) {
                          if (value!.isEmpty) {
                            return "code is empty";
                          }
                          return null;
                        },
                        decoration: InputDecoration(
                          hintText: 'code',
                          hintStyle:
                              const TextStyle(color: Colors.grey, fontSize: 10),
                          contentPadding: const EdgeInsets.all(10),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(15),
                            borderSide: const BorderSide(
                              color: Colors.grey,
                            ),
                          ),
                          focusedErrorBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(15),
                            borderSide: const BorderSide(
                              color: Colors.red,
                            ),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(15),
                            borderSide: const BorderSide(
                              color: Colors.grey,
                            ),
                          ),
                          errorBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(15),
                            borderSide: const BorderSide(
                              color: Colors.red,
                            ),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    Container(
                      height: 80,
                      width: 230,
                      child: TextFormField(
                        controller: codeController,
                        style:
                            const TextStyle(color: Colors.white, fontSize: 12),
                        validator: (value) {
                          if (value!.isEmpty) {
                            return "number is empty";
                          }
                          return null;
                        },
                        decoration: InputDecoration(
                          hintText: 'Enter your number',
                          // contentPadding: EdgeInsets.all(10),
                          hintStyle:
                              const TextStyle(color: Colors.grey, fontSize: 10),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(15),
                            borderSide: const BorderSide(
                              color: Colors.grey,
                            ),
                          ),
                          focusedErrorBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(15),
                            borderSide: const BorderSide(
                              color: Colors.red,
                            ),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(15),
                            borderSide: const BorderSide(
                              color: Colors.grey,
                            ),
                          ),
                          errorBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(15),
                            borderSide: const BorderSide(
                              color: Colors.red,
                            ),
                          ),
                        ),
                        maxLength: 10,
                      ),
                    ),
                  ]),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.4,
                ),
                Align(
                  alignment: Alignment.center,
                  child: Container(
                    padding: const EdgeInsets.only(left: 20, right: 6),
                    height: 60,
                    width: 170,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(50),
                      border: Border.all(color: Colors.grey),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text(
                          'Continue',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 10,
                          ),
                        ),
                        GestureDetector(
                          onTap: () async {
                            if (fkey.currentState!.validate()) {
                              value.loginData(context,
                                  country_code: codeController.text.trim(),
                                  phone: numberController.text.trim());
                            }
                          },
                          child: Container(
                            height: 50,
                            width: 50,
                            decoration: const BoxDecoration(
                                color: Colors.red, shape: BoxShape.circle),
                            child: const Icon(
                              Icons.arrow_forward_ios,
                              color: Colors.white,
                              size: 18,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
