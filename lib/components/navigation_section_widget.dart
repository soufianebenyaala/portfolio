import 'package:flutter/material.dart';

import '../components/rounded_button_widget.dart';
import '../model/section_key_and_name_model.dart';

class NavigationSectionWidget extends StatelessWidget {
  final List<SectionKeyAndNameModel> sectionKeyAndNameList;
  final ScrollController scrollController;
  const NavigationSectionWidget({
    super.key,
    required this.sectionKeyAndNameList,
    required this.scrollController,
  });

  void scrollToIndex(GlobalKey itemKey, BuildContext context) {
    Scrollable.ensureVisible(itemKey.currentContext!);
    scrollController.position.jumpTo(scrollController.position.pixels - 40);
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 40,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: sectionKeyAndNameList.length,
        itemBuilder: (context, index) => Padding(
          padding: const EdgeInsets.only(right: 4),
          child: RoundedButton(
              text: sectionKeyAndNameList[index].name,
              press: (context) {
                scrollToIndex(
                  sectionKeyAndNameList[index].key,
                  context,
                );
              }),
        ),
      ),
    );
  }
}
