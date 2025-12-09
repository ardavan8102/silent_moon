import 'package:flutter/material.dart';

class WeekdaySelector extends StatefulWidget {
  const WeekdaySelector({super.key});

  @override
  State<WeekdaySelector> createState() => _WeekdaySelectorState();
}

class _WeekdaySelectorState extends State<WeekdaySelector> {
  final List<String> days = [
    'شنبه', 'یکشنبه', 'دوشنبه', 'سه‌شنبه', 'چهارشنبه', 'پنج‌شنبه', 'جمعه',
  ];
  final List<bool> selected = [true, false, true, false, true, false, true];

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: days.length,
      scrollDirection: .horizontal,
      itemBuilder: (context, index) {
        final isSelected = selected[index];
        return GestureDetector(
          onTap: () {
            setState(() {
              selected[index] = !selected[index];
            });
          },
          child: AnimatedContainer(
            duration: const Duration(milliseconds: 200),
            margin: index == 0 
              ? const EdgeInsets.only(left: 8)
              : index == days.length -1
                ? const EdgeInsets.only(right: 8)
                : const EdgeInsets.symmetric(horizontal: 8),
            width: 96,
            height: 48,
            decoration: BoxDecoration(
              color: isSelected ? Colors.black87 : Colors.transparent,
              border: Border.all(
                color: isSelected ? Colors.black87 : Colors.grey.shade400,
                width: 1.5,
              ),
              borderRadius: .circular(10)
            ),
            child: Center(
              child: Text(
                days[index],
                style: TextStyle(
                  color: isSelected ? Colors.white : Colors.grey.shade700,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
          ),
        );
      }
    );
  }
}