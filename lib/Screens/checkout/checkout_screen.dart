import 'package:flutter/material.dart';
import 'package:pharmacy_appnew_version/Widgets/custom_appbar.dart';
import 'package:pharmacy_appnew_version/Widgets/custom_navbar.dart';
import 'package:pharmacy_appnew_version/Widgets/widgets.dart';

class CheckoutScreen extends StatelessWidget {
  static const String routeName = '/checkout';

  static Route route() {
    return MaterialPageRoute(
        settings: RouteSettings(name: routeName),
        builder: (context) => CheckoutScreen());
  }

  @override
  Widget build(BuildContext context) {
    final TextEditingController emailController = TextEditingController();
    final TextEditingController nameController = TextEditingController();
    final TextEditingController cityController = TextEditingController();
    final TextEditingController zipController = TextEditingController();
    final TextEditingController countryController = TextEditingController();

    return Scaffold(
      appBar: CustomAppBarPage(title: 'Checkout'),
      bottomNavigationBar: CustomNavigationBarPage(),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'CUSTOMER INFORMATION',
              style: Theme.of(context).textTheme.headline6,
            ),
            _buildTextFormField(emailController, context, 'Email'),
            _buildTextFormField(nameController, context, 'Full Name'),
            Text(
              'DELIVERY INFORMATION',
              style: Theme.of(context).textTheme.headline6,
            ),
            _buildTextFormField(emailController, context, 'Address'),
            _buildTextFormField(countryController, context, 'Country'),
            _buildTextFormField(cityController, context, 'City'),
            _buildTextFormField(zipController, context, 'Zip Code'),
            Text(
              'ORDER SUMMARY',
              style: Theme.of(context).textTheme.headline6,
            ),
            OrderSummaryPage(),
          ],
        ),
      ),
    );
  }

  Padding _buildTextFormField(
    TextEditingController controller,
    BuildContext context,
    String labelText,
  ) {
    return Padding(
      padding: EdgeInsets.all(8.0),
      child: Row(
        children: [
          SizedBox(
            width: 75,
            child: Text(
              labelText,
              style: Theme.of(context).textTheme.bodyText2,
            ),
          ),
          Expanded(
              child: TextFormField(
            controller: controller,
            decoration: InputDecoration(
                isDense: true,
                contentPadding: const EdgeInsets.only(left: 18.0),
                focusedBorder: UnderlineInputBorder(
                    borderSide: BorderSide(
                  color: Colors.black,
                ))),
          ))
        ],
      ),
    );
  }
}
