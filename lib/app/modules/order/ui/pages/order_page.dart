import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:teste_delivery/app/core/navigation/navigation_service.dart';
import 'package:teste_delivery/app/core/service/formatters/date_string_formatters.dart';
import 'package:teste_delivery/app/core/service/snack_bar/snack_bar.dart';
import 'package:teste_delivery/app/core/themes/extensions/color_theme_extension.dart';
import 'package:teste_delivery/app/core/themes/extensions/responsive_extension.dart';
import 'package:teste_delivery/app/core/widgets/shimmer_loading_widget.dart';
import 'package:teste_delivery/app/core/widgets/text_widget.dart';
import 'package:teste_delivery/app/modules/order/interactor/controllers/order_controller.dart';
import 'package:teste_delivery/app/modules/order/interactor/models/order_model.dart';
import 'package:teste_delivery/app/modules/order/interactor/state/order_state.dart';
import 'package:teste_delivery/app/modules/order/ui/widgets/chat_widget.dart';
import 'package:teste_delivery/app/modules/order/ui/widgets/dropdown_button_widget.dart';
import 'package:teste_delivery/app/modules/order/ui/widgets/order_details_widget.dart';

class OrderPage extends StatefulWidget {
  final OrderController orderController;
  const OrderPage({super.key, required this.orderController});

  @override
  State<OrderPage> createState() => _OrderPageState();
}

const List<String> list = <String>[
  'Todos',
  'Recebido',
  'Em preparo',
  'Concluido',
  'Recusados'
];

