import 'package:flutter/material.dart';
import 'package:flutter_application_1/pertemuan13/pertemuan13_provider.dart';
import 'package:provider/provider.dart';

class ProgressIndicatorWidget extends StatelessWidget {
  const ProgressIndicatorWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final prov = Provider.of<Pertemuan13Provider>(context);
    return ElevatedButton(
      style: ElevatedButton.styleFrom(minimumSize: Size(100, 90)),
      onPressed: () {
        if (prov.sliderValue.round() == 0) {
          showDialog(
              context: context,
              builder: (_) => AlertDialog(
                    title: Text('Error'),
                    content: Text('Tidak dapat Memanggang Selama 0 Detik'),
                    actions: [
                      TextButton(
                        onPressed: () => Navigator.of(context).pop(),
                        child: const Text('Close'),
                      )
                    ],
                  ));
        } else
          prov.mulaiMemanggang(prov.sliderValue.round());
      },
      child: prov.sedangMemanggang == true
          ? TweenAnimationBuilder(
              tween: Tween<double>(begin: 0, end: 1),
              duration: Duration(seconds: prov.sliderValue.round()),
              builder: (context, double value, _) => CircularProgressIndicator(
                value: value,
                color: Colors.white,
              ),
            )
          : const Text('Panggang'),
    );
  }
}
