import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:teste_delivery/app/core/themes/extensions/color_theme_extension.dart';
import 'package:teste_delivery/app/core/widgets/text_widget.dart';

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
    return Container(
      width: context.screenSize.width,
      padding: const EdgeInsets.symmetric(
        horizontal: 60,
      ),
      // color: context.appColors.white,
      child: Column(
        children: [
          buildTap(),
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
            indicatorSize: TabBarIndicatorSize.label,
            dividerColor: Colors.transparent,
            indicatorColor: context.appColors.orange,
            tabs: myTabs,
          ),
        ],
      ),
    );
  }
}
