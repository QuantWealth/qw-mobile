import 'dart:convert';

import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:k_chart_plus/k_chart_plus.dart';
import 'package:quantwealth/app/extensions.dart';
import 'package:quantwealth/app/theme/theme.dart';
import 'package:quantwealth/ui/common/widgets/base_scaffold.dart';
import 'package:quantwealth/ui/home/ui/pages/strategy_page.dart';
import 'package:quantwealth/ui/savings/infrastructure/datasource/savings_dto.dart';

class StrategyDetailsPopup extends StatefulWidget {
  final SavingsDto savings;
  final Function(SavingsDto)? onInvest;

  const StrategyDetailsPopup({
    super.key,
    required this.savings,
    this.onInvest,
  });

  static show(
    BuildContext context, {
    required SavingsDto savings,
    Function(SavingsDto)? onInvest,
  }) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      constraints: BoxConstraints(
        minWidth: double.infinity,
        maxWidth: double.infinity,
        minHeight: double.infinity,
      ),
      backgroundColor: Color(0xFF121212),
      builder: (_) => StrategyDetailsPopup(
        savings: savings,
        onInvest: onInvest,
      ),
    );
  }

  @override
  State<StrategyDetailsPopup> createState() => _StrategyDetailsPopupState();
}

class _StrategyDetailsPopupState extends State<StrategyDetailsPopup> {
  List<KLineEntity> datas = [];
  bool showLoading = true;
  bool _volHidden = false;
  MainState _mainState = MainState.MA;
  final List<SecondaryState> _secondaryStateLi = [];
  int touchedIndex = -1;

