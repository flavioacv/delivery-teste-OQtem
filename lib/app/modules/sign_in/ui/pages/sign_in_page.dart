import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:teste_delivery/app/core/constants/locales/sign_in_locales.dart';
import 'package:teste_delivery/app/core/constants/routes/app_routes.dart';
import 'package:teste_delivery/app/core/navigation/navigation_service.dart';
import 'package:teste_delivery/app/core/themes/extensions/color_theme_extension.dart';
import 'package:teste_delivery/app/core/widgets/text_widget.dart';

class SignInPage extends StatefulWidget {
  const SignInPage({super.key});

  @override
  State<SignInPage> createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
  TextEditingController loginController = TextEditingController();
  TextEditingController passController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox(
        width: context.screenSize.width,
        height: context.screenSize.height,
        child: Row(
          children: [
            Container(
              color: context.appColors.white,
              width: context.screenSize.width * 0.5,
              height: context.screenSize.height,
            ),
            Container(
              color: context.appColors.orange,
              width: context.screenSize.width * 0.5,
              height: context.screenSize.height,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SvgPicture.asset('assets/logo/oqtem-logo.svg'),
                  const SizedBox(
                    height: 60,
                  ),
                  Container(
                    width: 427,
                    height: 359,
                    padding:
                        const EdgeInsets.only(left: 45, right: 45, top: 60),
                    decoration: BoxDecoration(
                        color: Colors.white,
                        boxShadow: [
                          BoxShadow(
                              color: Colors.black.withOpacity(0.05),
                              spreadRadius: 4,
                              blurRadius: 10)
                        ],
                        borderRadius: BorderRadius.circular(8)),
                    child: Column(
                      children: [
                        SizedBox(
                          //    color: Colors.red,
                          height: 40,
                          child: Center(
                            child: TextFormField(
                              textAlign: TextAlign.start,
                              cursorColor: context.appColors.grey,
                              controller: loginController,
                              keyboardType: TextInputType.emailAddress,
                              style: GoogleFonts.roboto(
                                fontSize: 16,
                                fontWeight: FontWeight.w400,
                                color: context.appColors.grey,
                              ),
                              decoration: InputDecoration(
                                contentPadding: const EdgeInsets.only(
                                  bottom: 23,
                                ),
                                prefixIcon: Padding(
                                  padding: const EdgeInsets.only(bottom: 20),
                                  child: CircleAvatar(
                                    backgroundColor: context.appColors.grey,
                                    radius: 10,
                                  ),
                                ),
                                hintText: SignInLocales.email,
                                hintStyle: GoogleFonts.roboto(
                                    fontSize: 18,
                                    fontWeight: FontWeight.w400,
                                    color: context.appColors.grey),
                                focusedBorder: UnderlineInputBorder(
                                    borderSide: BorderSide(
                                        width: 0.4,
                                        color: context.appColors.grey)),
                                enabledBorder: UnderlineInputBorder(
                                    borderSide: BorderSide(
                                        width: 0.4,
                                        color: context.appColors.grey)),
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 27,
                        ),
                        SizedBox(
                          //    color: Colors.red,
                          height: 40,
                          child: Center(
                            child: TextFormField(
                              textAlign: TextAlign.start,
                              cursorColor: context.appColors.grey,
                              controller: passController,
                              obscureText: true,
                              keyboardType: TextInputType.emailAddress,
                              style: GoogleFonts.roboto(
                                fontSize: 16,
                                fontWeight: FontWeight.w400,
                                color: context.appColors.grey,
                              ),
                              decoration: InputDecoration(
                                contentPadding: const EdgeInsets.only(
                                  bottom: 23,
                                ),
                                prefixIcon: Padding(
                                  padding: const EdgeInsets.only(bottom: 20),
                                  child: CircleAvatar(
                                    backgroundColor: context.appColors.grey,
                                    radius: 10,
                                  ),
                                ),
                                hintText: SignInLocales.pass,
                                hintStyle: GoogleFonts.roboto(
                                    fontSize: 18,
                                    fontWeight: FontWeight.w400,
                                    color: context.appColors.grey),
                                focusedBorder: UnderlineInputBorder(
                                    borderSide: BorderSide(
                                        width: 0.4,
                                        color: context.appColors.grey)),
                                enabledBorder: UnderlineInputBorder(
                                    borderSide: BorderSide(
                                        width: 0.4,
                                        color: context.appColors.grey)),
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 40,
                        ),
                        SizedBox(
                          width: context.screenSize.width,
                          child: ElevatedButton(
                            onPressed: () {
                              NavigationService.pushReplacementNamed(
                                context: context,
                                route: AppRoutes.orderRoute,
                              );
                            },
                            style: ElevatedButton.styleFrom(
                              backgroundColor: context.appColors.orangeDark,
                              shape: RoundedRectangleBorder(
                                borderRadius:
                                    BorderRadius.circular(12), // <-- Radius
                              ),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 30, vertical: 20),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  TextWidget(
                                    SignInLocales.enter,
                                    colorText: context.appColors.white,
                                    fontSize: 16,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 30,
                        ),
                        InkWell(
                          onTap: () {},
                          child: Text(
                            SignInLocales.resetPass,
                            style: GoogleFonts.roboto(
                                fontSize: 16,
                                fontWeight: FontWeight.w400,
                                color: context.appColors.grey),
                          ),
                        )
                      ],
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
