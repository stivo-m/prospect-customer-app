import 'package:flutter/material.dart';
import 'package:prospect_app/application/core/services/navigation_service.dart';
import 'package:prospect_app/presentation/core/themes/themes.dart';

class FloatingAddActionButton extends StatelessWidget {
  FloatingAddActionButton({
    Key? key,
    required this.navigateTo,
  }) : super(key: key);

  final String navigateTo;

  final NavigationService _navigationService = NavigationService.instance;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => _navigationService.pushNamed(route: navigateTo),
      child: Container(
        width: 50,
        height: 50,
        decoration: BoxDecoration(
          color: Theme.of(context).accentColor,
          shape: BoxShape.circle,
          boxShadow: <BoxShadow>[
            BoxShadow(
              color: Theme.of(context).accentColor.withOpacity(0.2),
              spreadRadius: 0.3,
              blurRadius: 5,
            )
          ],
        ),
        child: Center(
          child: Icon(
            Icons.add,
            color: AppColors.whiteColor,
            size: 30,
          ),
        ),
      ),
    );
  }
}
