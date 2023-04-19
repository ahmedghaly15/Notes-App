import 'package:flutter/material.dart';

import '/shared/constants.dart';
import '/cubits/add_note_cubit/add_note_cubit.dart';

class ColorsListView extends StatefulWidget {
  const ColorsListView({super.key});

  @override
  State<ColorsListView> createState() => _ColorsListViewState();
}

class _ColorsListViewState extends State<ColorsListView> {
  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 23 * 2,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        physics: const BouncingScrollPhysics(),
        itemBuilder: (context, index) => GestureDetector(
          onTap: () {
            currentIndex = index;
            AddNoteCubit.getObject(context).color = kColors[index];
            setState(
              () {},
            );
          },
          child: ColorItem(
            isSelected: currentIndex == index,
            color: kColors[index],
          ),
        ),
        separatorBuilder: (context, index) => const SizedBox(
          width: 6,
        ),
        itemCount: kColors.length,
      ),
    );
  }
}

class ColorItem extends StatelessWidget {
  final bool isSelected;
  final Color color;
  const ColorItem({
    super.key,
    required this.isSelected,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      radius: 23,
      backgroundColor: color,
      child: isSelected
          ? const Icon(
              Icons.check,
              color: Colors.white,
              size: 25,
            )
          : null,
    );
  }
}
