import 'package:flutter/material.dart';

class GenderContainer extends StatelessWidget {
  const GenderContainer(
      {super.key,
      required this.textGender,
      required this.onTap,
      required this.isFemal});
  final String textGender;
  final void Function()? onTap;
  final bool? isFemal;
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: GestureDetector(
        onTap: onTap,
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
            color: ((isFemal == true && textGender == 'Female') ||
                   ( isFemal == false && textGender == 'Male')
                ? Color(0xff333244)
                : Color(0xff1E1E1E)),
          ),
          margin: EdgeInsets.all(10),
          padding: EdgeInsets.all(10),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                textGender == 'Male' ? Icons.male : Icons.female,
                color: Color(0xffffffff),
                size: 100,
              ),
              Text(
                textGender,
                style: TextStyle(
                  color: Color(0xffffffff),
                  fontSize: 20,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

//condition ?  true: false
