import 'package:flutter/material.dart';

import '../platform/widgets.dart';

class Grid extends StatelessWidget {
  var number = [];
  Function onClick;
  Grid({required this.number, required this.onClick});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: PuzzlePlatform.gridBox(context),
      width: PuzzlePlatform.gridBox(context),
      child: GridView.builder(
          itemCount: number.length,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 4,
            childAspectRatio: 1,
            mainAxisSpacing: 2,
            crossAxisSpacing: 2,
          ),
          itemBuilder: (context, index) {
            return number[index] != 0
                ? InkWell(
                    splashColor: Colors.black,
                    borderRadius: BorderRadius.circular(10),
                    onTap: () => onClick(index),
                    child: Container(
                      height: 400,
                      width: 400,
                      decoration: BoxDecoration(
                        color: Colors.blue.shade900,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Center(
                        child: Text(
                          number[index].toString(),
                          style: Theme.of(context)
                              .textTheme
                              .headline5!
                              .copyWith(
                                  color: Colors.white,
                                 ),
                        ),
                      ),
                    ),
                  )
                : const SizedBox.shrink();
          }),
    );
  }
}
