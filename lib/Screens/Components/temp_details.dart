import 'package:flutter/material.dart';
import 'package:tesla_car_animate/Screens/Components/temp_btns.dart';

import '../../constants.dart';
import '../../home_controller.dart';

class TempDetails extends StatefulWidget {
  const TempDetails({
    Key? key,
    required HomeController controller,
  })  : _controller = controller,
        super(key: key);

  final HomeController _controller;

  @override
  State<TempDetails> createState() => _TempDetailsState();
}

class _TempDetailsState extends State<TempDetails> {
  int count = 22;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(defaultPadding * 1.5),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: 120,
            child: Row(
              children: [
                TempButtons(
                  svgSrc: "assets/icons/coolShape.svg",
                  title: "Cool",
                  press: widget._controller.upadteIsSelectedTab,
                  isActive: widget._controller.isCoolSelectedTab,
                ),
                SizedBox(width: defaultPadding),
                TempButtons(
                  svgSrc: "assets/icons/heatShape.svg",
                  title: "Heat",
                  press: widget._controller.upadteIsSelectedTab,
                  isActive: !widget._controller.isCoolSelectedTab,
                  activeColor: redColor,
                ),
              ],
            ),
          ),
          Spacer(),
          Column(
            children: [
              IconButton(
                padding: EdgeInsets.zero,
                onPressed: () {
                  setState(() {
                    count = count + 1;
                  });
                },
                icon: Icon(
                  Icons.arrow_drop_up,
                  size: 48,
                ),
              ),
              Text(
                "$count" + "\u2103",
                style: TextStyle(fontSize: 86),
              ),
              IconButton(
                onPressed: () {
                  setState(() {
                    count = count - 1;
                  });
                },
                icon: Icon(
                  Icons.arrow_drop_down,
                  size: 48,
                ),
              ),
            ],
          ),
          Spacer(),
          Text(
            "current temperature".toUpperCase(),
          ),
          SizedBox(height: defaultPadding),
          Row(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("INSIDE"),
                  Text(
                    "20" + "\u2103",
                    style: Theme.of(context).textTheme.headline5,
                  ),
                ],
              ),
              SizedBox(width: defaultPadding),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "OUTSIDE",
                    style: TextStyle(
                      color: Colors.white38,
                    ),
                  ),
                  Text(
                    "35" + "\u2103",
                    style: Theme.of(context)
                        .textTheme
                        .headline5!
                        .copyWith(color: Colors.white38),
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
