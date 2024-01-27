import 'package:flutter/material.dart';
import 'package:teste_delivery/app/core/navigation/navigation_service.dart';
import 'package:teste_delivery/app/core/themes/extensions/color_theme_extension.dart';
import 'package:teste_delivery/app/core/widgets/text_widget.dart';

class DialogNewOrder extends StatefulWidget {
  final void Function()? onPressed;
  const DialogNewOrder({super.key, this.onPressed});

  @override
  State<DialogNewOrder> createState() => _DialogNewOrderState();
}

class _DialogNewOrderState extends State<DialogNewOrder> {
  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.center,
      child: Material(
        color: Colors.transparent,
        child: Container(
          height: 550,
          width: 480,
          padding: const EdgeInsets.only(top: 20, left: 25, right: 25),
          decoration: const BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.all(Radius.circular(12))),
          child: Column(
            children: [
              Row(
                children: [
                  IconButton(
                    onPressed: () {
                      NavigationService.pop();
                    },
                    icon: const Icon(Icons.close),
                  ),
                  const SizedBox(
                    width: 40,
                  ),
                  const TextWidget(
                    'Novo pedido',
                    fontSize: 20,
                    fontWeight: FontWeight.w400,
                  )
                ],
              ),
              const SizedBox(
                height: 40,
              ),
              const Padding(
                padding: EdgeInsets.only(left: 15, right: 30),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        TextWidget(
                          'Pedido',
                          fontSize: 16,
                          fontWeight: FontWeight.w400,
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        TextWidget(
                          '#45990',
                          fontSize: 20,
                          fontWeight: FontWeight.w400,
                        ),
                      ],
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        TextWidget(
                          'Valor do pedido',
                          fontSize: 16,
                          fontWeight: FontWeight.w400,
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        TextWidget(
                          'R\$45,90',
                          fontSize: 20,
                          fontWeight: FontWeight.w400,
                        ),
                      ],
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        TextWidget(
                          'Entregar até',
                          fontSize: 16,
                          fontWeight: FontWeight.w400,
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        TextWidget(
                          '12:30',
                          fontSize: 20,
                          fontWeight: FontWeight.w400,
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 30,
              ),
              Divider(
                color: context.appColors.grey,
                height: 0.2,
              ),
              const SizedBox(
                height: 30,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 15, right: 30),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    SizedBox(
                      height: 140,
                      width: context.screenSize.width * 0.1,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const TextWidget(
                            'Itens do pedido',
                            fontSize: 16,
                            fontWeight: FontWeight.w400,
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          ListView.builder(
                            itemCount: 2,
                            shrinkWrap: true,
                            itemBuilder: (context, index) {
                              return const TextWidget(
                                '1x Banco',
                                fontSize: 20,
                                fontWeight: FontWeight.w400,
                              );
                            },
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                width: context.screenSize.width,
                child: ElevatedButton(
                  onPressed: widget.onPressed,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: context.appColors.orangeDark,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12), // <-- Radius
                    ),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 30, vertical: 20),
                    child: TextWidget(
                      'Aceitar',
                      colorText: context.appColors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              SizedBox(
                width: context.screenSize.width,
                child: ElevatedButton(
                  onPressed: () {
                    NavigationService.pop();
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.grey.shade300,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12), // <-- Radius
                    ),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 30, vertical: 20),
                    child: TextWidget(
                      'Recusar',
                      colorText: context.appColors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
