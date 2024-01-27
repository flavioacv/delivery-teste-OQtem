import 'package:flutter/material.dart';
import 'package:teste_delivery/app/core/service/formatters/date_string_formatters.dart';
import 'package:teste_delivery/app/core/themes/extensions/color_theme_extension.dart';
import 'package:teste_delivery/app/core/widgets/text_widget.dart';
import 'package:teste_delivery/app/modules/order/interactor/models/order_model.dart';

class OrderDetailsWidget extends StatefulWidget {
  final GlobalKey<ScaffoldState> drawerKey;
  final OrderModel order;

  const OrderDetailsWidget({
    super.key,
    required this.drawerKey,
    required this.order,
  });

  @override
  State<OrderDetailsWidget> createState() => _OrderDetailsWidgetState();
}

class _OrderDetailsWidgetState extends State<OrderDetailsWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(top: 35, left: 25, right: 25),
      child: Column(
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
                'Detalhes do pedido',
                fontSize: 20,
                fontWeight: FontWeight.w400,
              )
            ],
          ),
          const SizedBox(
            height: 60,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 15, right: 30),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const TextWidget(
                      'Pedido',
                      fontSize: 16,
                      fontWeight: FontWeight.w400,
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    TextWidget(
                      widget.order.orderId,
                      fontSize: 20,
                      fontWeight: FontWeight.w400,
                    ),
                  ],
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const TextWidget(
                      'Valor do pedido',
                      fontSize: 16,
                      fontWeight: FontWeight.w400,
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    TextWidget(
                      widget.order.value,
                      fontSize: 20,
                      fontWeight: FontWeight.w400,
                    ),
                  ],
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const TextWidget(
                      'Entregar até',
                      fontSize: 16,
                      fontWeight: FontWeight.w400,
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    TextWidget(
                      DateStringFormatters.formatHours(
                          widget.order.deliveryDate),
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
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const TextWidget(
                      'Cliente',
                      fontSize: 16,
                      fontWeight: FontWeight.w400,
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    TextWidget(
                      widget.order.clientName,
                      fontSize: 20,
                      fontWeight: FontWeight.w400,
                    ),
                  ],
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const TextWidget(
                      'Pedidos na loja',
                      fontSize: 16,
                      fontWeight: FontWeight.w400,
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    TextWidget(
                      widget.order.orderIdStore,
                      fontSize: 20,
                      fontWeight: FontWeight.w400,
                    ),
                  ],
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const TextWidget(
                      'Status do pedido',
                      fontSize: 14,
                      fontWeight: FontWeight.w400,
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    TextWidget(
                      widget.order.status,
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
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const TextWidget(
                      'Endereço',
                      fontSize: 16,
                      fontWeight: FontWeight.w400,
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    TextWidget(
                      widget.order.address,
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
                  height: 200,
                  width: context.screenSize.width * 0.4,
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
                        itemCount: widget.order.items.length,
                        shrinkWrap: true,
                        itemBuilder: (context, index) {
                          return TextWidget(
                            'x${widget.order.items[index].number} ${widget.order.items[index].name}',
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
          Expanded(
            child: Padding(
              padding: const EdgeInsets.only(bottom: 30),
              child: Align(
                alignment: Alignment.bottomCenter,
                child: SizedBox(
                  width: context.screenSize.width,
                  child: ElevatedButton(
                    onPressed: () {},
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
                        'Imprimir NF',
                        colorText: context.appColors.white,
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
