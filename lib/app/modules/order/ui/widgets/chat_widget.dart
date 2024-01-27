import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:teste_delivery/app/core/themes/extensions/color_theme_extension.dart';
import 'package:teste_delivery/app/core/themes/extensions/responsive_extension.dart';
import 'package:teste_delivery/app/core/widgets/text_widget.dart';

class ChatWidget extends StatefulWidget {
  final GlobalKey<ScaffoldState> drawerKey;
  const ChatWidget({super.key, required this.drawerKey});

  @override
  State<ChatWidget> createState() => _ChatWidgetState();
}

class _ChatWidgetState extends State<ChatWidget> {
  int isSelected = 0;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(
        top: 35,
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Row(
            children: [
              IconButton(
                onPressed: () {
                  widget.drawerKey.currentState!.closeEndDrawer();
                },
                icon: const Icon(Icons.close),
              ),
              const SizedBox(
                width: 40,
              ),
              const TextWidget(
                'Conversas',
                fontSize: 20,
                fontWeight: FontWeight.w400,
              )
            ],
          ),
          const SizedBox(
            height: 30,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                height: context.screenSize.height - 105.h,
                width: context.screenSize.width * 0.25,
                decoration: BoxDecoration(
                  border: Border(
                    top: BorderSide(color: Colors.grey.shade400, width: 1),
                    right: BorderSide(color: Colors.grey.shade400, width: 1),
                  ),
                ),
                child: ListView.builder(
                  itemCount: 2,
                  itemBuilder: (context, index) {
                    return GestureDetector(
                      onTap: () {
                        setState(() {
                          isSelected = index;
                        });
                      },
                      child: Container(
                        padding: const EdgeInsets.only(
                            top: 14, bottom: 14, left: 37, right: 37),
                        margin:
                            const EdgeInsets.only(left: 13, right: 13, top: 33),
                        decoration: BoxDecoration(
                          border: Border.all(
                              width: 1,
                              color: isSelected == index
                                  ? Colors.black
                                  : Colors.grey.shade300),
                          borderRadius:
                              const BorderRadius.all(Radius.circular(12)),
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                const TextWidget(
                                  'Mariana Oliveira',
                                  fontSize: 20,
                                  fontWeight: FontWeight.w400,
                                ),
                                Visibility(
                                  visible: isSelected == index,
                                  child: const CircleAvatar(
                                    backgroundColor: Colors.black,
                                    radius: 4,
                                  ),
                                )
                              ],
                            ),
                            const SizedBox(
                              height: 8,
                            ),
                            const TextWidget(
                              'Pedido #123434',
                              fontSize: 16,
                              fontWeight: FontWeight.w400,
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                ),
              ),
              Container(
                height: context.screenSize.height - 105.h,
                width: context.screenSize.width * 0.25,
                decoration: BoxDecoration(
                  border: Border(
                    top: BorderSide(color: Colors.grey.shade400, width: 1),
                  ),
                ),
                child: Column(children: [
                  Expanded(
                    child: Container(
                      margin: const EdgeInsets.only(
                        top: 34,
                      ),
                      child: ListView(
                        children: [
                          Container(
                            height: 116,
                            width: context.screenSize.width,
                            padding: const EdgeInsets.all(20),
                            margin: const EdgeInsets.only(
                                left: 13, right: 40, top: 33),
                            decoration: BoxDecoration(
                              color: Colors.grey.shade300,
                              borderRadius:
                                  const BorderRadius.all(Radius.circular(12)),
                            ),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Container(
                                  width: context.screenSize.width,
                                  height: 16,
                                  decoration: const BoxDecoration(
                                    color: Colors.white,
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(12)),
                                  ),
                                ),
                                Container(
                                  width: context.screenSize.width * 0.1,
                                  height: 16,
                                  decoration: const BoxDecoration(
                                    color: Colors.white,
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(12)),
                                  ),
                                ),
                                Container(
                                  width: context.screenSize.width,
                                  height: 16,
                                  decoration: const BoxDecoration(
                                    color: Colors.white,
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(12)),
                                  ),
                                )
                              ],
                            ),
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          Align(
                            alignment: Alignment.centerLeft,
                            child: Padding(
                              padding: const EdgeInsets.only(
                                left: 13,
                              ),
                              child: CircleAvatar(
                                radius: 12,
                                backgroundColor: Colors.grey.shade300,
                              ),
                            ),
                          ),
                          Container(
                            height: 116,
                            width: context.screenSize.width,
                            padding: const EdgeInsets.all(20),
                            margin: const EdgeInsets.only(
                                right: 13, left: 40, top: 33),
                            decoration: BoxDecoration(
                              color: Colors.grey.shade600,
                              borderRadius:
                                  const BorderRadius.all(Radius.circular(12)),
                            ),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Container(
                                  width: context.screenSize.width,
                                  height: 16,
                                  decoration: BoxDecoration(
                                    color: Colors.grey.shade500,
                                    borderRadius: const BorderRadius.all(
                                        Radius.circular(12)),
                                  ),
                                ),
                                Container(
                                  width: context.screenSize.width * 0.1,
                                  height: 16,
                                  decoration: BoxDecoration(
                                    color: Colors.grey.shade500,
                                    borderRadius: const BorderRadius.all(
                                        Radius.circular(12)),
                                  ),
                                ),
                                Container(
                                  width: context.screenSize.width,
                                  height: 16,
                                  decoration: BoxDecoration(
                                    color: Colors.grey.shade500,
                                    borderRadius: const BorderRadius.all(
                                        Radius.circular(12)),
                                  ),
                                )
                              ],
                            ),
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          Align(
                            alignment: Alignment.centerRight,
                            child: Padding(
                              padding: const EdgeInsets.only(
                                right: 13,
                              ),
                              child: CircleAvatar(
                                radius: 12,
                                backgroundColor: Colors.grey.shade300,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Container(
                    //    color: Colors.red,
                    margin:
                        const EdgeInsets.only(left: 16, right: 16, bottom: 16),
                    height: 60,
                    child: Center(
                      child: TextFormField(
                        textAlign: TextAlign.start,
                        cursorColor: context.appColors.grey,
                        obscureText: true,
                        keyboardType: TextInputType.emailAddress,
                        autovalidateMode: AutovalidateMode.onUserInteraction,
                        style: GoogleFonts.roboto(
                          fontSize: 16,
                          fontWeight: FontWeight.w400,
                          color: context.appColors.grey,
                        ),
                        decoration: InputDecoration(
                          contentPadding:
                              const EdgeInsets.only(bottom: 23, left: 10),
                          suffixIcon: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: CircleAvatar(
                              backgroundColor: context.appColors.grey,
                              radius: 1,
                            ),
                          ),
                          hintText: 'Digite aqui',
                          hintStyle: GoogleFonts.roboto(
                              fontSize: 16,
                              fontWeight: FontWeight.w400,
                              color: context.appColors.grey),
                          focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                  width: 0.4, color: context.appColors.grey)),
                          enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                  width: 0.4, color: context.appColors.grey)),
                        ),
                      ),
                    ),
                  ),
                ]),
              )
            ],
          )
        ],
      ),
    );
  }
}
