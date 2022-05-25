import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

class SwitchesCard extends StatefulWidget {
  const SwitchesCard({
    Key? key,
    required this.titles,
  }) : super(key: key);

  final List<String> titles;

  @override
  State<SwitchesCard> createState() => _SwitchesCardState();
}

class _SwitchesCardState extends State<SwitchesCard> {
  late List<bool> switches = List.filled(widget.titles.length, false);

  @override
  Widget build(BuildContext context) {
    double scaleFactor = 0.8;
    return Card(
      child: SizedBox(
        height: 1 * 38,
        // height: widget.titles.length * 38,
        // width: 180,
        child: ListView.builder(
          physics: const NeverScrollableScrollPhysics(),
          shrinkWrap: true,
          scrollDirection: Axis.horizontal,
          primary: false,
          // the number of items in the list
          itemCount: widget.titles.length,

          // display each item of the product list
          itemBuilder: (context, index) {
            return Card(
              // In many cases, the key isn't mandatory
              key: UniqueKey(),
              child: SizedBox(
                height: 30,
                child: Padding(
                  padding: const EdgeInsets.all(5),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        widget.titles[index],
                        style: Theme.of(context).textTheme.bodyText1,
                      ),
                      Transform.scale(
                        scale: scaleFactor,
                        child: CupertinoSwitch(
                          value: switches[index],
                          onChanged: (value) {
                            setState(() {
                              switches[index] = value;
                            });
                          },
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
