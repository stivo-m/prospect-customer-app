import 'package:flutter/material.dart';
import 'package:prospect_app/presentation/core/themes/themes.dart';

class OrderDashboardCard extends StatelessWidget {
  const OrderDashboardCard({
    Key? key,
    required this.title,
    this.color,
    this.count,
    this.description,
  }) : super(key: key);

  final Color? color;
  final int? count;
  final String? description;
  final String title;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 200,
      height: 200,
      decoration: BoxDecoration(
        color: color ?? AppColors.lightGreyColor,
        borderRadius: BorderRadius.circular(10),
        boxShadow: <BoxShadow>[
          BoxShadow(
            color:
                color?.withOpacity(0.5) ?? AppColors.greyColor.withOpacity(0.5),
            spreadRadius: 1,
            blurRadius: 10,
          )
        ],
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          SizedBox(
            height: 20,
          ),
          Text(
            count?.toString() ?? '',
            style: Theme.of(context).textTheme.headline2,
          ),
          SizedBox(
            height: 20,
          ),
          Text(
            title,
            style: Theme.of(context).textTheme.headline2,
          ),
          SizedBox(
            height: 10,
          ),
          Text(
            description ?? '',
            style: Theme.of(context).textTheme.headline2,
          ),
          SizedBox(
            height: 10,
          ),
        ],
      ),
    );
  }
}
