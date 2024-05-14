import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:quantwealth/ui/balance/infrastructure/datasource/asset_dto.dart';
import 'package:quantwealth/ui/balance/infrastructure/repository/balance_repository.dart';
import 'package:quantwealth/ui/savings/cubit/savings_cubit.dart';

part 'balance_state.dart';
part 'balance_cubit.freezed.dart';

@lazySingleton
class BalanceCubit extends Cubit<BalanceState> {
  final BalanceRepository _repository;

  BalanceCubit({
    required BalanceRepository balanceRepository,
  })  : _repository = balanceRepository,
        super(BalanceState.initial());

  Future<void> onStart() async {
    emit(BalanceState.loading());
    final result = await _repository.getAssets(
      walletAddress: '0x0AFfB0a96FBefAa97dCe488DfD97512346cf3Ab8',
    );
    result.fold(
      (assets) => emit(BalanceState.loaded(assets)),
      (error) => emit(BalanceState.error(error.toString())),
    );
  }
}
