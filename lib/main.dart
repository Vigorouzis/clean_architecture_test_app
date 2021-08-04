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
    List<StoryItem?> _storyItems = [
      StoryItem(
        Stack(
          children: [
            Container(
              height: MediaQuery.of(context).size.height,
              child: Image(
                image: AssetImage('assets/start_video/11a.gif'),
                fit: BoxFit.cover,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 48, left: 16),
              child: Text(
                'Выбираем цели и строим план как их достичь',
                style: TextStyle(
                    fontFamily: 'Noah',
                    fontWeight: FontWeight.w700,
                    fontSize: 36,
                    color: Colors.black),
              ),
            ),
          ],
        ),
        duration: Duration(seconds: 15),
      ), StoryItem(
        Stack(
          children: [
            Container(
              height: MediaQuery.of(context).size.height,
              child: Image(
                image: AssetImage('assets/start_video/22a.gif'),
                fit: BoxFit.cover,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 48, left: 16),
              child: Text(
                'Создаём привычку идти к цели',
                style: TextStyle(
                    fontFamily: 'Noah',
                    fontWeight: FontWeight.w700,
                    fontSize: 36,
                    color: Colors.black),
              ),
            ),
          ],
        ),
        duration: Duration(seconds: 15),
      ), StoryItem(
        Stack(
          children: [
            Container(
              height: MediaQuery.of(context).size.height,
              child: Image(
                image: AssetImage('assets/start_video/33a.gif'),
                fit: BoxFit.cover,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 48, left: 16),
              child: Text(
                'Достигаем доходности',
                style: TextStyle(
                    fontFamily: 'Noah',
                    fontWeight: FontWeight.w700,
                    fontSize: 36,
                    color: Colors.black),
              ),
            ),
          ],
        ),
        duration: Duration(seconds: 15),
      ),
      StoryItem(
        Stack(
          children: [
            Container(
              height: MediaQuery.of(context).size.height,
              child: Image(
                image: AssetImage('assets/start_video/44a.gif'),
                fit: BoxFit.cover,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 48, left: 16),
              child: Text(
                'Так формируется ваш капитал',
                style: TextStyle(
                    fontFamily: 'Noah',
                    fontWeight: FontWeight.w700,
                    fontSize: 36,
                    color: Colors.black),
              ),
            ),
          ],
        ),
        duration: Duration(seconds: 15),
      ),
    ];
    return SafeArea(
      child: Material(
        child: Stack(
          children: [
            Container(
              child: StoryView(
                //  onComplete: () => Navigator.of(context).pop(),
                controller: _storyController!,
                storyItems: _storyItems,
                onStoryShow: (value) => print(value.hashCode),
              ),
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: Padding(
                padding: const EdgeInsets.only(bottom: 36, left: 16, right: 16),
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
                    const Spacer(),
                    GestureDetector(
                      onTap: () => _storyController!.next(),
                      child: SvgPicture.asset(
                        'assets/forward_arrow.svg',
                        width: 43,
                        height: 15,
                        fit: BoxFit.none,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