class _OrderPageState extends State<OrderPage> with TickerProviderStateMixin {
  TabController? controller;
  var scaffoldKey = GlobalKey<ScaffoldState>();
  bool isDetails = false;
  late Timer timer;
  final List<Tab> myTabs = list
      .map((e) => Tab(
            child: TextWidget(
              e,
              fontSize: 20,
              fontWeight: FontWeight.w600,
            ),
          ))
      .toList();
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    widget.orderController.order.addListener(listener);
    widget.orderController.getOrders();
    controller = TabController(length: myTabs.length, vsync: this);
    timer = Timer.periodic(
        const Duration(seconds: 10), (Timer t) => showCustomDialog(context));
  }

  void listener() {
    final order = widget.orderController.order.value;
    if (order is OrderFailure) {
      SnackBarService.showError(
        context: context,
        message: order.appException!.message,
      );
    }
  }

  void showCustomDialog(BuildContext context) {
    showDialog(
      barrierDismissible: false,
      context: context,
      builder: (BuildContext cxt) {
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
                      onPressed: () {
                        NavigationService.pop();
                      },
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
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: widget.orderController.order,
      builder: (context, state, __) {
        return Scaffold(
          key: scaffoldKey,
          endDrawer: Drawer(
            shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.zero),
            ),
            width: context.screenSize.width * 0.5,
            child: isDetails
                ? OrderDetailsWidget(drawerKey: scaffoldKey)
                : ChatWidget(drawerKey: scaffoldKey),
          ),
          floatingActionButton: Padding(
            padding: const EdgeInsets.only(bottom: 20, right: 8),
            child: InkWell(
              onTap: () async {
                isDetails = false;
                setState(() {});
                scaffoldKey.currentState!.openEndDrawer();
              },
              child: Stack(
                children: [
                  CircleAvatar(
                    radius: 40,
                    backgroundColor: context.appColors.grey,
                    child: SvgPicture.asset(
                      'assets/icons/message-circle.svg',
                      width: 30,
                      height: 30,
                    ),
                  ),
                  Positioned(
                    right: 0,
                    top: 0,
                    child: CircleAvatar(
                      radius: 10,
                      backgroundColor: context.appColors.white,
                    ),
                  )
                ],
              ),
            ),
          ),
          body: Container(
            color: context.appColors.whiteOrange,
            width: context.screenSize.width,
            height: context.screenSize.height,
            child: Column(
              children: [
                buildHeader(state),
                buildBody(state),
              ],
            ),
          ),
        );
      },
    );
  }

  Widget buildHeader(OrderState state) {
    return Container(
      width: context.screenSize.width,
      height: 84,
      padding: const EdgeInsets.symmetric(
        horizontal: 60,
      ),
      color: context.appColors.white,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Hero(
            tag: "HeroOne",
            child: SvgPicture.asset(
              'assets/logo/oqtem-logo.svg',
              height: 35.71,
              width: 131,
              colorFilter: ColorFilter.mode(
                context.appColors.orange,
                BlendMode.srcIn,
              ),
            ),
          ),
          SizedBox(
            child: Row(
              children: [
                TextWidget(
                  'Restaurante da Maria',
                  colorText: context.appColors.orange,
                  fontSize: 20,
                ),
                const SizedBox(
                  width: 10,
                ),
                CircleAvatar(
                  backgroundColor: context.appColors.orange,
                  radius: 30,
                ),
                const SizedBox(
                  width: 10,
                ),
                const Icon(Icons.keyboard_arrow_down_rounded)
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget buildBody(OrderState state) {
    return SizedBox(
      width: context.screenSize.width,

      // color: context.appColors.white,
      child: Column(
        children: [
          buildTap(state),
          buildListOrder(state),
        ],
      ),
    );
  }

  Widget buildTap(OrderState state) {
    return SizedBox(
      width: context.screenSize.width,
      height: 100,
      //, color: context.appColors.white,
      child: Column(
        children: [
          TabBar(
            padding: const EdgeInsets.only(top: 50),
            controller: controller,
            isScrollable: true,
            labelPadding: const EdgeInsets.only(right: 100, left: 12),
            indicatorSize: TabBarIndicatorSize.label,
            dividerColor: Colors.transparent,
            indicatorColor: context.appColors.orange,
            tabs: myTabs,
          ),
        ],
      ),
    );
  }

  Widget buildListOrder(OrderState state) {
    return Padding(
      padding: const EdgeInsets.only(left: 60, right: 60, top: 50),
      child: SizedBox(
        height: context.screenSize.height * 0.7,
        width: context.screenSize.width,
        child: RefreshIndicator(
          onRefresh: () => widget.orderController.getOrders(),
          child: ListenableBuilder(
            listenable: controller!,
            builder: (context, _) {
              return ShimmerLoadingWidget(
                showShimmer: state.isLoading,
                heigthShimmer: 180.p,
                itemShimmer: 2,
                widthShimmer: context.screenSize.width,
                radius: 8,
                spaceItemBottom: 50,
                padding: EdgeInsets.only(
                  top: 40.0.h,
                  bottom: 10.h,
                ),
                child: ListView.builder(
                  shrinkWrap: true,
                  itemCount: state.orders.length,
                  itemBuilder: (context, index) {
                    return Visibility(
                      visible: state.orders[index].status ==
                              list[controller!.index] ||
                          controller!.index == 0,
                      child: buildTile(
                        state.orders[index],
                      ),
                    );
                  },
                ),
              );
            },
          ),
        ),
      ),
    );
  }

  Widget buildTile(OrderModel order) {
    return Container(
      height: 180,
      margin: const EdgeInsets.only(bottom: 50),
      padding: const EdgeInsets.only(left: 45, right: 45, top: 50, bottom: 50),
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
              color: Colors.black.withOpacity(0.05),
              spreadRadius: 4,
              blurRadius: 10)
        ],
        borderRadius: BorderRadius.circular(8),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TextWidget(
                  order.clientName,
                  fontSize: 20,
                  fontWeight: FontWeight.w400,
                ),
                const SizedBox(
                  height: 10,
                ),
                Row(
                  children: [
                    TextWidget(
                      'Status do pedido Entregar até ${DateStringFormatters.formatHours(order.deliveryDate)} ${order.status} ${order.orderName}',
                      fontSize: 16,
                      fontWeight: FontWeight.w400,
                    ),
                    const SizedBox(
                      width: 30,
                    ),
                    InkWell(
                      onTap: () {
                        isDetails = true;
                        setState(() {});
                        scaffoldKey.currentState!.openEndDrawer();
                      },
                      child: const TextWidget(
                        'Ver detalhes',
                        fontSize: 16,
                        fontWeight: FontWeight.w400,
                        decoration: TextDecoration.underline,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          Container(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                CircleAvatar(
                  radius: 15,
                  backgroundColor: context.appColors.grey,
                ),
                const SizedBox(
                  width: 10,
                ),
                TextWidget(
                  'Entregar até ${DateStringFormatters.formatHours(order.deliveryDate)}',
                  fontSize: 16,
                  fontWeight: FontWeight.w400,
                ),
                const SizedBox(
                  width: 80,
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      const TextWidget(
                        'Status do pedido',
                        fontSize: 14,
                        fontWeight: FontWeight.w400,
                      ),
                      DropdownButtonWidget(
                        value: order.status,
                        onChanged: (value) {
                          order.status = value;
                          setState(() {});
                        },
                      ),
                    ],
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
