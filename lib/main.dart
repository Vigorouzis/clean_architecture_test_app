import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:story_view/controller/story_controller.dart';
import 'package:story_view/widgets/story_view.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: ElevatedButton(
            onPressed: () => Navigator.of(context).push(MaterialPageRoute(
              builder: (context) => StoryScreen(),
            )),
            child: Text('Open story'),
          ),
        ),
      ),
    );
  }
}

class StoryScreen extends StatefulWidget {
  const StoryScreen({Key? key}) : super(key: key);

  @override
  _StoryScreenState createState() => _StoryScreenState();
}

class _StoryScreenState extends State<StoryScreen> {
  StoryController? _storyController;

  List<StoryItem?> _storyItems = [
    StoryItem.pageProviderImage(AssetImage('assets/start_video/11a.gif'),
        imageFit: BoxFit.cover),
    StoryItem.pageProviderImage(AssetImage('assets/start_video/22a.gif'),
        imageFit: BoxFit.cover),
    StoryItem.pageProviderImage(AssetImage('assets/start_video/33a.gif'),
        imageFit: BoxFit.cover),
    StoryItem.pageProviderImage(AssetImage('assets/start_video/44a.gif'),
        imageFit: BoxFit.cover)
  ];

  @override
  void initState() {
    super.initState();
    _storyController = StoryController();
  }

  @override
  void dispose() {
    _storyController?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          child: StoryView(
            //  onComplete: () => Navigator.of(context).pop(),
            controller: _storyController!,
            storyItems: _storyItems,
          ),
        ),
        Align(
          alignment: Alignment.bottomCenter,
          child: Padding(
            padding: const EdgeInsets.only(bottom: 39, left: 16, right: 16),
            child: Row(
              children: [
                TextButton(
                  onPressed: () => print('hello'),
                  child: Text(
                    'войти',
                    style: TextStyle(
                        fontFamily: 'Noah',
                        fontWeight: FontWeight.w700,
                        fontSize: 16,
                        color: Colors.black),
                  ),
                ),
                Spacer(),
                SvgPicture.asset(
                  'assets/forward_arrow.svg',
                  width: 43,
                  height: 15,
                  fit: BoxFit.none,
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
