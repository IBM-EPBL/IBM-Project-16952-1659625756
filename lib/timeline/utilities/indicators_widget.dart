import 'package:flutter/material.dart';
import 'package:ledgerfe/timeline/utilities/pie_data.dart';

class IndicatorsWidget extends StatelessWidget {
  const IndicatorsWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: PieData.data
      .map(
          (data) => Container(
            padding: EdgeInsets.symmetric(vertical: MediaQuery.of(context).size.width*0.005),
            child: buildIndicator(color: data.color, text: data.tag),
          )
      ).toList(),
    );
  }
  Widget buildIndicator({
    required Color color,
    required String text,
    bool isSquare = false,
    double size =16,
    Color textColor = const Color(0xff505050),
  }) => Row(
          children: <Widget>[
            Container(
              height: size,
              width: size,
              decoration: BoxDecoration(
                shape: isSquare ? BoxShape.rectangle : BoxShape.circle,
                color: color
              ),
            ),
            const SizedBox(
              width: 8,
            ),
            Text(
              text,
              style: TextStyle(
                fontSize: 16,
                color: textColor,
              ),
            )
          ],
        );
}

