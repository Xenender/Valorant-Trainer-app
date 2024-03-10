
import 'package:flutter/material.dart';

class BoutonValorant extends StatelessWidget {

  static const Color redValo = Color(0xFFFD4554);
  static const TextStyle styleBase = TextStyle(color: Colors.white, fontSize: 17);
  final String text;
  final TextStyle textStyle;
  final Color color;
  final double width;
  final double height;
  final Function onTap;
  final bool enabled;

  const BoutonValorant({
    required this.text,
    super.key,
    this.textStyle = styleBase,
    this.color = redValo,
    this.width = 200.0,
    this.height = 50.0,
    required this.onTap,
    this.enabled = true
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        if(enabled) this.onTap();
      },
      child: Padding(padding: EdgeInsets.all(10),
        child:
        Container(
          width: this.width,
          decoration: BoxDecoration(
              color: enabled ? this.color : Color(0xFFcccccc),

              borderRadius: BorderRadius.circular(15)
          ),
          child: Padding(
              padding: EdgeInsets.all(4.0),
              child:
              Container(
                padding: EdgeInsets.all(4),
                decoration: BoxDecoration(
                    border: Border.all(color: Color(0xCDFFFFFF),width: 0.7),
                    borderRadius: BorderRadius.circular(15)

                ),

                child:  Text(
                  this.text,
                  textAlign: TextAlign.center,
                  style: this.textStyle
                ),
              )


          ),
        )

        ,
      )
      ,);
  }
}
