import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:portfolio/bloc/portfolio_bloc.dart';
import 'package:portfolio/generated/locale_keys.g.dart';
import 'package:portfolio/util/shared_prefes_manager.dart';

import '../components/general_info_section_widget.dart';
import '../components/get_section_widget_by_name.dart';
import '../components/navigation_section_widget.dart';
import '../model/section_key_and_name_model.dart';
import '../util/utils.dart';

class PortfolioScreen extends StatelessWidget {
  const PortfolioScreen({super.key});

  @override
  Widget build(BuildContext context) {
    ScrollController scrollController = ScrollController();
    GlobalKey<ScaffoldState> globalKey = GlobalKey();

    List<SectionKeyAndNameModel> sectionKeyAndNameList = [
      SectionKeyAndNameModel(name: LocaleKeys.experience.tr()),
      SectionKeyAndNameModel(name: LocaleKeys.projects.tr()),
      SectionKeyAndNameModel(name: LocaleKeys.education.tr()),
      SectionKeyAndNameModel(name: LocaleKeys.skills.tr()),
      SectionKeyAndNameModel(name: LocaleKeys.certifications.tr()),
      SectionKeyAndNameModel(name: LocaleKeys.formations.tr()),
      SectionKeyAndNameModel(name: LocaleKeys.activities.tr()),
      SectionKeyAndNameModel(name: LocaleKeys.languages.tr()),
    ];
    void handleLang(String lang) {
      context.setLocale(Locale(lang));
      SharedPrefsManager.setLanguage(lang);
      BlocProvider.of<PortfolioBloc>(context).add(GetPortfolioEvent());
    }

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
                        PopupMenuButton(
                          constraints: const BoxConstraints(maxWidth: 60),
                          itemBuilder: (context) => [
                            PopupMenuItem(
                              onTap: () {
                                handleLang('fr');
                              },
                              child: const Text("FR"),
                            ),
                            PopupMenuItem(
                              onTap: () {
                                handleLang('en');
                              },
                              child: const Text("EN"),
                            ),
                          ],
                        ),
                        const Expanded(child: SizedBox()),
                        const Expanded(child: SizedBox()),
                        Text("Portfolio",
                            style: Theme.of(context).textTheme.titleLarge),
                        const Expanded(child: SizedBox()),
                        IconButton(
                            color: kDefaultIconDarkColor,
                            onPressed: () {
                              Utils.onShareXFileFromAssets(context);
                            },
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
              child: BlocBuilder<PortfolioBloc, PortfolioState>(
                builder: (context, state) {
                  if (state is GetPortfolioErrorState) {
                    return Center(
                      child: Text(state.message),
                    );
                  }
                  if (state is GetPortfolioLoadingState) {
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  }
                  if (state is GetPortfolioLoadedState) {
                    return ListView(
                      controller: scrollController,
                      children: [
                        const GeneralInfoSectionWidget(),
                        const SizedBox(
                          height: 10,
                        ),
                        ListView.builder(
                          shrinkWrap: true,
                          physics: const NeverScrollableScrollPhysics(),
                          itemCount: sectionKeyAndNameList.length,
                          itemBuilder: (context, index) => Column(
                            children: [
                              Card(
                                child: Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 5, vertical: 30),
                                  child: GetSectionWidgetByName(
                                    sectionKeyAndNameModel:
                                        sectionKeyAndNameList[index],
                                    portfolio: state.portfolio,
                                  ),
                                ),
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                            ],
                          ),
                        ),
                      ],
                    );
                  }
                  return const SizedBox();
                },
              ))),
    );
  }
}
