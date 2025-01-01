import 'package:flutter/material.dart';

void main() {
  runApp(const LipzaApp());
}

class LipzaApp extends StatefulWidget {
  const LipzaApp({super.key});

  @override
  State<LipzaApp> createState() => LipzaAppState();
}

class LipzaAppState extends State<LipzaApp> {
  bool _theme = false;

  void _onThemeChanged() {
    setState(() {
      _theme = !_theme;
    });
  }
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Lipza',
      theme: ThemeData(
        colorScheme: (_theme)
            ? ColorScheme.dark(primary: const Color.fromARGB(255, 0, 0, 0))
            : ColorScheme.light(primary: const Color.fromARGB(255, 244, 234, 209)),
        useMaterial3: true,
      ),
      home: WelcomePage(onThemeChanged: _onThemeChanged, theme:_theme),
    );
  }
}

class WelcomePage extends StatelessWidget {
  final VoidCallback onThemeChanged;
  final bool theme;

  const WelcomePage({super.key, required this.onThemeChanged, required this.theme});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 244, 234, 209),
        centerTitle: true,
        toolbarHeight: 200,
        title: const Text(
              'Welcome to\nLipza',
              textAlign: TextAlign.center,
              overflow: TextOverflow.clip,
              style: TextStyle(fontSize: 40, fontWeight: FontWeight.bold, color: Colors.black),
            ),
      ),
      body: Padding(
        padding: EdgeInsets.zero,
        child: Container(
          height: double.infinity,
          width: double.infinity,
          decoration: const BoxDecoration(
            image: DecorationImage(
                image: AssetImage("assets/images/Starting.png"),
                fit: BoxFit.cover),
            ),
          child: Align(
              alignment: Alignment(0, 0.5),
              child: ElevatedButton(
                  onPressed: () => {
                    Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => TheoryPage(onThemeChanged: onThemeChanged, theme: theme)),
                )
                  },
                  style: ButtonStyle(
                    fixedSize: WidgetStateProperty.all(Size(227, 86)),
                    textStyle: WidgetStateProperty.all(TextStyle(fontSize: 24)),
                    backgroundColor: WidgetStateProperty.all(Color.fromARGB(255, 247,84,104)),
                    shape: WidgetStateProperty.all<RoundedRectangleBorder>(
                      RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(18.0),  
                      ),
                    ),
                  ),
                  child: const Text(
                    "Let's start",
                  ),
              ),)
        ),
      ),
    );
  }
}

class TheoryPage extends StatefulWidget {
  final VoidCallback onThemeChanged;
  final bool theme;

  const TheoryPage({super.key, required this.onThemeChanged, required this.theme});

  @override
  State<TheoryPage> createState() => TheoryPageState();
}

class TheoryPageState extends State<TheoryPage> {
  late VoidCallback onThemeChanged;
  late bool theme;
  String _selectedValue = 'Гласные';

