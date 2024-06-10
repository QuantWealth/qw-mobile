import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quantwealth/app/strings.dart';
import 'package:quantwealth/app/theme/theme.dart';
import 'package:quantwealth/injectable.dart';
import 'package:quantwealth/ui/balance/infrastructure/datasource/asset_dto.dart';
import 'package:quantwealth/ui/balance/ui/widgets/assets_listview.dart';
import 'package:quantwealth/ui/common/widgets/default_button.dart';
import 'package:quantwealth/ui/savings/cubit/tx_cubit.dart';

class BalanceView extends StatelessWidget {
  final VoidCallback onAddFunds;
  final List<AssetDto> assets;

  const BalanceView({
    super.key,
    required this.onAddFunds,
    required this.assets,
  });

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: ListView(
        shrinkWrap: true,
        children: [
          SizedBox(height: 48.0),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: const [
              Column(
                children: [
                  Text(
                    'Overall Balance',
                    style: TextStyle(
                      fontSize: 20,
                      color: white,
                      fontFamily: 'GalanoGrotesque',
                    ),
                  ),
                  SizedBox(height: 8.0),
                  Text(
                    '\$1000',
                    style: TextStyle(
                      fontSize: 64,
                      color: white,
                      fontWeight: FontWeight.bold,
                      fontFamily: 'GalanoGrotesque',
                    ),
                  ),
                ],
              ),
            ],
          ),
          SizedBox(height: 32.0),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              DefaultButton(
                onPressed: onAddFunds,
                label: Strings.labelAddFunds,
                fontSize: 22.0,
                padding: const EdgeInsets.symmetric(
                  vertical: 18.0,
                  horizontal: 80.0,
                ),
              ),
            ],
          ),
          SizedBox(height: 48.0),
          TabBar(
            labelStyle: TextStyle(
              fontSize: 16.0,
              fontWeight: FontWeight.bold,
              fontFamily: 'GalanoGrotesque',
            ),
            labelColor: white,
            unselectedLabelColor: gray700,
            indicatorSize: TabBarIndicatorSize.label,
            indicatorColor: white,
            dividerColor: Colors.transparent,
            tabs: const [
              Tab(text: 'Investments'),
              Tab(text: 'Assets'),
            ],
          ),
          SizedBox(
            height: 400, // You can adjust this as per your requirement
            child: TabBarView(
              children: [
                BlocBuilder<TxCubit, TxState>(
                  bloc: getIt<TxCubit>(),
                  builder: (context, state) {
                    if (state.status == TxStatus.pending &&
                        state.amount != null) {
                      return ListView(
                        children: [
                          Padding(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 20.0),
                            child: ListTile(
                              minVerticalPadding: 20,
                              leading: CircleAvatar(
                                backgroundColor: Colors.white,
                                child: Icon(Icons.attach_money),
                              ),
                              title: Text(
                                'Flexi',
                                style: fontSB(18),
                              ),
                              subtitle: Text(
                                'Savings',
                                style: fontR(14),
                              ),
                              trailing: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.end,
                                children: [
                                  Text(
                                    '\$200',
                                    style: fontSB(18),
                                  ),
                                  Text(
                                    '${18}%',
                                    style: fontR(14, color: Colors.greenAccent),
                                  ),
                                ],
                              ),
                              onTap: () {},
                            ),
                          ),
                        ],
                      );
                    }

                    return Center(
                      child: Text(
                        'No investments yet',
                        style: fontSB(18),
                      ),
                    );
                  },
                ),
                AssetsListView(
                  assets: assets,
                  onClick: (asset) {},
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
