import 'package:flutter/material.dart';

import 'order_summary.dart';

class CheckOutPage extends StatefulWidget {
  const CheckOutPage({super.key});

  @override
  State<CheckOutPage> createState() => _CheckOutPageState();
}

class _CheckOutPageState extends State<CheckOutPage> {
  TextEditingController firstNameController = TextEditingController();
  TextEditingController lastNameController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController addressController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green,
        title: const Text(
          'សង្ខេប',
          style: TextStyle(color: Colors.white),
        ),
        iconTheme: const IconThemeData(
          color: Colors.white,
          size: 30,
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          //mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'ព័ត៍មានបន្ថែមរបស់អ្នក',
              style: Theme.of(context)
                  .textTheme
                  .headline5!
                  .copyWith(color: Colors.black, fontWeight: FontWeight.bold),
            ),
            TextFormField(
              controller: firstNameController,
              decoration: const InputDecoration(
                enabledBorder: UnderlineInputBorder(
                  borderSide: BorderSide(width: 1, color: Colors.black),
                ),
                hintText: 'នាមឈ្មោះ',
              ),
            ),
            TextFormField(
              controller: lastNameController,
              decoration: const InputDecoration(
                enabledBorder: UnderlineInputBorder(
                  borderSide: BorderSide(width: 1, color: Colors.black),
                ),
                hintText: 'នាមត្រកូល',
              ),
            ),
            TextFormField(
              controller: addressController,
              decoration: const InputDecoration(
                enabledBorder: UnderlineInputBorder(
                  borderSide: BorderSide(width: 1, color: Colors.black),
                ),
                hintText: 'អាស័យដ្ឋាន',
              ),
            ),
            TextFormField(
              controller: phoneController,
              decoration: const InputDecoration(
                enabledBorder: UnderlineInputBorder(
                  borderSide: BorderSide(width: 1, color: Colors.black),
                ),
                hintText: 'លេខទូរស័ព្ទ',
              ),
            ),
            TextFormField(
              controller: emailController,
              decoration: const InputDecoration(
                enabledBorder: UnderlineInputBorder(
                  borderSide: BorderSide(width: 1, color: Colors.black),
                ),
                hintText: 'អុីម៉ែល',
              ),
            ),
            const SizedBox(height: 20),
            Container(
              height: 60,
              alignment: Alignment.bottomCenter,
              decoration: const BoxDecoration(color: Colors.green),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Center(
                    child: TextButton(
                      onPressed: () {},
                      child: Text(
                        'ជ្រើសរើសវិធីបង់ប្រាក់',
                        style: Theme.of(context)
                            .textTheme
                            .headline5!
                            .copyWith(color: Colors.white),
                      ),
                    ),
                  ),
                  IconButton(
                    onPressed: () {},
                    icon: const Icon(
                      Icons.arrow_forward_ios,
                      color: Colors.white,
                    ),
                  )
                ],
              ),
            ),
            const SizedBox(height: 25),
            Text(
              'សង្ខេបនៃការបញ្ជាទិញ',
              style: Theme.of(context)
                  .textTheme
                  .headline5!
                  .copyWith(color: Colors.black, fontWeight: FontWeight.bold),
            ),
            const OrderSummary()
          ],
        ),
      ),
    );
  }
}
