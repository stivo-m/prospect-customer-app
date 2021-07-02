import 'package:flutter/material.dart';
import 'package:prospect_app/domain/core/app_strings.dart';
import 'package:prospect_app/presentation/app/customer/pages/dashboard/widgets/order_dashboard_card.dart';

class CustomerDashboard extends StatelessWidget {
  const CustomerDashboard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Expanded(
            child: SingleChildScrollView(
              child: GridView.count(
                crossAxisCount: dashboardOrderCardTitles.length,
                crossAxisSpacing: 2,
                shrinkWrap: true,
                children: dashboardOrderCardTitles
                    .map((String title) => OrderDashboardCard(title: title))
                    .toList(),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
