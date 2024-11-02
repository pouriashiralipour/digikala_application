import 'package:digikala/models/story_model.dart';
import 'package:flutter/material.dart';
import 'dart:async';

class StoryCircle extends StatefulWidget {
  const StoryCircle({super.key});

  @override
  State<StoryCircle> createState() => _StoryCircleState();
}

class _StoryCircleState extends State<StoryCircle> {
  List<Color> startColors =
      List.generate(StoryModel.items.length, (index) => Colors.purpleAccent);
  List<Color> endColors =
      List.generate(StoryModel.items.length, (index) => Colors.red);

  void _onStoryTap(int index) {
    setState(() {
      startColors[index] = Colors.blueAccent;
      endColors[index] = Colors.green;
    });

    Future.delayed(const Duration(seconds: 1), () {
      _showFullScreenStory(index);
      setState(() {
        startColors[index] = Colors.purpleAccent;
        endColors[index] = Colors.red;
      });
    });
  }

  void _showFullScreenStory(int index) {
    Navigator.of(context).push(
      PageRouteBuilder(
        pageBuilder: (context, animation, secondaryAnimation) {
          return StoryDisplay(
            storyIndex: index,
            onClose: () => Navigator.pop(context),
          );
        },
        transitionsBuilder: (context, animation, secondaryAnimation, child) {
          return FadeTransition(
            opacity: animation,
            child: child,
          );
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: List.generate(
          startColors.length, // تعداد استوری‌ها
          (index) => Column(
            children: [
              GestureDetector(
                onTap: () => _onStoryTap(index),
                child: Stack(
                  alignment: Alignment.center,
                  children: [
                    Container(
                      width: 65,
                      height: 65,
                      padding: const EdgeInsets.all(3),
                      margin: const EdgeInsets.symmetric(
                          horizontal: 10, vertical: 15),
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        gradient: LinearGradient(
                          begin: Alignment.topRight,
                          end: Alignment.bottomLeft,
                          colors: [
                            startColors[index],
                            endColors[index],
                          ],
                        ),
                      ),
                    ),
                    CircleAvatar(
                      backgroundImage: AssetImage(StoryModel.items[index].img),
                      radius: 30,
                    ),
                  ],
                ),
              ),
              Text(
                truncateText(
                    StoryModel.items[index].title, 1), // نمایش دو کلمه اول
                textAlign: TextAlign.center,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              )
            ],
          ),
        ),
      ),
    );
  }

  String truncateText(String text, int wordLimit) {
    List<String> words = text.split(' ');
    if (words.length > wordLimit) {
      return '${words.sublist(0, wordLimit).join(' ')}...';
    } else {
      return text;
    }
  }
}

class StoryDisplay extends StatefulWidget {
  final int storyIndex;
  final VoidCallback onClose;

  const StoryDisplay({required this.storyIndex, required this.onClose});

  @override
  _StoryDisplayState createState() => _StoryDisplayState();
}

class _StoryDisplayState extends State<StoryDisplay> {
  late PageController _pageController;
  int _currentIndex = 0;
  late Timer _timer;

  @override
  void initState() {
    super.initState();
    _pageController = PageController(initialPage: _currentIndex);
    _startTimer();
  }

  void _startTimer() {
    _timer = Timer.periodic(const Duration(seconds: 15), (timer) {
      if (_currentIndex <
          StoryModel.items[widget.storyIndex].story.length - 1) {
        _currentIndex++;
      } else {
        _timer.cancel();
        widget.onClose(); // پایان استوری
        return;
      }
      _pageController.animateToPage(
        _currentIndex,
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
      setState(() {});
    });
  }

  void _goToNextStory() {
    if (_currentIndex < StoryModel.items[widget.storyIndex].story.length - 1) {
      _currentIndex++;
      _pageController.animateToPage(
        _currentIndex,
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
    } else {
      _timer.cancel();
      widget.onClose(); // پایان استوری
    }
  }

  void _goToPreviousStory() {
    if (_currentIndex > 0) {
      _currentIndex--;
      _pageController.animateToPage(
        _currentIndex,
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
    }
  }

  @override
  void dispose() {
    _timer.cancel();
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final story = StoryModel.items[widget.storyIndex];

    return Scaffold(
      backgroundColor: Colors.black,
      body: Stack(
        children: [
          PageView.builder(
            controller: _pageController,
            itemCount: story.story.length,
            itemBuilder: (context, index) {
              return Image.asset(
                story.story[index],
                fit: BoxFit.cover,
                height: double.infinity,
                width: double.infinity,
              );
            },
            onPageChanged: (index) {
              setState(() {
                _currentIndex = index;
              });
            },
          ),
          Positioned(
            top: 40,
            left: 20,
            child: GestureDetector(
              onTap: widget.onClose,
              child: const Icon(
                Icons.close,
                color: Colors.white,
                size: 30,
              ),
            ),
          ),
          Positioned(
            top: 40,
            right: 20,
            child: GestureDetector(
              onTap: () {
                // اینجا می‌توانید کاربری را به صفحه پروفایل ببرید
              },
              child: CircleAvatar(
                backgroundImage: AssetImage(story.img),
              ),
            ),
          ),
          Positioned(
            bottom: 20,
            left: 20,
            right: 20,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: List.generate(
                story.story.length,
                (index) => Container(
                  margin: const EdgeInsets.symmetric(horizontal: 4),
                  height: 4,
                  width: _currentIndex == index ? 20 : 8,
                  decoration: BoxDecoration(
                    color: _currentIndex == index ? Colors.white : Colors.grey,
                    borderRadius: BorderRadius.circular(4),
                  ),
                ),
              ),
            ),
          ),
          GestureDetector(
            onTap: _goToPreviousStory,
            child: SizedBox(
              width: MediaQuery.of(context).size.width / 2,
              height: double.infinity,
            ),
          ),
          GestureDetector(
            onTap: _goToNextStory,
            child: Container(
              width: MediaQuery.of(context).size.width / 2,
              height: double.infinity,
              alignment: Alignment.centerRight,
            ),
          ),
        ],
      ),
    );
  }
}
