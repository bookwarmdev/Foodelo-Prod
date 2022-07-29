import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:foodelo/core/core.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            ClipRRect(
              child: Image.asset(
                "assets/images/Container.png",
              ),
            ),
            Text(
              "Full Name",
              style: AppStyle.headline3.copyWith(),
            ),
            InkWell(
              onTap: () {},
              child: Container(
                padding: const EdgeInsets.all(10.0),
                decoration: BoxDecoration(
                  color:
                      AppColor.lightColorScheme.inversePrimary.withOpacity(0.4),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "name",
                      style: AppStyle.headline4.copyWith(),
                    ),
                    IconButton(
                      onPressed: () {},
                      icon: Icon(
                        Icons.chevron_right_rounded,
                      ),
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
