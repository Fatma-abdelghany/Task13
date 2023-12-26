import 'package:flutter/material.dart';
import 'package:shopify/utils/constants/colors_constants.dart';
import 'package:shopify/utils/constants/strings_constants.dart';
import 'package:shopify/widgets/app_bar_ex.widget.dart';
import 'package:shopify/widgets/custom_button_widget.dart';
class ProductDetailsPage extends StatefulWidget {
  const ProductDetailsPage({super.key});

  @override
  State<ProductDetailsPage> createState() => _ProductDetailsPageState();
}

class _ProductDetailsPageState extends State<ProductDetailsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorsConstants.bgColor,
      appBar: AppBarEx.getAppBar(context),
      bottomNavigationBar: BottomAppBar(
          padding: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
          color: ColorsConstants.bgColor,
          child: Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              CustomButtonWidget(
                text: 'SHARE THIS',
                iconColor: Colors.white,
                btnIcon: Icons.arrow_upward_outlined,
                iconBgColor: ColorsConstants.greyIconColor,
                txtColor: ColorsConstants.greyIconColor,
                bgColor: Colors.white,
                onBtnPressed: () {},
              ),
              CustomButtonWidget(
                text: StringsConstants.addToCart,
                iconColor: ColorsConstants.buttonColor,
                btnIcon: Icons.arrow_forward_ios_outlined,
                iconBgColor: Colors.white,
                txtColor: Colors.white,
                bgColor: ColorsConstants.buttonColor,
                onBtnPressed: () {},
              )
            ],
          )),
      
    );
  }
}
