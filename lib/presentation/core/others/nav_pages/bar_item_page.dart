import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:odoo_demo/app/cubits/app_cubit_states.dart';
import 'package:odoo_demo/app/cubits/app_cubits.dart';

import 'package:odoo_demo/presentation/core/components/app_large_text.dart';
import 'package:odoo_demo/presentation/core/components/app_text.dart';
import 'package:odoo_demo/presentation/core/utils/core/app_colors.dart';

class BarItemPage extends StatefulWidget {
  const BarItemPage({Key? key}) : super(key: key);

  @override
  State<BarItemPage> createState() => _BarItemPageState();
}

class _BarItemPageState extends State<BarItemPage>
    with TickerProviderStateMixin {
  final _images = {
    "assets/img/balloning.png": "Balloning",
    "assets/img/hiking.png": "Hikink",
    "assets/img/kayaking.png": "Kayaking",
    "assets/img/snorkling.png": "Snorkling",
  };
  @override
  Widget build(BuildContext context) {
    TabController _tabController = TabController(length: 3, vsync: this);
    return Scaffold(
      body: BlocBuilder<AppCubits, AppCubitStates>(
        builder: (context, state) {
          if (state is LoadedState) {
            var info = state.places;
            return SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    padding:
                        const EdgeInsets.only(top: 70, left: 20, right: 10),
                    child: Row(
                      children: [
                        const Icon(
                          Icons.menu,
                          size: 30,
                          color: Colors.black54,
                        ),
                        Expanded(child: Container()),
                        Container(
                          width: 50,
                          height: 50,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: Colors.grey.withOpacity(0.5)),
                        )
                      ],
                    ),
                  ),
                  const SizedBox(height: 40),
                  Container(
                    margin: const EdgeInsets.only(left: 10),
                    child: AppLargeText(text: "${DateTime.now()}"),
                  ),
                  const SizedBox(height: 40),

                  // Tabbar
                  Container(
                    child: Align(
                      alignment: Alignment.centerLeft,
                      child: TabBar(
                        controller: _tabController,
                        labelColor: Colors.black,
                        unselectedLabelColor: Colors.grey,
                        isScrollable: true,
                        labelPadding:
                            const EdgeInsets.only(left: 20, right: 20),
                        // indicatorSize: TabBarIndicatorSize.label,
                        indicator: const CircleTabIndicator(
                            color: AppColors.mainColor, radius: 4),
                        tabs: const [
                          Tab(text: "SpaceX"),
                          Tab(text: "SatrLink"),
                          Tab(text: "Tesla"),
                        ],
                      ),
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.only(left: 20),
                    height: 300,
                    width: double.maxFinite,
                    child: TabBarView(
                      controller: _tabController,
                      children: [
                        ListView.builder(
                          itemCount: info.length,
                          scrollDirection: Axis.horizontal,
                          itemBuilder: (context, index) {
                            return GestureDetector(
                              onTap: () => BlocProvider.of<AppCubits>(context)
                                  .detailPlace(place: info[index]),
                              // => Get.to(() => const DetailPage()),
                              child: Container(
                                margin:
                                    const EdgeInsets.only(right: 10, top: 10),
                                width: 200,
                                height: 300,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(20),
                                  color: Colors.white,
                                  image: DecorationImage(
                                      image: NetworkImage(
                                          "http://mark.bslmeiyu.com/uploads/" +
                                              info[index].img),
                                      fit: BoxFit.cover),
                                ),
                              ),
                            );
                          },
                        ),
                        const Text("Neuralink"),
                        const Text("Model X is coming"),
                      ],
                    ),
                  ),
                  const SizedBox(height: 40),
                  Container(
                    margin: const EdgeInsets.symmetric(horizontal: 20),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: const [
                        AppLargeText(
                          text: "Explorer",
                          textSize: 27,
                        ),
                        AppText(
                          text: "Voir plus",
                          color: AppColors.textColor1,
                        )
                      ],
                    ),
                  ),
                  const SizedBox(height: 20),
                  Container(
                    height: 120,
                    width: double.maxFinite,
                    margin: const EdgeInsets.only(left: 20),
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: 4,
                      itemBuilder: (context, index) {
                        return Container(
                          margin: const EdgeInsets.only(right: 30),
                          child: Column(
                            children: [
                              Container(
                                // margin: const EdgeInsets.only(right: 50),
                                width: 80,
                                height: 80,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(20),
                                  color: Colors.white,
                                  image: DecorationImage(
                                      image: AssetImage(
                                          _images.keys.elementAt(index)),
                                      fit: BoxFit.cover),
                                ),
                              ),
                              const SizedBox(height: 5),
                              AppText(
                                text: _images.values.elementAt(index),
                                color: AppColors.textColor2,
                              ),
                            ],
                          ),
                        );
                      },
                    ),
                  ),
                ],
              ),
            );
          } else {
            return Container();
          }
        },
      ),
    );
  }
}

class CircleTabIndicator extends Decoration {
  final Color color;
  final double radius;
  const CircleTabIndicator({
    required this.color,
    required this.radius,
  });
  @override
  BoxPainter createBoxPainter([VoidCallback? onChanged]) {
    //! Implementation obligatoire
    return _CirclePainter(color: color, radius: radius);
  }
}

class _CirclePainter extends BoxPainter {
  final Color color;
  final double radius;
  _CirclePainter({
    required this.color,
    required this.radius,
  });
  @override
  void paint(
    Canvas canvas,
    Offset offset,
    ImageConfiguration configuration,
  ) {
    Paint _paint = Paint();
    _paint.color = color;
    _paint.isAntiAlias = true;
    final Offset _circleOffset = Offset(
        configuration.size!.width / 2, configuration.size!.height - radius);
    // TODO: Implementation obligatoire
    canvas.drawCircle(offset + _circleOffset, radius, _paint);
  }
}
