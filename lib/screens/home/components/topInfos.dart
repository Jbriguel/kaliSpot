import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:kalispot/theme/colors/appColors.dart';
import 'package:kalispot/theme/images/appImages.dart';
import 'package:kalispot/widgets/CustomImageView.dart';
import 'package:line_awesome_flutter/line_awesome_flutter.dart';

const TextStyle bodyTextStyle = TextStyle(
    fontSize: 14,
    color: AppColors.easyGreen,
    height: 1.5,
    fontFamily: 'Roboto');

class topInfos extends StatefulWidget {
  topInfos({
    super.key,
    required this.drawerKey,
  });
  GlobalKey<ScaffoldState> drawerKey;

  @override
  State<topInfos> createState() => _topInfosState();
}

class _topInfosState extends State<topInfos> {
  Padding get separateur => const Padding(
        padding: EdgeInsets.symmetric(horizontal: 5, vertical: 5),
        child: Icon(
          LineAwesomeIcons.slash_solid,
          color: AppColors.easyGreen,
        ),
      );

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60,
      width: double.infinity,
      color: Colors.black,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const SizedBox(width: 10),
          GestureDetector(
            onTap: () => widget.drawerKey.currentState?.openDrawer(),
            child: Container(
              margin: const EdgeInsets.all(5),
              padding: const EdgeInsets.all(8),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5),
                // color: AppColors.easyGreen.withOpacity(0.4)
              ),
              child: const Icon(CupertinoIcons.bars,
                  color: AppColors.easyGreen, size: 28),
            ),
          ),
          const SizedBox(width: 10),
          Padding(
            padding: const EdgeInsets.all(5),
            child: CustomImageView(
              imagePath: AppImages.verticalLogo,
              fit: BoxFit.contain,
              height: 70,
            ),
          ),
          Expanded(
            child: Wrap(
              crossAxisAlignment: WrapCrossAlignment.center,
              alignment: WrapAlignment.end,
              runAlignment: WrapAlignment.spaceBetween,
              runSpacing: 8,
              children: [
                Column(mainAxisSize: MainAxisSize.min, children: [
                  Text(
                    "Saîdou Kanté",
                    textAlign: TextAlign.center,
                    style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                          color: Colors.white.withOpacity(.9),
                          fontFamily: 'Google Sans',
                        ),
                  ),
                  Text(
                    "(+223) 77 51 20 19",
                    textAlign: TextAlign.center,
                    style: Theme.of(context).textTheme.labelSmall!.copyWith(
                          color: Colors.white70,
                          fontFamily: 'Google Sans',
                        ),
                  ),
                ]),
                const SizedBox(width: 10),
                Container(
                  margin: const EdgeInsets.all(5),
                  padding: const EdgeInsets.all(8),
                  decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: AppColors.easyGreen.withOpacity(0.4)),
                  child: const Icon(LineAwesomeIcons.user,
                      color: AppColors.easyGreen, size: 24),
                ),
                const SizedBox(width: 10)
              ],
            ),
          )
        ],
      ),
    );
  }
}
