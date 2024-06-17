import 'package:collection/collection.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:quantwealth/app/extensions.dart';
import 'package:quantwealth/app/strings.dart';
import 'package:quantwealth/app/theme/theme.dart';
import 'package:quantwealth/ui/common/add_funds_sheet.dart';
import 'package:quantwealth/ui/common/text_outlined_button.dart';
import 'package:quantwealth/ui/common/widgets/base_scaffold.dart';
import 'package:quantwealth/ui/home/ui/pages/search_page.dart';

class InvestPage extends StatefulWidget {
  final List<int> selectedItems;

  const InvestPage({
    super.key,
    required this.selectedItems,
  });

  @override
  State<InvestPage> createState() => _InvestPageState();
}

class _InvestPageState extends State<InvestPage> {
  final FocusNode _focusNode = FocusNode();
  late TextEditingController _amountController;
  bool _fieldInFocus = false;

  Map<int, double> dataMap = {};

  @override
  void initState() {
    _amountController = TextEditingController();
    _focusNode.addListener(() {
      setState(() {
        _fieldInFocus = _focusNode.hasFocus;
      });
    });
    dataMap = widget.selectedItems
        .asMap()
        .map((key, value) => MapEntry(key, 100 / widget.selectedItems.length));
    super.initState();
  }

  final inputStyle = TextStyle(
    color: Colors.white,
    fontWeight: FontWeight.bold,
    fontSize: 46.0,
    fontFamily: 'GalanoGrotesque',
  );

  @override
  Widget build(BuildContext context) {
    final selectedItems = stakingAssets
        .whereIndexed((index, _) => widget.selectedItems.contains(index))
        .toList();

    return BaseScaffold(
      title: 'Invest',
      onBack: () => context.navigator.pop(),
      isCenterTitle: true,
      body: ListView(
        children: [
          AnimatedContainer(
            duration: const Duration(milliseconds: 300),
            margin: EdgeInsets.all(16.0),
            curve: Curves.easeInOut,
            decoration: BoxDecoration(
              color: _fieldInFocus ? qw1D1D1D : null,
              image: _fieldInFocus
                  ? DecorationImage(
                      image: AssetImage('assets/images/qw_bg.png'),
                      fit: BoxFit.cover,
                    )
                  : null,
              // backgroundBlendMode: _fieldInFocus ? BlendMode.dst : null,
              boxShadow: [
                BoxShadow(
                  color: _fieldInFocus
                      ? white.withOpacity(0.4)
                      : white.withOpacity(.0),
                  blurRadius: 10.0,
                  spreadRadius: 2.5,
                ),
              ],
            ),
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 24.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Expanded(
                        child: Column(
                          children: [
                            TextFormField(
                              controller: _amountController,
                              focusNode: _focusNode,
                              onChanged: (x) {
                                setState(() {
                                  dataMap = dataMap.map((key, value) {
                                    return MapEntry(
                                      key,
                                      100 / selectedItems.length,
                                    );
                                  });
                                });
                              },
                              style: inputStyle,
                              keyboardType: TextInputType.number,
                              inputFormatters: [
                                FilteringTextInputFormatter.digitsOnly,
                              ],
                              textAlign: TextAlign.center,
                              decoration: InputDecoration(
                                border: InputBorder.none,
                                hintText: '\$${Strings.hintAmountInput}',
                                hintStyle: inputStyle.copyWith(
                                  color: white.withOpacity(0.5),
                                ),
                              ),
                            ),
                            const SizedBox(height: 8.0),
                            Text(
                              'Input Amount (in USD)',
                              style: TextStyle(
                                color: white,
                                fontWeight: FontWeight.normal,
                                fontSize: 12.0,
                                fontFamily: 'GalanoGrotesque',
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          // AspectRatio(
          //   aspectRatio: 1,
          //   child: PieChart(
          //     PieChartData(
          //       borderData: FlBorderData(show: false),
          //       sectionsSpace: 0,
          //       centerSpaceRadius: 40,
          //       sections: showingSections(),
          //     ),
          //   ),
          // ),
          ListView.builder(
            physics: NeverScrollableScrollPhysics(),
            padding: EdgeInsets.all(20),
            shrinkWrap: true,
            itemCount: selectedItems.length,
            itemBuilder: (context, index) {
              final asset = selectedItems[index];

              return ListTile(
                title: Text(
                  asset.name,
                  style: fontB(16),
                ),
                subtitle: Text(
                  '${asset.apy}%',
                  style: fontB(16),
                ),
                trailing: SizedBox(
                  width: 100,
                  child: TextFormField(
                    initialValue: (100 ~/ selectedItems.length).toString(),
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                      suffixIcon: Padding(
                        padding: const EdgeInsets.symmetric(vertical: 16.0),
                        child: Text('%', style: fontB(16)),
                      ),
                      hintText: '0',
                      hintStyle: fontB(16),
                    ),
                    style: fontB(16),
                    keyboardType: TextInputType.number,
                    onChanged: (value) {
                      dataMap[index] = double.tryParse(value) ?? 0;
                    },
                  ),
                ),
              );
            },
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: TextOutlinedButton(
              text: 'Invest',
              borderColor: Colors.white,
              textStyle: fontB(16),
              onPressed: () {
                if (dataMap.values.sum != 100) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      backgroundColor: Colors.red,
                      content: Text('Total percentage must be 100!'),
                    ),
                  );
                } else {
                  showDialog(
                    context: context,
                    builder: (_) => SuccessDialog(),
                  );
                }
              },
            ),
          ),
          SizedBox(height: 20.0)
        ],
      ),
    );
  }

  List<PieChartSectionData> showingSections() {
    final assetItems = stakingAssets
        .whereIndexed((index, _) => widget.selectedItems.contains(index))
        .toList();

    return assetItems.mapIndexed((index, asset) {
      final isSelected = widget.selectedItems.contains(index);
      final double fontSize = isSelected ? 16 : 14;
      final double radius = isSelected ? 60 : 50;
      final color = Colors.primaries[index % Colors.primaries.length];

      final amount = (double.tryParse(_amountController.text) ?? 0) *
          (dataMap[index]! / 100);

      return PieChartSectionData(
        color: color,
        value: dataMap.values.sum == 0
            ? (100 / assetItems.length)
            : dataMap[index],
        title:
            '${asset.name.substring(0, 3)}\n(\$${amount.toStringAsFixed(1)})',
        radius: radius * (context.mediaQuery.size.width / 200) / 2,
        titleStyle: TextStyle(
          fontSize: fontSize,
          fontWeight: FontWeight.bold,
          color: Colors.white,
        ),
      );
    }).toList();
  }
}
