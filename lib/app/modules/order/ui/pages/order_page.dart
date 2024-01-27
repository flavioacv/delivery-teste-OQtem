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
import 'package:teste_delivery/app/modules/order/interactor/models/item_order_model.dart';
import 'package:teste_delivery/app/modules/order/interactor/models/order_model.dart';
import 'package:teste_delivery/app/modules/order/interactor/state/order_state.dart';
import 'package:teste_delivery/app/modules/order/ui/widgets/chat_widget.dart';
import 'package:teste_delivery/app/modules/order/ui/widgets/dialog_new_order_widget.dart';
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
        return DialogNewOrder(onPressed: () {
          setState(() {
            widget.orderController.order.value.orders.add(
              OrderModel(
                orderId: '89232',
                orderIdStore: "12",
                clientName: "Joana Tesla",
                orderName: "1x X Burger ZYX + 1x Batata média ",
                status: "Recebido",
                value: "R\$45,90",
                deliveryDate: "2024-02-26 09:00",
                address: 'AV Marginal Coelho, 3829 - Dourados - MS',
                items: [
                  ItemOrderModel('Refri', '1'),
                  ItemOrderModel('Bacon', '1'),
                ],
              ),
            );
          });
          NavigationService.pop();
        });
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
