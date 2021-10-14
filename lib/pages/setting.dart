import 'package:flutter/material.dart';

class SettingPage extends StatefulWidget {
  @override
  _SettingPageState createState() => _SettingPageState();
}

class _SettingPageState extends State<SettingPage> {
  double _currentSliderValue  = 0;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        // appBar: AppBar(
        //   automaticallyImplyLeading: false,
        //   backgroundColor: Colors.amberAccent,
        // ),
        body: Center(
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                CustomSliderWidget(size: size, currentSliderValue: _currentSliderValue),
                SizedBox(height: 15,),
                CustomSliderWidget(size: size, currentSliderValue: _currentSliderValue ),
                SizedBox(height: 15,),
                CustomSliderWidget(size: size, currentSliderValue: _currentSliderValue ),
                SizedBox(height: 15,),
                CustomSliderWidget(size: size, currentSliderValue: _currentSliderValue ),

              ],
            ),
          ),
        ),
      ),
    );
  }


}

class CustomSliderWidget extends StatefulWidget {
  const CustomSliderWidget({
    Key key,
    @required this.size,
    @required double currentSliderValue,
  }) :
        //_currentSliderValue = currentSliderValue,
        super(key: key);

  final Size size;
 // final double _currentSliderValue;

  @override
  _CustomSliderWidgetState createState() => _CustomSliderWidgetState();
}

class _CustomSliderWidgetState extends State<CustomSliderWidget> {
  double _currentSliderValue = 0;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: 10, right: 10),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(20),
        child: Container(
            height: 150,
            width: widget.size.width,
            decoration: BoxDecoration(color: Colors.indigo[400]),
            child: Slider(
              value: _currentSliderValue,
              divisions: 5,
              label: _currentSliderValue.round().toString(),
              min: 0,
              max: 100,
              onChanged: (double value) {
                buildSetState(value);

              },
            )),
      ),
    );
  }

  void buildSetState(double value) {
     setState(() {
      _currentSliderValue = value;
    });
  }
}
