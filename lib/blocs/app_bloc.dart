import 'package:flutter_bloc/flutter_bloc.dart';

import 'bloc.dart';

class AppBloc {
  static final applicationCubit = ApplicationCubit();
  static final userCubit = UserCubit();
  static final authenticateCubit = AuthenticationCubit();
  static final languageCubit = LanguageCubit();
  static final themeCubit = ThemeCubit();
  static final messageBloc = MessageBloc();

  static final List<BlocProvider> providers = [
    BlocProvider<ApplicationCubit>(
      create: (context) => applicationCubit,
    ),
    BlocProvider<UserCubit>(
      create: (context) => userCubit,
    ),
    BlocProvider<LanguageCubit>(
      create: (context) => languageCubit,
    ),
    BlocProvider<ThemeCubit>(
      create: (context) => themeCubit,
    ),
    BlocProvider<AuthenticationCubit>(
      create: (context) => authenticateCubit,
    ),
    // BlocProvider<LoginCubit>(
    //   create: (context) => loginCubit,
    // ),
    // BlocProvider<HomeCubit>(
    //   create: (context) => homeCubit,
    // ),
    // BlocProvider<DiscoveryCubit>(
    //   create: (context) => discoveryCubit,
    // ),
    // BlocProvider<WishListCubit>(
    //   create: (context) => wishListCubit,
    // ),
    // BlocProvider<ReviewCubit>(
    //   create: (context) => reviewCubit,
    // ),
    BlocProvider<MessageBloc>(
      create: (context) => messageBloc,
    ),
    // BlocProvider<SubmitCubit>(
    //   create: (context) => submitCubit,
    // ),
  ];

  static void dispose() {
    applicationCubit.close();
    userCubit.close();
    languageCubit.close();
    themeCubit.close();
    // homeCubit.close();
    // discoveryCubit.close();
    // wishListCubit.close();
    authenticateCubit.close();
    // loginCubit.close();
    // reviewCubit.close();
    // messageBloc.close();
    // submitCubit.close();
  }

  ///Singleton factory
  static final AppBloc _instance = AppBloc._internal();

  factory AppBloc() {
    return _instance;
  }

  AppBloc._internal();
}
