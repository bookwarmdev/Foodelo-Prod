import 'package:flutter/material.dart';
 import 'package:flutter_svg/svg.dart';
import 'package:foodelo/controller/controller.dart';
import 'package:foodelo/core/core.dart';
import 'package:foodelo/data/models/user_auth_model.dart';
import 'package:foodelo/presentation/routers/router.dart';
import 'package:transparent_image/transparent_image.dart';

class CartScreen extends StatefulWidget {
  final String? name;
  final int? price;
  final String? productId;
  const CartScreen({
    Key? key,
    this.name,
    this.price,
    this.productId,
  }) : super(key: key);

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  int productCount = 1;
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.lightColorScheme.onInverseSurface,
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                IconButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  icon: const Icon(
                    Icons.keyboard_arrow_left_rounded,
                    size: 30,
                  ),
                ),
                Text(
                  "",
                  style: AppStyle.headline5.copyWith(
                    color: AppColor.lightColorScheme.onPrimaryContainer,
                  ),
                ),
                IconButton(
                  onPressed: () {
                    Navigator.pushReplacementNamed(
                      context,
                      Foodelo.checkOutScreen,
                    );
                  },
                  icon: Container(
                    width: MediaQuery.of(context).size.width,
                    height: MediaQuery.of(context).size.height,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(50.0),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.5),
                          spreadRadius: 5,
                          blurRadius: 7,
                          offset: const Offset(
                            0,
                            3,
                          ), // changes position of shadow
                        ),
                      ],
                      color: AppColor.lightColorScheme.onPrimary,
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(7.0),
                      child: SvgPicture.asset(
                        "assets/svgs/shopping-cart.svg",
                        color: AppColor.lightColorScheme.primary,
                        height: 100,
                        width: 150,
                      ),
                    ),
                  ),
                ),
              ],
            ),
            Container(
              width: MediaQuery.of(context).size.width - 70,
              height: MediaQuery.of(context).size.height / 2,
              decoration: const BoxDecoration(
                color: Colors.transparent,
                borderRadius: BorderRadius.all(
                  Radius.circular(15),
                ),
              ),
              child: ClipRRect(
                borderRadius: const BorderRadius.all(Radius.circular(15)),
                child: FadeInImage.memoryNetwork(
                  placeholder: kTransparentImage,
                  image: 'https://loremflickr.com/640/360',
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Container(
              height: MediaQuery.of(context).size.height / 5,
              padding: const EdgeInsets.symmetric(
                horizontal: 20.0,
              ),
              decoration: BoxDecoration(
                color: AppColor.lightColorScheme.onPrimary,
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(30.0),
                  topRight: Radius.circular(30.0),
                ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "${widget.name}",
                    style: AppStyle.headline5.copyWith(),
                  ),
                  const SizedBox(
                    height: 5.0,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "#${widget.price}",
                        style: AppStyle.headline4.copyWith(),
                      ),
                      Row(
                        children: [
                          Container(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 10.0,
                              vertical: 5.0,
                            ),
                            decoration: BoxDecoration(
                              border: Border.all(
                                width: 0.4,
                              ),
                              borderRadius: BorderRadius.circular(20.0),
                            ),
                            child: Row(
                              children: [
                                InkResponse(
                                  onTap: () {
                                    setState(() {
                                      if (productCount <= 1) {
                                        productCount = 1;
                                      } else {
                                        productCount--;
                                      }
                                    });
                                  },
                                  child: Text(
                                    "-",
                                    style: AppStyle.button.copyWith(
                                      fontSize: 20.0,
                                    ),
                                  ),
                                ),
                                Container(
                                  margin: const EdgeInsets.symmetric(
                                    horizontal: 20.0,
                                  ),
                                  child: Text(
                                    "$productCount",
                                    style: AppStyle.caption.copyWith(
                                      fontSize: 20.0,
                                    ),
                                  ),
                                ),
                                InkResponse(
                                  onTap: () {
                                    setState(() {
                                      productCount++;
                                    });
                                  },
                                  child: Text(
                                    "+",
                                    style: AppStyle.button.copyWith(
                                      fontSize: 20.0,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          const SizedBox(
                            width: 20.0,
                          ),
                          InkResponse(
                            child: AppButton(
                              onPressed: () {
                                CartProvider()
                                    .addCart(
                                  userId: UserAuth().getUserId,
                                  quantity: productCount.toString(),
                                  productId: widget.productId,
                                )
                                    .then(
                                  (value) {
                                    Navigator.pushReplacementNamed(
                                      context,
                                      Foodelo.checkOutScreen,
                                    );
                                  },
                                );
                              },
                              buttonWidth: 80,
                              buttonHeigth: 15,
                              title: "cart",
                            ),
                          ),
                        ],
                      ),
                    ],
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
