import 'package:flutter/material.dart';
import 'package:shopify/utils/constants/colors_constants.dart';
import 'package:shopify/utils/constants/strings_constants.dart';
import 'package:shopify/widgets/app_bar_ex.widget.dart';
import 'package:shopify/widgets/custom_button_widget.dart';
import 'package:shopify/widgets/headline.widget.dart';

class CartPage extends StatefulWidget {
  const CartPage({super.key});

  @override
  State<CartPage> createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorsConstants.bgColor,
      appBar: AppBarEx.getAppBar(context),
      bottomNavigationBar: BottomAppBar(
          padding: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
          color: ColorsConstants.bgColor,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              
               Container(
                height: 60,
          padding: EdgeInsets.symmetric(horizontal: 15, ),
                 child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Total',
                                textAlign: TextAlign.left,
                                style: TextStyle(
                                  fontSize: 12,
                                  fontWeight: FontWeight.w300,
                                  color: ColorsConstants.greyTxtColor,
                                ),
                              ),
                              const SizedBox(
                                height: 5,
                              ),
                              Text(
                                '\$200',
                                textAlign: TextAlign.left,
                                style: TextStyle(
                                  fontSize: 15,
                                  fontWeight: FontWeight.bold,
                                  color: ColorsConstants.greyTxtColor,
                                ),
                              ),
                              const SizedBox(
                                height: 5,
                              ),
                              Text(
                                'Free Domestic shipping',
                                textAlign: TextAlign.left,
                                style: TextStyle(
                                  fontSize: 13,
                                  fontWeight: FontWeight.w300,
                                  color: Colors.grey[700],
                                ),
                              ),
                              
               
                              
                            ],
                          ),
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
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        child: Column(
          children: [
            const HeadlineWidget(title: StringsConstants.cart),
            ListView.builder(
                shrinkWrap: true,
                itemCount: 3,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      children: [
                        CircleAvatar(
                          backgroundColor: Colors.white,
                          radius: 45,
                          child: Image.network(
                            "https://firebasestorage.googleapis.com/v0/b/shopify-7f8c4.appspot.com/o/products%2Fscarf.png?alt=media&token=dffce2a1-7da2-4c1b-a35c-1ad5e89f19f4",
                            width: 70,
                            height: 70,
                            fit: BoxFit.cover,
                          ),
                        ),
                        SizedBox(
                          width: 25,
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text("Bottle Green BackPack",
                                style: TextStyle(
                                  fontSize: 15,
                                  fontWeight: FontWeight.w500,
                                  color: ColorsConstants.greyTxtColor,
                                )),
                            const SizedBox(
                              height: 3,
                            ),

                            Text(
                              'Medium,green',
                              textAlign: TextAlign.left,
                              style: TextStyle(
                                fontSize: 12,
                                fontWeight: FontWeight.w200,
                                color: ColorsConstants.greyTxtColor,
                              ),
                            ),

                            const SizedBox(
                              height: 7,
                            ),

                            Text(
                              '\$200',
                              textAlign: TextAlign.left,
                              style: TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.w300,
                                color: ColorsConstants.badgeColor,
                              ),
                            ),
                           const  SizedBox(
                              height: 7,
                            ),

                            Row(
                              children: [
                                SizedBox(
                                  height: 20,
                                  width: 20,
                                  child: FittedBox(
                                    child: FloatingActionButton(
                                      backgroundColor:
                                          ColorsConstants.iconColor,
                                      onPressed: () {},
                                      child:const  Icon(
                                        Icons.remove,
                                        size: 40,
                                      ),
                                    ),
                                  ),
                                ),
                                const SizedBox(
                                  width: 15,
                                ),
                                Text(
                                  '1',
                                  textAlign: TextAlign.left,
                                  style: TextStyle(
                                    fontSize: 15,
                                    fontWeight: FontWeight.w300,
                                    color: ColorsConstants.iconColor,
                                  ),
                                ),
                                const SizedBox(
                                  width: 15,
                                ),
                                SizedBox(
                                  height: 20,
                                  width: 20,
                                  child: FittedBox(
                                    child: FloatingActionButton(
                                      backgroundColor:
                                          ColorsConstants.iconColor,
                                      onPressed: () {},
                                      child:const  Icon(
                                        Icons.add,
                                        size: 40,
                                      ),
                                    ),
                                  ),
                                ),
                                const SizedBox(
                                  width: 15,
                                ),
                              ],
                            ),
                            
                          ],
                        )
                      ],
                    ),
                  );
                })
          ],
        ),
      ),
    );
  }
}
