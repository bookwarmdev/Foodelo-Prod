import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:foodelo/controller/controller.dart';
import 'package:foodelo/core/core.dart';
import 'package:foodelo/data/models/product_model.dart';
import 'package:foodelo/presentation/routers/router.dart';
import 'package:foodelo/presentation/screens/home/cart/cart_screen.dart';
import 'package:staggered_grid_view_flutter/widgets/staggered_grid_view.dart';
import 'package:staggered_grid_view_flutter/widgets/staggered_tile.dart';
import 'package:transparent_image/transparent_image.dart';

class HoemScreen extends StatefulWidget {
  const HoemScreen({Key? key}) : super(key: key);

  @override
  State<HoemScreen> createState() => _HoemScreenState();
}

class _HoemScreenState extends State<HoemScreen> {
  int? productLength;
  ProductModel? products;
  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      CartProvider().viewAllProduct().then((value) {
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
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 20.0,
          ),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  IconButton(
                    onPressed: () {
                      Navigator.pushNamed(
                        context,
                        Foodelo.profileScreen,
                      );
                    },
                    icon: Image.asset(
                      "assets/images/Container.png",
                    ),
                  ),
                  Text(
                    "Foofelo",
                    style: AppStyle.headline5.copyWith(
                      color: AppColor.lightColorScheme.onPrimaryContainer,
                    ),
                  ),
                  IconButton(
                    onPressed: () {
                      Navigator.pushNamed(
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
              const SizedBox(
                height: 10.0,
              ),
              Expanded(
                child: StaggeredGridView.countBuilder(
                  crossAxisCount: 2,
                  crossAxisSpacing: 30,
                  mainAxisSpacing: 30,
                  shrinkWrap: true,
                  itemCount: products?.products?.data?.length,
                  itemBuilder: (context, index) {
                    return InkResponse(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => CartScreen(
                              name: products?.products?.data?[index].name,
                              price: products?.products?.data?[index].price,
                            ),
                          ),
                        );
                      },
                      child: Container(
                        decoration: const BoxDecoration(
                          color: Colors.transparent,
                          borderRadius: BorderRadius.all(
                            Radius.circular(15),
                          ),
                        ),
                        child: ClipRRect(
                          borderRadius: const BorderRadius.all(
                            Radius.circular(15),
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Expanded(
                                child: FadeInImage.memoryNetwork(
                                  placeholder: kTransparentImage,
                                  image: "https://loremflickr.com/640/360",
                                  fit: BoxFit.cover,
                                ),
                              ),
                              Text(
                                "${products?.products?.data?[index].name}",
                                style: AppStyle.caption.copyWith(
                                  fontSize: 17.0,
                                ),
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    "#${products?.products?.data?[index].price}",
                                    style: AppStyle.headline5.copyWith(),
                                  ),
                                  IconButton(
                                      onPressed: () {},
                                      icon: Container(
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(50.0),
                                          boxShadow: [
                                            BoxShadow(
                                              color:
                                                  Colors.grey.withOpacity(0.5),
                                              spreadRadius: 4,
                                              blurRadius: 7,
                                              offset: const Offset(
                                                0,
                                                0,
                                              ), // changes position of shadow
                                            ),
                                          ],
                                          color: AppColor
                                              .lightColorScheme.onPrimary,
                                        ),
                                        child: Padding(
                                          padding: const EdgeInsets.all(5.0),
                                          child: SvgPicture.asset(
                                            "assets/svgs/favorite.svg",
                                          ),
                                        ),
                                      ))
                                ],
                              )
                            ],
                          ),
                        ),
                      ),
                    );
                  },
                  staggeredTileBuilder: (int index) =>
                      StaggeredTile.count(1, index.isEven ? 2 : 1),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
