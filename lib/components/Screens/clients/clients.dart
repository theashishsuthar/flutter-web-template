import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../../../app/constant/controllers.dart';
import '../../../app/helper/reponsiveness.dart';
import '../../widgets/shared/custom_text.dart';
import 'widgets/clients_table.dart';

class ClientsPage extends StatelessWidget {
  const ClientsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Obx(
            () => Row(
              children: [
                Container(
                    margin: EdgeInsets.only(
                        top: ResponsiveWidget.isSmallScreen(context) ? 56 : 6),
                    child: CustomText(
                      text: menuController.activeItem.value,
                      size: 24,
                      weight: FontWeight.bold,
                    )),
              ],
            ),
          ),
          Expanded(
              child: ListView(
            children: [
              Clientstable(),
            ],
          )),
        ],
      ),
    );
  }
}
