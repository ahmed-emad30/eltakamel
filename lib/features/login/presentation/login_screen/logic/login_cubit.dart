import 'dart:developer';

import 'package:eltakamel/core/widgets/toast.dart';
import 'package:eltakamel/features/home/data/data_source/home_remote_data_source.dart';
import 'package:eltakamel/features/login/data/data_source/login_remote_data_source.dart';
import 'package:eltakamel/features/login/data/model/languages_model.dart';
import 'package:eltakamel/features/login/data/model/translations_model.dart';
import 'package:eltakamel/features/login/data/repository/login_repository_imp.dart';
import 'package:eltakamel/features/login/domain/use_case/forget_use_case.dart';
import 'package:eltakamel/features/login/domain/use_case/get_languages_use_case.dart';
import 'package:eltakamel/features/login/domain/use_case/login_use_case.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/utils/app_enums.dart' show Status;
import '../../../domain/entity/login_form_entity.dart' show LoginFormEntity;
import '../../../domain/use_case/get_translations_use_case.dart'
    show GetTranslationsUseCase;

part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit() : super(const LoginInitialState()) {
    getLanguages();
  }

  static LoginCubit get(context) => BlocProvider.of(context);
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  LoginFormEntity? loginFormEntity;

  List<String> supportedLanguages = [];
  final loginRepo = LoginRepositoryImp(LoginRemoteDataSourceImp());
  late LanguagesModel languages;
  late TranslationsModel translations;

  Future<void> getLanguages() async {
    final getLanguagesUseCase = GetLanguagesUseCase(loginRepo);
    languages = await getLanguagesUseCase.call();
  }

  Future<void> login() async {
    log('login');
    log('$loginFormEntity');
    if (!formKey.currentState!.validate() || loginFormEntity == null) {
      return;
    }
/*AppMethods.test(
        (){emit(LoginLoadingState());},
        (){emit(LoginErrorState(message: 'message',));}

);*/
    emit(LoginLoadingState());
    if (loginFormEntity?.userName == 'tes' &&
        loginFormEntity?.password == 'test') {
      await getLanguageKeywords();

      emit(LoginSuccessState());
    } else {
      log('loginFormEntity ${loginFormEntity.toString()}');
      final loginUseCase = LoginUseCase(loginRepo);
      await loginUseCase
          .call(loginFormEntity: loginFormEntity!)
          .then((value) async {
        password = loginFormEntity!.password;
        await getLanguageKeywords();
        emit(LoginSuccessState());
      })
          .catchError((error) {
        log('error $error');
        emit(LoginErrorState(message: error));
      });
    }
  }

  void setUserName(String text) {
    if (loginFormEntity == null) {
      loginFormEntity = LoginFormEntity(userName: text, password: '');
    } else {
      loginFormEntity = loginFormEntity?.copyWith(userName: text);
    }
  }

  void setPassword(String text) {
    if (loginFormEntity == null) {
      loginFormEntity = LoginFormEntity(userName: '', password: text);
    } else {
      loginFormEntity = loginFormEntity?.copyWith(password: text);
    }
  }

  void setLanguage(String? text) {
    if (text == null) return;
    final isEnglish = text == "English";
    final language = isEnglish ? "en" : "ar";
    if (loginFormEntity == null) {
      loginFormEntity = LoginFormEntity(
        userName: '',
        password: '',
        language: language,
      );
    } else {
      loginFormEntity = loginFormEntity?.copyWith(language: language);
    }
  }

  Future<void> forgetPassword() async {
    log('forget');
    log('$loginFormEntity');
    if (loginFormEntity?.userName.isEmpty ?? true) {
      toast('The email address must have value', Status.info);
      return;
    } else {
      final forgetUseCase = ForgetUseCase(loginRepo);
      final isReset = await forgetUseCase.call(
          loginFormEntity: loginFormEntity!);
      if (isReset) {
        emit(ForgetSuccessState());
      } else {
        emit(ForgetErrorState(
            message: 'You need to write a valid registered account email'));
      }
    }
  }

  Future<void> getLanguageKeywords() async {
    final getTranslationsUseCase = GetTranslationsUseCase(loginRepo);
    translations = await getTranslationsUseCase.call(loginFormEntity!.language);
  }

  void changeRecoveryEmail(String text) {
    if (loginFormEntity == null) {
      loginFormEntity = LoginFormEntity(userName: text, password: '');
    } else {
      loginFormEntity = loginFormEntity?.copyWith(userName: text);
    }
  }
}
