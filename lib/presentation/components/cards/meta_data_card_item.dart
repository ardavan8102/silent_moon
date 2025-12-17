import 'package:flutter/material.dart';
import 'package:silent_moon/consts/colors.dart';

class PodcastMetaDataCardBoxWithIcon extends StatelessWidget {
  const PodcastMetaDataCardBoxWithIcon({
    super.key,
    required this.size,
    required this.textTheme,
    required this.icon,
    required this.value,
    required this.label,
  });

  final Size size;
  final TextTheme textTheme;

  final IconData icon;
  final String value;
  final String label;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        height: size.height * .18,
        padding: EdgeInsets.all(12),
        decoration: BoxDecoration(
          color: AppSolidColors.primary.withValues(alpha: .15),
          borderRadius: .circular(10),
        ),
        child: Center(
          child: Column(
            mainAxisAlignment: .center,
            children: [
              
              // icon
              Container(
                padding: EdgeInsets.all(10),
                height: size.height * .06,
                width: size.height * .06,
                decoration: BoxDecoration(
                  color: AppSolidColors.primary,
                  borderRadius: .circular(6)
                ),
                child: Icon(
                  icon,
                  size: 30,
                  color: Colors.white,
                ),
              ),
    
              const SizedBox(height: 20),
    
    
              // data
              Text(
                value,
                style: textTheme.labelLarge!.copyWith(
                  color: AppSolidColors.primary
                ),
              ),
              Expanded(
                child: Text(
                  label,
                  style: textTheme.labelSmall!.copyWith(fontSize: 12),
                ),
              ),
    
            ],
          )
        ),
      ),
    );
  }
}