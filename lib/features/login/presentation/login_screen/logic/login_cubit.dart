import 'dart:developer';

import 'package:eltakamel/core/utils/app_methods.dart';
import 'package:eltakamel/features/login/data/data_source/login_remote_data_source.dart';
import 'package:eltakamel/features/login/data/repository/login_repository_imp.dart';
import 'package:eltakamel/features/login/domain/use_case/login_use_case.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../domain/entity/login_form_entity.dart' show LoginFormEntity;

part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit() : super(const LoginInitialState());

  static LoginCubit get(context) => BlocProvider.of(context);
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
 LoginFormEntity? loginFormEntity ;
  List<String>supportedLanguages = [];

  getLanguages(){}

  Future<void> login()async{
    log('login');
    log('${loginFormEntity}');
    if(!formKey.currentState!.validate() || loginFormEntity == null) {
      return ;
    }
/*AppMethods.test(
        (){emit(LoginLoadingState());},
        (){emit(LoginErrorState(message: 'message',));}

);*/

    log('loginFormEntity ${loginFormEntity.toString()}');
    final loginUseCase = LoginUseCase(LoginRepositoryImp(LoginRemoteDataSourceImp()));
 await loginUseCase.call(loginFormEntity: loginFormEntity!).then((value){
   final token = value;
   emit(LoginSuccessState());
 }).catchError((error){
   log('error ${error}');
   emit(LoginErrorState(message: error));
 });

  }
  void setUserName(String text){
    if(loginFormEntity == null)
      loginFormEntity = LoginFormEntity(userName: text, password: '');
    else
    loginFormEntity = loginFormEntity?.copyWith(email: text);
  }
  void setPassword(String text){
    if(loginFormEntity == null)
      loginFormEntity = LoginFormEntity(userName: '', password: text);
    else
    loginFormEntity = loginFormEntity?.copyWith(password: text);
  }
  void setLanguage(String? text){
    if(text==null)return;
    final isEnglish = text =="English";
    final language = isEnglish?"en":"ar";
    if(loginFormEntity == null)
      loginFormEntity = LoginFormEntity(userName: '', password: '',language:language );
    else

    loginFormEntity = loginFormEntity?.copyWith(language:language );
  }






}
