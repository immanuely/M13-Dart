import 'package:flutter/material.dart';
import 'package:flutter_application_1/pertemuan13/pertemuan13_provider.dart';
import 'package:provider/provider.dart';
import 'package:syncfusion_flutter_sliders/sliders.dart';

class SlideWidget extends StatelessWidget {
  const SlideWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final prov = Provider.of<Pertemuan13Provider>(context);
    return Tooltip(
      message: prov.sliderValue.toString(),
      child: SfSlider(
        value: prov.sliderValue,
        min: 0,
        max: 10,
        enableTooltip: true,
        onChanged: (dynamic value) {
          prov.setSliderValue = value;
        },
      ),
    );
  }
}