  @override
  void initState() {
    super.initState();
    rootBundle.loadString('assets/market_data.json').then((value) {
      final parseJson = json.decode(value);
      final entities = parseJson['data'] as List;

      datas = entities.map((e) => KLineEntity.fromJson(e)).toList();

      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    return BaseScaffold(
      titleWidget: Text(
        'Strategy Details',
        style: fontB(24),
      ),
      isCenterTitle: true,
      onBack: () => context.navigator.pop(),
      extendBodyBehindAppBar: false,
      body: ListView(
        physics: const BouncingScrollPhysics(),
        children: [
          KChartWidget(
            datas,
            ChartStyle(),
            ChartColors(bgColor: Colors.transparent),
            isTrendLine: false,
          ),
          Padding(
            padding: const EdgeInsets.all(16),
            child: Text(
              'VOL',
              style: fontM(14),
            ),
          ),
          buildVolButton(),
          Padding(
            padding: const EdgeInsets.all(16),
            child: Text(
              'Main State',
              style: fontM(14),
            ),
          ),
          buildMainButtons(),
          Padding(
            padding: const EdgeInsets.all(16),
            child: Text(
              'Secondary State',
              style: fontM(14),
            ),
          ),
          buildSecondButtons(),
          Padding(
            padding: const EdgeInsets.all(16),
            child: Text(
              'Breakdown',
              style: fontM(20),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: ShadowCard(
              boxShadowColor: Colors.grey.withOpacity(.05),
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 20.0),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SizedBox(width: 30),
                        Expanded(
                          child: AspectRatio(
                            aspectRatio: 1,
                            child: PieChart(
                              PieChartData(
                                borderData: FlBorderData(show: false),
                                sectionsSpace: 15,
                                centerSpaceRadius: 40,
                                sections: showingSections(),
                              ),
                            ),
                          ),
                        ),
                        Expanded(
                          child: Padding(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 20.0,
                            ),
                            child: Column(
                              children: [
                                ListTile(
                                  dense: true,
                                  minTileHeight: .0,
                                  minLeadingWidth: .0,
                                  title: Text(
                                    'Flexi',
                                    style: fontSB(14),
                                  ),
                                  subtitle: Text(
                                    '+30,212%',
                                    style: fontM(
                                      12,
                                      color: Colors.white.withOpacity(.6),
                                    ),
                                  ),
                                  leading: CircleAvatar(
                                    backgroundColor: Color(0xFFFFB8A9),
                                    radius: 5,
                                  ),
                                ),
                                ListTile(
                                  dense: true,
                                  minTileHeight: .0,
                                  minLeadingWidth: .0,
                                  title: Text(
                                    'Fixed',
                                    style: fontSB(14),
                                  ),
                                  subtitle: Text(
                                    '+10,321%',
                                    style: fontM(
                                      12,
                                      color: Colors.white.withOpacity(.6),
                                    ),
                                  ),
                                  leading: CircleAvatar(
                                    backgroundColor: Color(0xFF25CCA7),
                                    radius: 5,
                                  ),
                                ),
                                ListTile(
                                  minTileHeight: .0,
                                  minLeadingWidth: .0,
                                  dense: true,
                                  title: Text(
                                    'Custom',
                                    style: fontSB(14),
                                  ),
                                  subtitle: Text(
                                    '+5,321%',
                                    style: fontM(
                                      12,
                                      color: Colors.white.withOpacity(.6),
                                    ),
                                  ),
                                  leading: CircleAvatar(
                                    backgroundColor: Color(0xFF4A56E2),
                                    radius: 5,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }

  List<PieChartSectionData> showingSections() {
    return List.generate(3, (i) {
      final isTouched = i == touchedIndex;
      final radius = isTouched ? 60.0 : 50.0;

      switch (i) {
        case 0:
          return PieChartSectionData(
            color: Color(0xFFFFB8A9),
            value: 40,
            title: '',
            radius: radius,
          );
        case 1:
          return PieChartSectionData(
            color: Color(0xFF25CCA7),
            value: 30,
            title: '',
            radius: radius,
          );
        case 2:
          return PieChartSectionData(
            color: Color(0xFF4A56E2),
            value: 30,
            title: '',
            radius: radius,
          );
        default:
          throw Error();
      }
    });
  }

  Widget buildVolButton() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Align(
        alignment: Alignment.centerLeft,
        child: _buildButton(
            context: context,
            title: 'VOL',
            isActive: !_volHidden,
            onPress: () {
              _volHidden = !_volHidden;
              setState(() {});
            }),
      ),
    );
  }

  Widget buildMainButtons() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Wrap(
        alignment: WrapAlignment.start,
        spacing: 10,
        runSpacing: 10,
        children: MainState.values.map((e) {
          return _buildButton(
            context: context,
            title: e.name,
            isActive: _mainState == e,
            onPress: () => _mainState = e,
          );
        }).toList(),
      ),
    );
  }

  Widget buildSecondButtons() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Wrap(
        alignment: WrapAlignment.start,
        spacing: 10,
        runSpacing: 5,
        children: SecondaryState.values.map((e) {
          bool isActive = _secondaryStateLi.contains(e);
          return _buildButton(
            context: context,
            title: e.name,
            isActive: _secondaryStateLi.contains(e),
            onPress: () {
              if (isActive) {
                _secondaryStateLi.remove(e);
              } else {
                _secondaryStateLi.add(e);
              }
            },
          );
        }).toList(),
      ),
    );
  }

  Widget _buildButton({
    required BuildContext context,
    required String title,
    required isActive,
    required Function onPress,
  }) {
    late Color? bgColor, txtColor;
    if (isActive) {
      bgColor = Colors.blueAccent.withOpacity(.15);
      txtColor = Theme.of(context).primaryColor;
    } else {
      bgColor = Colors.transparent;
      txtColor =
          Theme.of(context).textTheme.bodyMedium?.color?.withOpacity(.75);
    }
    return InkWell(
      onTap: () {
        onPress();
        setState(() {});
      },
      borderRadius: BorderRadius.circular(6),
      child: Container(
        decoration: BoxDecoration(
          color: bgColor,
          borderRadius: BorderRadius.circular(6),
        ),
        constraints: const BoxConstraints(minWidth: 60),
        padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
        child: Text(
          title,
          style: fontM(
            14,
            color: Colors.grey,
          ),
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}
