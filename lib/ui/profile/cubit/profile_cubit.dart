import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:quantwealth/ui/auth/cubit/auth_cubit.dart';
import 'package:quantwealth/ui/home/infrastructure/repository/home_repository.dart';
import 'package:quantwealth/ui/profile/cubit/profile_state.dart';

@lazySingleton
class ProfileCubit extends Cubit<ProfileState> {
  final HomeRepository _homeRepository;

  ProfileCubit({
    required HomeRepository homeRepository,
  })  : _homeRepository = homeRepository,
        super(ProfileState.initial());

  void initUser({
    required LoginType type,
    required String walletAddress,
    required String provider,
  }) {
    _homeRepository
        .initUser(
      walletAddress: walletAddress,
      provider: provider,
    )
        .then((res) {
      res.fold(
        (user) {
          emit(state.copyWith(
            walletAddress: user.id,
            scwAddress: user.wallet,
            loginType: type,
          ));
        },
        (err) => debugPrint('Error: $err'),
      );
    });
  }

  void reset() {
    emit(ProfileState.initial());
  }
}
