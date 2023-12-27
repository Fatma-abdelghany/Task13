import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shopify/models/product.model.dart';
import 'package:shopify/providers/cart_provider.dart';
import 'package:shopify/utils/constants/colors_constants.dart';
import 'package:shopify/utils/constants/strings_constants.dart';
import 'package:shopify/widgets/app_bar_ex.widget.dart';
import 'package:shopify/widgets/cart_badge.dart';
import 'package:shopify/widgets/custom_button_widget.dart';
import 'package:shopify/widgets/selected_color.dart';
import 'package:shopify/widgets/selected_size.dart';
import 'package:uuid/uuid.dart';

class ProductDetailsPage extends StatefulWidget {
  const ProductDetailsPage({super.key, required this.product});
  final Product product;

  @override
  State<ProductDetailsPage> createState() => _ProductDetailsPageState();
}

class _ProductDetailsPageState extends State<ProductDetailsPage> {
  @override
  void initState() {
    Provider.of<CartProvider>(context, listen: false).createItemInstance();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorsConstants.bgColor,
      appBar: productDetailsAppBar(context),
      bottomNavigationBar: buildBottomAppBar(),
       body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            // AnimatedSmoothIndicator(
            //   activeIndex: 1,
            //   count: 3,
            //   effect: WormEffect(
            //     dotHeight: 5,
            //     dotWidth: 5,
            //     radius: 3,
            //     dotColor: Color(0xff727c8e).withOpacity(0.200),
            //     activeDotColor: Color(0xff727c8e),
            //   ),
            // ),
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    CachedNetworkImage(
                        imageUrl: widget.product.image!,
                        height: 300,
                        width: double.infinity,
                        fit: BoxFit.fitHeight,
                        errorWidget: (context, url, error) => const Center(
                              child: Icon(Icons.error),
                            ),
                        progressIndicatorBuilder: (_, __, progress) => Padding(
                              padding: const EdgeInsets.all(100.0),
                              child: CircularProgressIndicator(
                                value: progress.progress,
                              ),
                            )),
                    const SizedBox(
                      height: 15,
                    ),
                    Container(
                      padding: EdgeInsets.all(8),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          ...(widget.product.variants?.entries
                                  .toList()
                                  .map((e) {
                                return Column(
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.symmetric(
                                          vertical: 11),
                                      child: Align(
                                        alignment: Alignment.topLeft,
                                        child: Text(
                                          'SELECT ${e.key.toUpperCase()}',
                                          style: TextStyle(
                                              fontWeight: FontWeight.w500,
                                              fontSize: 12,
                                              color: Color(0xff515c6f)
                                                  .withOpacity(0.502),
                                              letterSpacing: 1),
                                        ),
                                      ),
                                    ),
                                    if (e.key == 'color')
                                      SelectedColor(
                                        colors: List<int>.from(e.value),
                                        selectedColorCallBack: (color) {
                                          Provider.of<CartProvider>(context,
                                                  listen: false)
                                              .cartItem
                                              ?.selectedVarints ??= {};

                                          Provider.of<CartProvider>(context,
                                                      listen: false)
                                                  .cartItem
                                                  ?.selectedVarints?[e.key] =
                                              color.value;
                                        },
                                      )
                                    else
                                      SelectedSize(
                                        selectedValueCallBack: (value) {
                                          Provider.of<CartProvider>(context,
                                                  listen: false)
                                              .cartItem
                                              ?.selectedVarints ??= {};

                                          Provider.of<CartProvider>(context,
                                                  listen: false)
                                              .cartItem
                                              ?.selectedVarints?[e.key] = value;
                                        },
                                        values: List<dynamic>.from(e.value),
                                      ),
                                  ],
                                );
                              }) ??
                              [SizedBox.fromSize()]),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),

            
          ],
        ),
      ),
    );
  }

  AppBar productDetailsAppBar(BuildContext context) {
    return AppBar(
      centerTitle: true,
      backgroundColor: ColorsConstants.bgColor,
      elevation: 0,
      leading: IconButton(
        onPressed: () => Navigator.pop(context),
        icon: const Icon(Icons.arrow_back_ios_new_outlined,
            color: Color(0xffff6969), size: 18),
      ),
      title: Padding(
        padding: const EdgeInsets.only(top: 16),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              widget.product.name ?? 'No Name',
              textAlign: TextAlign.center,
              style: const TextStyle(
                fontSize: 15,
                fontWeight: FontWeight.w300,
                color: Color(0xff515c6f),
              ),
            ),
            Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  '\$${widget.product.price}',
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.bold,
                    color: Color(0xff515c6f),
                  ),
                ),
                Container(
                  width: 42,
                  height: 19,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: const Color(0xffff6969),
                  ),
                  child: const Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.star,
                        size: 12,
                        color: Color(0xffffffff),
                      ),
                      Text(
                        '4.9',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            )
          ],
        ),
      ),
      actions: [CartBadgeWidget()],
    );
  }

  BottomAppBar buildBottomAppBar() {
    return BottomAppBar(
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
              onBtnPressed:  () {
                    Provider.of<CartProvider>(context, listen: false)
                        .cartItem
                        ?.productId = widget.product.id;
                    Provider.of<CartProvider>(context, listen: false)
                        .cartItem
                        ?.quantity = 1;
                    Provider.of<CartProvider>(context, listen: false)
                        .cartItem
                        ?.itemId = Uuid().v4();
                    Provider.of<CartProvider>(context, listen: false)
                        .onAddItemToCart(context: context);
                  },
            )
          ],
        ));
  }
}
