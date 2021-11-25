import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/rendering.dart';
import 'package:get/get.dart';

import 'package:odoo_demo/domain/users/partner_record.dart';
import 'package:odoo_demo/presentation/user/partners/partner_edit_page.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';

class PartnerDetailPage extends StatefulWidget {
  final Partner partner;
  const PartnerDetailPage({
    Key? key,
    required this.partner,
  }) : super(key: key);

  @override
  State<PartnerDetailPage> createState() => _PartnerDetailPageState();
}

class _PartnerDetailPageState extends State<PartnerDetailPage> {
  final PanelController _panelController = PanelController();
  bool _isOpen = false;
  final _imageList = const [
    "assets/images/user.png",
    "assets/images/user.png",
    "assets/images/user.png",
    "assets/images/user.png",
    "assets/images/user.png",
    "assets/images/user.png",
    "assets/images/user.png",
    "assets/images/user.png",
    "assets/images/user.png",
    "assets/images/user.png",
    "assets/images/user.png",
    "assets/images/user.png",
    "assets/images/user.png",
    "assets/images/user.png",
    "assets/images/user.png",
    "assets/images/user.png",
  ];

  @override
  Widget build(BuildContext context) {
    //Uint8List bytes = base64Decode(partner.imageSmall);

    return Scaffold(
      appBar: AppBar(
        title: Text(widget.partner.name),
      ),
      body: Stack(
        fit: StackFit.expand,
        children: [
          FractionallySizedBox(
            alignment: Alignment.topCenter,
            heightFactor: 0.7,
            child: Container(
              decoration: const BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage("assets/images/user.png"))),
            ),
          ),
          FractionallySizedBox(
            alignment: Alignment.bottomCenter,
            heightFactor: 0.3,
            child: Container(
              color: Colors.white,
            ),
          ),
          SlidingUpPanel(
            controller: _panelController,
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(35),
              topRight: Radius.circular(35),
            ),
            minHeight: MediaQuery.of(context).size.height * 0.3,
            maxHeight: MediaQuery.of(context).size.height * 0.85,
            body: GestureDetector(
              onTap: () => _panelController.close(),
              child: Container(
                color: Colors.transparent,
              ),
            ),
            panelBuilder: (ScrollController controller) =>
                _panelBody(context, controller),
            onPanelSlide: (value) {
              if (value >= 0.2) {
                if (!_isOpen) {
                  setState(() {
                    _isOpen = true;
                  });
                }
              }
            },
            onPanelClosed: () => setState(() {
              _isOpen = false;
            }),
          )
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => Get.to(() => PartnerEditPage(partner: widget.partner)),
        child: const Icon(Icons.edit),
      ),
    );
  }

  SingleChildScrollView _panelBody(
      BuildContext context, ScrollController controller) {
    return SingleChildScrollView(
      controller: controller,
      physics: const ClampingScrollPhysics(),
      child: Column(
        children: [
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 30),
            height: MediaQuery.of(context).size.height * 0.35,
            child: Column(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                _titleSection(),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    _infoSection(title: "Tâches", value: "12"),
                    Container(
                      height: 40,
                      width: 1,
                      color: Colors.grey,
                    ),
                    _infoSection(title: "Missions", value: "7"),
                    Container(
                      height: 40,
                      width: 1,
                      color: Colors.grey,
                    ),
                    _infoSection(title: "Projets", value: "3"),
                  ],
                ),
                const SizedBox(height: 15),
                _actionButton(),
              ],
            ),
          ),
          GridView.builder(
            primary: false,
            shrinkWrap: true,
            itemCount: _imageList.length,
            padding: EdgeInsets.zero,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 3,
              mainAxisSpacing: 16,
            ),
            itemBuilder: (BuildContext context, int index) => Container(
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage(_imageList[index]),
                  fit: BoxFit.cover,
                ),
              ),
            ),
          )
        ],
      ),
    );
  }

  Column _infoSection({required String title, required String value}) => Column(
        children: [
          Text(
            title,
            style: const TextStyle(
              fontWeight: FontWeight.w300,
              fontSize: 14,
            ),
          ),
          const SizedBox(height: 8),
          Text(
            value,
            style: const TextStyle(
              fontWeight: FontWeight.w700,
              fontSize: 14,
            ),
          ),
        ],
      );

  Row _titleSection() => Row(
        children: [
          Expanded(
            child: Column(
              children: [
                Text(
                  widget.partner.name,
                  overflow: TextOverflow.visible,
                  style: const TextStyle(
                    fontWeight: FontWeight.w700,
                    fontSize: 30,
                  ),
                ),
                const SizedBox(height: 8),
                Text(
                  widget.partner.email,
                  overflow: TextOverflow.visible,
                  style: const TextStyle(
                    fontWeight: FontWeight.w700,
                    fontSize: 18,
                  ),
                ),
              ],
            ),
          ),
        ],
      );

  Row _actionButton() => Row(
        // mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Visibility(
            visible: !_isOpen,
            child: Expanded(
              child: OutlinedButton(
                style: OutlinedButton.styleFrom(
                    side: const BorderSide(
                      color: Colors.blue,
                    ),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30))),
                onPressed: () => _panelController.open(),
                child: const Text(
                  "VOIR PROFILE",
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w800,
                  ),
                ),
              ),
            ),
          ),
          Visibility(
            visible: !_isOpen,
            child: const SizedBox(width: 8),
          ),
          Expanded(
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                shape: const StadiumBorder(),
              ),
              onPressed: () {},
              child: const Text(
                "MESSAGES",
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w800,
                ),
              ),
            ),
          ),
        ],
      );
}