  @override
  void initState() {
    super.initState();
    onThemeChanged = widget.onThemeChanged; 
    theme = widget.theme; // Access the widget property
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Theory'),
        backgroundColor: Theme.of(context).colorScheme.primary,
        actions: [
          Padding(
            padding: const EdgeInsets.fromLTRB(0, 0, 16.0, 0),
            child: Text(
              "Lipza",
              style: TextStyle(fontSize: 24),
              )
            ),
            IconButton(
              icon: Icon((Theme.of(context).colorScheme.primary == Colors.black)? Icons.dark_mode: Icons.light_mode),
              onPressed: onThemeChanged,
              tooltip: 'Toggle Theme',
            ),
        ]
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            DropdownButton<String>(
              isExpanded: true,
              value: _selectedValue,
              items: const [
                DropdownMenuItem(value: 'Гласные', child: Text('Гласные')),
                DropdownMenuItem(value: 'Согласные', child: Text('Согласные')),
              ],
              onChanged: (value) {
                setState(() {
                  _selectedValue = value!;
                });
              },
            ),
            const SizedBox(height: 20),
            // Expanded widget with dynamic content
            Expanded(
              child: (_selectedValue == 'Гласные')
                  ? ListView(
                      children: const [
                        ListTile(
                          title: Row(
                              children: [
                                Image(
                                  image: AssetImage('assets/images/A.png'), // Replace with your image path
                                  width: 30, // Set the size of the image
                                  height: 30, 
                                ),
                                SizedBox(width: 12), // Space between image and text
                                Text('А'),
                              ],
                            ),
                          ),
                        ListTile(
                          title: Row(
                              children: [
                                Image(
                                  image: AssetImage('assets/images/E.png'), // Replace with your image path
                                  width: 30, // Set the size of the image
                                  height: 30, 
                                ),
                                SizedBox(width: 12),
                                Text('E'),
                              ],
                            ),
                          ),
                        ListTile(
                          title: Row(
                              children: [
                                Image(
                                  image: AssetImage('assets/images/D.png'), // Replace with your image path
                                  width: 30, // Set the size of the image
                                  height: 30, 
                                ),
                                SizedBox(width: 12), // Space between image and text
                                Text('И'),
                              ],
                            ),
                          ),
                        ListTile(
                          title: Row(
                              children: [
                                Image(
                                  image: AssetImage('assets/images/D.png'), // Replace with your image path
                                  width: 30, // Set the size of the image
                                  height: 30, 
                                ),
                                SizedBox(width: 12), // Space between image and text
                                Text('О'),
                              ],
                            ),
                          ),
                        ListTile(
                          title: Row(
                              children: [
                                Image(
                                  image: AssetImage('assets/images/D.png'), // Replace with your image path
                                  width: 30, // Set the size of the image
                                  height: 30, 
                                ),
                                SizedBox(width: 12), // Space between image and text
                                Text('У'),
                              ],
                            ),
                          ),
                      ],
                    )
                  : ListView(
                      children: const [
                        ListTile(
                          title: Row(
                              children: [
                                Image(
                                  image: AssetImage('assets/images/A.png'), // Replace with your image path
                                  width: 30, // Set the size of the image
                                  height: 30, 
                                ),
                                SizedBox(width: 12), // Space between image and text
                                Text('Б'),
                              ],
                            ),
                          ),
                        ListTile(
                          title: Row(
                              children: [
                                Image(
                                  image: AssetImage('assets/images/D.png'), // Replace with your image path
                                  width: 30, // Set the size of the image
                                  height: 30, 
                                ),
                                SizedBox(width: 12), // Space between image and text
                                Text('П'),
                              ],
                            ),
                          ),
                        ListTile(
                          title: Row(
                              children: [
                                Image(
                                  image: AssetImage('assets/images/E.png'), // Replace with your image path
                                  width: 30, // Set the size of the image
                                  height: 30, 
                                ),
                                SizedBox(width: 12), // Space between image and text
                                Text('T'),
                              ],
                            ),
                          ),
                        ListTile(
                          title: Row(
                              children: [
                                Image(
                                  image: AssetImage('assets/images/D.png'), // Replace with your image path
                                  width: 30, // Set the size of the image
                                  height: 30, 
                                ),
                                SizedBox(width: 12), // Space between image and text
                                Text('Д'),
                              ],
                            ),
                          ),
                        ListTile(
                          title: Row(
                              children: [
                                Image(
                                  image: AssetImage('assets/images/D.png'), // Replace with your image path
                                  width: 30, // Set the size of the image
                                  height: 30, 
                                ),
                                SizedBox(width: 12), // Space between image and text
                                Text('К'),
                              ],
                            ),
                          ),
                      ],
                    ),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => PracticePage(onThemeChanged: onThemeChanged, theme: theme)),
                );
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Theme.of(context).colorScheme.primary,
                padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
              ),
              child: Text('Go to Practice', style: TextStyle(fontSize: 18, color: (Theme.of(context).colorScheme.primary == Colors.black)? Colors.white: Colors.black)),
            ),
          ],
        ),
      ),
    );
  }
}

class PracticePage extends StatefulWidget {
  final VoidCallback onThemeChanged;
  final bool theme;

  const PracticePage({super.key, required this.onThemeChanged, required this.theme});

  @override
  State<PracticePage> createState() => PracticePageState();
}

class PracticePageState extends State<PracticePage> {
  late VoidCallback onThemeChanged;
  late bool theme;

  final List<String> tasks = [
    "Сегодня хорошая    _____",
    "Пойдем    __     ______",
    "_______________",
    "______     _______     _______",
    "Пока! Еще    _________",
  ];

  int currentTaskIndex = 0; // Keeps track of the current task

  // Function to go to the next task
  void nextTask() {
    setState(() {
      if (currentTaskIndex < tasks.length - 1) {
        currentTaskIndex++;
      }
    });
  }

  // Function to go to the previous task
  void previousTask() {
    setState(() {
      if (currentTaskIndex > 0) {
        currentTaskIndex--;
      }
    });
  }

  @override
  void initState() {
    super.initState();
    onThemeChanged = widget.onThemeChanged; 
    theme = widget.theme; // Access the widget property
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Practice'),
        backgroundColor: Theme.of(context).colorScheme.primary,
        actions: [
          Padding(
            padding: const EdgeInsets.fromLTRB(0, 0, 16.0, 0),
            child: Text(
              "Lipza",
              style: TextStyle(fontSize: 24),
              )
            ),
            IconButton(
              icon: Icon((Theme.of(context).colorScheme.primary == Colors.black)? Icons.dark_mode: Icons.light_mode),
              onPressed: onThemeChanged,
              tooltip: 'Toggle Theme',
            ),
        ]
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Container(
              height: 200,
              width: double.infinity,
              color: Colors.grey.shade300,
              child: const Center(
                child: Icon(Icons.play_circle_outline, size: 64),
              ),
            ),
            const SizedBox(height: 20),
            const Text(
              'Fill the gaps',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 20),
            Card(
              elevation: 4,
              child: Padding(
                padding: EdgeInsets.all(16.0),
                child: Text(
                  tasks[currentTaskIndex],
                  style: TextStyle(fontSize: 18),
                ),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // Previous task arrow
                IconButton(
                  icon: Icon(Icons.arrow_back_outlined),
                  onPressed: previousTask,
                  iconSize: 40,
                  color: (Theme.of(context).colorScheme.primary == Colors.black)? Color.fromARGB(255, 63, 69, 111):Color.fromARGB(255, 24,29,61),
                ),
                SizedBox(width: 230),
                // Next task arrow
                IconButton(
                  icon: Icon(Icons.arrow_forward_outlined),
                  onPressed: nextTask,
                  iconSize: 40,
                  color: (Theme.of(context).colorScheme.primary == Colors.black)? Color.fromARGB(255, 63, 69, 111):Color.fromARGB(255, 24,29,61),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
