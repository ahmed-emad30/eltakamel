import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart'
    show BuildContext, Colors, StatelessWidget, Widget;
import 'package:flutter_bloc/flutter_bloc.dart' show BlocProvider, BlocSelector;
import 'package:eltakamel/core/widgets/main_widgets/app_scaffold.dart';

import '../../features/shared/presentation/shared_screen/logic/shared_cubit.dart'
    show SharedCubit, SharedState;
import '../utils/app_constants.dart' show AppConstants;
import '../utils/service_locator.dart' show sl;
import 'footer.dart' show Footer;

class AppScreenNavigator extends StatelessWidget {
  const AppScreenNavigator({
    super.key,
    required this.path,
    required this.sliver,
    this.hasList = false,
  });
  final String? path;
  final Widget sliver;
  final bool hasList;
  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
      value: sl<SharedCubit>(),
      child: BlocSelector<SharedCubit, SharedState, int>(
        selector: (state) {
          return state.index;
        },
        builder: (context, state) {
          return AppScaffold(
            // appBarTitle: AppConstants.items[state].title,
            // bottomNavigationBar: Footer(index: state,),
            body: sliver,
          );
        },
      ),
    );
  }
}

/*CustomScrollView(

            slivers: [
              SliverPadding(
                padding: EdgeInsets.symmetric(horizontal: 60.w),
                sliver: CustomAppBar(),
              ),

              SliverPadding(
                padding: EdgeInsets.symmetric(horizontal: 60.w),

                sliver: hasList?sliver:SliverFillRemaining(
                  child: sliver,
                ),
              )
              // sliver



            ],
          )*/
