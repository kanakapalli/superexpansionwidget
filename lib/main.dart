import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // TRY THIS: Try running your application with "flutter run". You'll see
        // the application has a blue toolbar. Then, without quitting the app,
        // try changing the seedColor in the colorScheme below to Colors.green
        // and then invoke "hot reload" (save your changes or press the "hot
        // reload" button in a Flutter-supported IDE, or press "r" if you used
        // the command line to start the app).
        //
        // Notice that the counter didn't reset back to zero; the application
        // state is not lost during the reload. To reset the state, use hot
        // restart instead.
        //
        // This works for code too, not just values: Most code changes can be
        // tested with just a hot reload.
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const SuperWidget(
        children: [Text("asdasd"), Text("asdasdasd"), Text("asdasdasd")],
      ),
    );
  }
}

class SuperWidget extends StatefulWidget {
  final List<Widget> children;
  const SuperWidget({super.key, required this.children});

  @override
  State<SuperWidget> createState() => _SuperWidgetState();
}

class _SuperWidgetState extends State<SuperWidget> {
  int? selectIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
        shrinkWrap: true,
        itemCount: widget.children.length,
        itemBuilder: (context, index) {
          return GestureDetector(
              onTap: () {
                if (selectIndex == index) {
                  selectIndex = null;
                } else {
                  selectIndex = index;
                }
                setState(() {});
              },
              child: HelloCard(
                  isActive: selectIndex == index,
                  child: widget.children[index]));
        },
      ),
    );
  }
}

class HelloCard extends StatelessWidget {
  final bool isActive;
  final Widget child;
  final String? title;

  const HelloCard({
    super.key,
    required this.isActive,
    required this.child,
    this.title,
  });

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      margin: const EdgeInsets.all(8),
      duration: const Duration(microseconds: 1500),
      color: Colors.blue,
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  "asdas",
                ),
                isActive
                    ? const Icon(Icons.arrow_upward) // Up arrow icon
                    : const Icon(Icons.arrow_downward),
              ],
            ),
          ),
          if (isActive)
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: child,
            )
        ],
      ),
    );
  }
}
