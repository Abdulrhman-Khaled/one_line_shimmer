import 'package:flutter/material.dart';
import 'package:one_line_shimmer/one_line_shimmer.dart';

void main() {
  runApp(const MaterialApp(home: ExampleScreen()));
}

class ExampleScreen extends StatelessWidget {
  const ExampleScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("One Line Shimmer Example")),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("Default", style: Theme.of(context).textTheme.headlineSmall),
            OneLineShimmer(
              width: 200,
              height: 80,
            ),
            Divider(),
            Text("Border radius & full width",
                style: Theme.of(context).textTheme.headlineSmall),
            OneLineShimmer(
              width: double.infinity,
              height: 40,
              borderRadius: BorderRadius.circular(80),
            ),
            Divider(),
            Text("Square with color",
                style: Theme.of(context).textTheme.headlineSmall),
            OneLineShimmer(
              width: 200,
              height: 200,
              borderRadius: BorderRadius.circular(0),
              baseColor: Colors.green,
              shimmerColors: [
                Colors.green.shade300,
                Colors.green.shade200,
                Colors.green.shade100,
              ],
            ),
            Divider(),
            Text("Example: Image with text below",
                style: Theme.of(context).textTheme.headlineSmall),
            OneLineShimmer(
              width: 200,
              height: 200,
              borderRadius: BorderRadius.circular(12),
            ),
            SizedBox(height: 10),
            OneLineShimmer(
              width: 200,
              height: 20,
              borderRadius: BorderRadius.circular(12),
            ),
            SizedBox(height: 5),
            OneLineShimmer(
              width: 100,
              height: 20,
              borderRadius: BorderRadius.circular(12),
            ),
          ],
        ),
      ),
    );
  }
}
