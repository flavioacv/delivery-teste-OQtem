import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:teste_delivery/app/core/themes/extensions/color_theme_extension.dart';
import 'package:teste_delivery/app/core/widgets/text_widget.dart';
import 'package:teste_delivery/app/modules/order/ui/widgets/dropdown_button_widget.dart';

class OrderPage extends StatefulWidget {
  const OrderPage({super.key});

  @override
  State<OrderPage> createState() => _OrderPageState();
}

class _OrderPageState extends State<OrderPage> with TickerProviderStateMixin {
  TabController? controller;
  final List<Tab> myTabs = <Tab>[
    const Tab(
      child: TextWidget(
        'Todos',
        fontSize: 20,
        fontWeight: FontWeight.w600,
      ),
    ),
    const Tab(
      child: TextWidget(
        'Recebido',
        fontSize: 20,
        fontWeight: FontWeight.w600,
      ),
    ),
    const Tab(
      child: TextWidget(
        'Em preparo',
        fontSize: 20,
        fontWeight: FontWeight.w600,
      ),
    ),
    const Tab(
      child: TextWidget(
        'Concluído',
        fontSize: 20,
        fontWeight: FontWeight.w600,
      ),
    ),
    const Tab(
      child: TextWidget(
        'Recusados',
        fontSize: 20,
        fontWeight: FontWeight.w600,
      ),
    ),
  ];
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    controller = TabController(length: myTabs.length, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: Padding(
        padding: const EdgeInsets.only(bottom: 20, right: 8),
        child: InkWell(
          onTap: () async {},
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
            buildHeader(),
            buildBody(),
          ],
        ),
      ),
    );
  }

  Widget buildHeader() {
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

  Widget buildBody() {
    return SizedBox(
      width: context.screenSize.width,

      // color: context.appColors.white,
      child: Column(
        children: [
          buildTap(),
          buildListOrder(),
        ],
      ),
    );
  }

  Widget buildTap() {
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

  Widget buildListOrder() {
    return Padding(
      padding: const EdgeInsets.only(left: 60, right: 60, top: 50),
      child: SizedBox(
        height: context.screenSize.height * 0.7,
        width: context.screenSize.width,
        child: ListenableBuilder(
          listenable: controller!,
          builder: (context, _) {
            return ListView.builder(
              shrinkWrap: true,
              itemCount: 5,
              itemBuilder: (context, index) {
                return buildTile();
              },
            );
          },
        ),
      ),
    );
  }

  Widget buildTile() {
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
                const TextWidget(
                  'Mariana Oliveira',
                  fontSize: 20,
                  fontWeight: FontWeight.w400,
                ),
                const SizedBox(
                  height: 10,
                ),
                Row(
                  children: [
                    const TextWidget(
                      'Status do pedido Entregar até 12:30 Recebido 1x X Burger ZYX + 1x Batata média',
                      fontSize: 16,
                      fontWeight: FontWeight.w400,
                    ),
                    const SizedBox(
                      width: 30,
                    ),
                    InkWell(
                      onTap: () {},
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
                const TextWidget(
                  'Entregar até 12:30',
                  fontSize: 16,
                  fontWeight: FontWeight.w400,
                ),
                const SizedBox(
                  width: 80,
                ),
                const Padding(
                  padding: EdgeInsets.only(top: 10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      TextWidget(
                        'Status do pedido',
                        fontSize: 14,
                        fontWeight: FontWeight.w400,
                      ),
                      DropdownButtonWidget(),
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
