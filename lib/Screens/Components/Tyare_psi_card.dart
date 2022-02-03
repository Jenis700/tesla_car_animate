import 'package:flutter/material.dart';
import 'package:tesla_car_animate/Model/TyrePsi.dart';
import 'package:tesla_car_animate/constants.dart';

class TyrePsiCard extends StatelessWidget {
  const TyrePsiCard({
    Key? key,
    required this.isottomTwoTyre,
    required this.tyrePsi,
  }) : super(key: key);

  final bool isottomTwoTyre;
  final TyresPsi tyrePsi;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(defaultPadding),
      margin: EdgeInsets.all(defaultPadding / 4),
      decoration: BoxDecoration(
        color: tyrePsi.isLowPressure
            ? Colors.red.withOpacity(0.11)
            : Colors.white10,
        border: Border.all(
            color: tyrePsi.isLowPressure ? Colors.red : primaryColor, width: 2),
        borderRadius: BorderRadius.circular(6),
      ),
      child: isottomTwoTyre
          ? Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                lowPressure(context),
                Spacer(),
                psiText(context, psi: tyrePsi.psi.toString()),
                Text(
                  tyrePsi.temp.toString() + "\u2103",
                  style: TextStyle(fontSize: 16),
                ),
              ],
            )
          : Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                psiText(context, psi: tyrePsi.psi.toString()),
                Text(
                  tyrePsi.temp.toString() + "\u2103",
                  style: TextStyle(fontSize: 16),
                ),
                Spacer(),
                lowPressure(context),
              ],
            ),
    );
  }

  Column lowPressure(BuildContext context) {
    return Column(
      children: [
        Text(
          "LOW",
          style: Theme.of(context).textTheme.headline3!.copyWith(
                fontWeight: FontWeight.w600,
              ),
        ),
        Text(
          "PRESSURE",
          style: TextStyle(fontSize: 20),
        )
      ],
    );
  }

  Text psiText(BuildContext context, {required String psi}) {
    return Text.rich(
      TextSpan(
        text: psi,
        style: Theme.of(context).textTheme.headline4!.copyWith(
              fontSize: 30,
              fontWeight: FontWeight.w600,
              color: Colors.white,
            ),
        children: [
          TextSpan(
            text: "psi\n",
            style: TextStyle(fontSize: 24),
          ),
        ],
      ),
    );
  }
}
