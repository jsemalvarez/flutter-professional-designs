import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

class PinteresPage extends StatelessWidget {
  const PinteresPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: PinteresGrid(),
      ),
    );
  }
}

class PinteresGrid extends StatelessWidget {

  // final List<Widget> items = List.generate(10, (index) {
  //   return StaggeredGridTile.count(
  //         crossAxisCellCount: 2,
  //         mainAxisCellCount: index.isEven ? 2 : 3,
  //         child: PinteresItem(
  //           index: index,
  //           extend: 50,
  //         ),
  //   );
  // });

  PinteresGrid({super.key});

  @override
  Widget build(BuildContext context) {
    return MasonryGridView.count(
      crossAxisCount: 2,
      mainAxisSpacing: 4,
      crossAxisSpacing: 4,
      itemCount: 20,
      itemBuilder: (context, index) {
        // return Tile(
        //   index: index,
        //   extent: (index % 5 + 1) * 100,
        // );
        return PinteresItem(
          index: index, 
          extend: (index % 5 + 1) * 100
        );
      },
    );
  }
}

class PinteresItem extends StatelessWidget {

  final int index;
  final double extend;
  
  const PinteresItem({
    Key? key, 
    required this.index, 
    required this.extend,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container( 
      height: extend,
      decoration: const BoxDecoration(
        color: Colors.blue,
        borderRadius:  BorderRadius.all(Radius.circular(10))
      ),
      child: Center(
        child: CircleAvatar(
          backgroundColor: Colors.white,
          child: Text('$index'),
        )
      )
      );
  }
}