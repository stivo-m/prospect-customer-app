import 'package:async_redux/async_redux.dart';
import 'package:flutter/material.dart';
import 'package:prospect_app/application/redux/states/app_state.dart';
import 'package:prospect_app/application/redux/viewmodels/person_avatar_circle_view_model.dart';
import 'package:prospect_app/presentation/core/themes/themes.dart';

class CircleProfileAvatar extends StatelessWidget {
  const CircleProfileAvatar({
    Key? key,
    this.radius = 50,
  }) : super(key: key);
  final double radius;

  @override
  Widget build(BuildContext context) {
    return StoreConnector<AppState, PersonAvatarCircleViewModel>(
      converter: (Store<AppState> store) =>
          PersonAvatarCircleViewModel.fromStore(store),
      builder: (BuildContext context, PersonAvatarCircleViewModel vm) {
        print('INITIALS: ' + vm.initials);
        return Container(
          margin: const EdgeInsets.only(left: 15),
          child: CircleAvatar(
            backgroundColor: AppColors.primaryColor.withOpacity(0.5),
            radius: radius,
            child: Text(
              vm.initials.toUpperCase(),
              style: Theme.of(context).textTheme.caption!.copyWith(
                    color: AppColors.whiteColor,
                    fontWeight: FontWeight.w800,
                    fontSize: 15,
                  ),
            ),
          ),
        );
      },
    );
  }
}
