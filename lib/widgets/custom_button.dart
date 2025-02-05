import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;
  final bool isLoading;
  final Widget? icon;
  final Color backgroundColor;
  final double width;
  final double height;
  final bool isOutlined;

  const CustomButton({
    super.key,
    required this.text,
    required this.onPressed,
    this.isLoading = false,
    this.icon,
    this.backgroundColor = const Color.fromARGB(255, 163, 29, 29),
    this.width = double.infinity,
    this.height = 40,
    this.isOutlined = false,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      height: height,
      child: isLoading
          ? Center(child: CircularProgressIndicator())
          : icon != null
              ? ElevatedButton.icon(
                  icon: icon!,
                  label: Text(
                    text,
                    style: TextStyle(
                      fontFamily: 'Roboto',
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: backgroundColor,
                    foregroundColor: Colors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  onPressed: onPressed,
                )
              : isOutlined
                  ? OutlinedButton(
                      style: OutlinedButton.styleFrom(
                        foregroundColor: backgroundColor,
                        side: BorderSide(color: backgroundColor),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                      onPressed: onPressed,
                      child: Text(
                        text,
                        style: TextStyle(
                          fontFamily: 'Roboto',
                          fontSize: 15,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    )
                  : ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: backgroundColor,
                        foregroundColor: Colors.white,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                      onPressed: onPressed,
                      child: Text(
                        text,
                        style: TextStyle(
                          fontFamily: 'Roboto',
                          fontSize: 15,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
    );
  }
}
