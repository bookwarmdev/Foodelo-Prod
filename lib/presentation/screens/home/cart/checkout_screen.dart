import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:foodelo/controller/provider/cart_provider.dart';
import 'package:foodelo/core/core.dart';
import 'package:foodelo/data/models/cart_model.dart';
import 'package:foodelo/presentation/routers/router.dart';
import 'package:transparent_image/transparent_image.dart';

class CheckOutScreen extends StatefulWidget {
  const CheckOutScreen({Key? key}) : super(key: key);

  @override
  State<CheckOutScreen> createState() => _CheckOutScreenState();
}

class _CheckOutScreenState extends State<CheckOutScreen> {
  CartModel? products;
  int? productCount;
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      CartProvider().viewAppCart().then((value) {
        setState(() {
          products = value;
        });
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.lightColorScheme.onInverseSurface,
      body: SafeArea(
        child: Column(
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
                  "Shopping",
                  style: AppStyle.headline5.copyWith(
                    color: AppColor.lightColorScheme.onPrimaryContainer,
                  ),
                ),
                IconButton(
                  onPressed: () {
                    Navigator.pushReplacementNamed(
                      context,
                      Foodelo.homeScreen,
                    );
                  },
                  icon: SvgPicture.asset(
                    "assets/svgs/home.svg",
                    color: AppColor.lightColorScheme.primary,
                    height: 100,
                    width: 150,
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 10.0,
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 20.0,
                ),
                child: ListView.builder(
                    itemCount: products?.cart?.data?[0].items?.length,
                    shrinkWrap: true,
                    itemBuilder: (context, index) {
                      return Row(
                        children: [
                          Container(
                            width: 65,
                            height: 60,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(
                                50.0,
                              ),
                            ),
                            child: ClipRRect(
                              borderRadius: const BorderRadius.all(
                                Radius.circular(15),
                              ),
                              child: FadeInImage.memoryNetwork(
                                placeholder: kTransparentImage,
                                image: 'https://loremflickr.com/640/360',
                                fit: BoxFit.cover,
                                // width: 100,
                              ),
                            ),
                          ),
                          const SizedBox(
                            width: 20.0,
                          ),
                          SizedBox(
                            width: MediaQuery.of(context).size.width / 1.5,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    const Text("Loafers shoe"),
                                    IconButton(
                                      onPressed: () {},
                                      icon: const Icon(
                                        Icons.close,
                                        size: 16,
                                      ),
                                    ),
                                  ],
                                ),
                                Column(
                                  children: [
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(
                                          "${products?.cart?.data?[0].items?[index].amount}",
                                        ),
                                        Row(
                                          children: [
                                            IconButton(
                                              onPressed: () {},
                                              icon: Container(
                                                decoration: BoxDecoration(
                                                  border: Border.all(
                                                    width: 0.8,
                                                  ),
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                    50.0,
                                                  ),
                                                ),
                                                child: const Icon(Icons.remove),
                                              ),
                                            ),
                                            Container(
                                              margin:
                                                  const EdgeInsets.symmetric(
                                                horizontal: 5.0,
                                              ),
                                              child: Text(
                                                "${products?.cart?.data?[0].items?[index].quantity}",
                                                style:
                                                    AppStyle.caption.copyWith(
                                                  fontSize: 20.0,
                                                ),
                                              ),
                                            ),
                                            IconButton(
                                              onPressed: () {},
                                              icon: Container(
                                                decoration: BoxDecoration(
                                                  color: AppColor
                                                      .lightColorScheme.shadow,
                                                  border: Border.all(
                                                    width: 0.8,
                                                  ),
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                    50.0,
                                                  ),
                                                ),
                                                child: Icon(
                                                  Icons.add,
                                                  color: AppColor
                                                      .lightColorScheme
                                                      .background,
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ],
                                    )
                                  ],
                                )
                              ],
                            ),
                          ),
                        ],
                      );
                    }),
              ),
            ),
            Container(
              decoration: BoxDecoration(
                color: AppColor.lightColorScheme.onInverseSurface,
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(30.0),
                  topRight: Radius.circular(30.0),
                ),
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
              ),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                child: Column(
                  children: [
                    const SizedBox(
                      height: 20.0,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Subtotal",
                          style: AppStyle.headline6.copyWith(
                            color: AppColor.lightColorScheme.onPrimaryContainer,
                          ),
                        ),
                        Text(
                          "#${products?.cart?.data?[0].total}",
                          style: AppStyle.headline6.copyWith(
                            color: AppColor.lightColorScheme.onPrimaryContainer,
                          ),
                        ),
                      ],
                    ),
                    Container(
                      margin: const EdgeInsets.only(
                        bottom: 20.0,
                        top: 20.0,
                      ),
                      child: AppButton(
                        title: "Proceed To Checkout",
                        onPressed: () {},
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
}
