import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../components/general_info_section_widget.dart';
import '../components/get_section_widget_by_name.dart';
import '../components/navigation_section_widget.dart';
import '../model/portfolio_model.dart';
import '../model/section_key_and_name_model.dart';

class PortfolioScreen extends StatefulWidget {
  const PortfolioScreen({super.key});

  @override
  State<PortfolioScreen> createState() => _PortfolioScreenState();
}

class _PortfolioScreenState extends State<PortfolioScreen> {
  PortfolioModel? portfolio;
  ScrollController scrollController = ScrollController();
  final GlobalKey<ScaffoldState> globalKey = GlobalKey();

  List<SectionKeyAndNameModel> sectionKeyAndNameList = [
    SectionKeyAndNameModel(name: "Experience"),
    SectionKeyAndNameModel(name: "Projects"),
    SectionKeyAndNameModel(name: "Education"),
    SectionKeyAndNameModel(name: "Skills"),
    SectionKeyAndNameModel(name: "Certifications"),
    SectionKeyAndNameModel(name: "Formations"),
    SectionKeyAndNameModel(name: "Social_activites"),
    SectionKeyAndNameModel(name: "Languages"),
  ];

  Future<String> _loadJsonAsset() async {
    return await rootBundle.loadString('assets/data.json');
  }

  Future<void> _parseJsonData() async {
    String jsonString = await _loadJsonAsset();
    setState(() {
      portfolio = PortfolioModel.fromJson(jsonString);
    });
  }

  @override
  void initState() {
    super.initState();
    _parseJsonData();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          drawerEnableOpenDragGesture: false,
          key: globalKey,
          appBar: AppBar(
            toolbarHeight: 110,
            elevation: 0,
            flexibleSpace: Column(
              children: [
                Padding(
                  padding:
                      const EdgeInsets.only(left: 8.0, right: 8.0, top: 8.0),
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8.0),
                      border: Border.all(width: 1, color: Colors.grey),
                      color: Theme.of(context).cardColor,
                    ),
                    child: Row(
                      children: [
                        const SizedBox(),
                        const Expanded(child: SizedBox()),
                        Text("Portfolio",
                            style: Theme.of(context).textTheme.titleLarge),
                        const Expanded(child: SizedBox()),
                        const IconButton(
                            color: kDefaultIconDarkColor,
                            onPressed: Utils.sharePressed,
                            icon: Icon(Icons.share))
                      ],
                    ),
                  ),
                ),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                  child: NavigationSectionWidget(
                      sectionKeyAndNameList: sectionKeyAndNameList,
                      scrollController: scrollController),
                ),
              ],
            ),
          ),
          body: Padding(
              padding: const EdgeInsets.only(right: 10, left: 10),
              child: (portfolio != null)
                  ? ListView(
                      controller: scrollController,
                      children: [
                        const GeneralInfoSectionWidget(),
                        const SizedBox(
                          height: 10,
                        ),
                        Column(
                          children: List.generate(
                            sectionKeyAndNameList.length,
                            (index) => Column(
                              children: [
                                Card(
                                  child: Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 5, vertical: 30),
                                    child: GetSectionWidgetByName(
                                      sectionKeyAndNameModel:
                                          sectionKeyAndNameList[index],
                                      portfolio: portfolio,
                                    ),
                                  ),
                                ),
                                const SizedBox(
                                  height: 10,
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    )
                  : const SizedBox())),
    );
  }
}
