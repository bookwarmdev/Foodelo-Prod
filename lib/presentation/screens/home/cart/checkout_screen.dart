import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:foodelo/core/core.dart';
import 'package:foodelo/presentation/routers/router.dart';
import 'package:transparent_image/transparent_image.dart';

class CheckOutScreen extends StatefulWidget {
  const CheckOutScreen({Key? key}) : super(key: key);

  @override
  State<CheckOutScreen> createState() => _CheckOutScreenState();
}

class _CheckOutScreenState extends State<CheckOutScreen> {
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
            Row(
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
                      image:
                          'https://cdn.pixabay.com/photo/2020/12/09/09/27/women-5816861_960_720.jpg',
                      fit: BoxFit.cover,
                      // width: 100,
                    ),
                  ),
                ),
                const SizedBox(
                  width: 20.0,
                ),
                SizedBox(
                  width: MediaQuery.of(context).size.width / 1.3,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text("Item NAme"),
                          IconButton(
                            onPressed: () {},
                            icon: Icon(
                              Icons.close,
                              size: 16,
                            ),
                          ),
                        ],
                      ),
                      Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                "Amount",
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
                                        borderRadius: BorderRadius.circular(
                                          50.0,
                                        ),
                                      ),
                                      child: const Icon(Icons.remove),
                                    ),
                                  ),
                                  Container(
                                    margin: const EdgeInsets.symmetric(
                                      horizontal: 5.0,
                                    ),
                                    child: Text(
                                      "1",
                                      style: AppStyle.caption.copyWith(
                                        fontSize: 20.0,
                                      ),
                                    ),
                                  ),
                                  IconButton(
                                    onPressed: () {},
                                    icon: Container(
                                      decoration: BoxDecoration(
                                        color: AppColor.lightColorScheme.shadow,
                                        border: Border.all(
                                          width: 0.8,
                                        ),
                                        borderRadius: BorderRadius.circular(
                                          50.0,
                                        ),
                                      ),
                                      child: Icon(
                                        Icons.add,
                                        color: AppColor
                                            .lightColorScheme.background,
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
            ),
            Column(
              children: [
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
                      "#030330",
                      style: AppStyle.headline6.copyWith(
                        color: AppColor.lightColorScheme.onPrimaryContainer,
                      ),
                    ),
                  ],
                ),
              ],
            ),
            AppButton(
              title: "Proceed To Checkout",
              onPressed: () {},
            ),
          ],
        ),
      ),
    );
  }
}
