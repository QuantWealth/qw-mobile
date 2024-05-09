import 'package:flutter/material.dart';
import 'package:quantwealth/ui/savings/domain/entities/savings_entity.dart';
import 'package:quantwealth/ui/savings/ui/views/savings_view.dart';

class SavingsPage extends StatefulWidget {
  const SavingsPage({super.key});

  @override
  State<SavingsPage> createState() => _SavingsPageState();
}

class _SavingsPageState extends State<SavingsPage>
    with AutomaticKeepAliveClientMixin {
  @override
  bool get wantKeepAlive => true;

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return SavingsView(
      onAmountChanged: (val) {},
      onLevelChanged: (val) {},
      onSelectSavings: (savings) {},
      onInvest: () {},
      savings: const [
        SavingsEntity(
          id: '0',
          name: 'Flexible',
          yield: 18,
        ),
        SavingsEntity(
          id: '1',
          name: 'Fixed',
          yield: 18,
        ),
      ],
      selectedSavings: SavingsEntity(
        id: '1',
        name: 'Fixed',
        yield: 18,
      ),
    );
  }
}
