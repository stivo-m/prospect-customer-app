import 'package:flutter/material.dart';
import 'package:prospect_app/domain/core/app_strings.dart';
import 'package:prospect_app/presentation/app/customer/pages/dashboard/widgets/order_dashboard_card.dart';

class CustomerDashboard extends StatelessWidget {
  const CustomerDashboard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        height: MediaQuery.of(context).size.height,
        padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Expanded(
              child: GridView.count(
                crossAxisCount: 2,
                crossAxisSpacing: 5,
                mainAxisSpacing: 8,
                shrinkWrap: true,
                children: dashboardOrderCardTitles
                    .map((String title) => OrderDashboardCard(title: title))
                    .toList(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
