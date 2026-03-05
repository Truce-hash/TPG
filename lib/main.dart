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
      debugShowCheckedModeBanner: false,
      title: 'Student Info App',
      theme: ThemeData(
        primarySwatch: Colors.green,
        appBarTheme: const AppBarTheme(
          backgroundColor: Colors.green,
          foregroundColor: Colors.white,
          centerTitle: true,
          elevation: 4,
        ),

        //Button Theme
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.orange,
            foregroundColor: Colors.white,
            padding: const EdgeInsets.all(15),
            minimumSize: const Size(100, 40),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
          ),
        ),

        //Text Theme
        textTheme: const TextTheme(
          bodyLarge: TextStyle(fontSize: 16),
          bodyMedium: TextStyle(fontSize: 14, color: Colors.grey),
        ),
      ),

      //App Bar Theme
      home: const MyHomePage(),
    );
  }
}

/*class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        title: Text('My Student'),
        backgroundColor: Colors.blue,
        centerTitle: true,

        actions: [
          IconButton(icon: const Icon(Icons.settings),
          onPressed: (){
            print("Settings Pressed");
          },)
          
        ]
      ),

      body: const Center(
        child: Text('Welcome to my fisrt app!'),
      ),

      floatingActionButton: FloatingActionButton(onPressed:(){
        print('FEB pressed');
      },
      child: const Icon(Icons.add),),

      bottomNavigationBar: BottomNavigationBar(
        items: const[
       BottomNavigationBarItem(icon: Icon(Icons.home),
       label: 'Profile',
       )
      ]),
    );
  }
}*/

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  String studentName = "Truce";
  String favouriteSubject = "TPG316C";
  int subjectIndex = 0;
  List<String> subjects = ["TPG316C", "SOD316C", "CMN316c", "ITS316C"];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('My Student Card'),
        centerTitle: true,
        actions: [
          IconButton(
            icon: Icon(Icons.settings),
            onPressed: () {
              print('Settings pressed');
            },
          ),
        ],
      ),

      body: Center(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                StudentInfoCard(
                  studentName: studentName,
                  favouriteSubject: favouriteSubject,
                ),
                const SizedBox(height: 30),

                Text(
                  'Student Name: $studentName',
                  style: const TextStyle(fontSize: 24),
                ),
                const SizedBox(height: 20),
                Text(
                  'Favourite Subject: $favouriteSubject',
                  style: const TextStyle(fontSize: 20, color: Colors.green),
                ),

                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () {
                      setState(() {
                        subjectIndex = (subjectIndex + 1) % subjects.length;
                        favouriteSubject = subjects[subjectIndex];
                      });
                    },
                    child: const Text('Change Favourite Subject'),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),

      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Profile'),
        ],
      ),
    );
  }
}

class StudentInfoCard extends StatelessWidget {
  const StudentInfoCard({
    super.key,
    required this.studentName,
    required this.favouriteSubject,
  });

  final String studentName;
  final String favouriteSubject;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: theme.primaryColor,
        borderRadius: BorderRadius.circular(15),
        border: Border.all(color: Colors.blue, width: 2),
      ),

      child: Column(
        children: [
          Text(
            "Student Name: $studentName",
            style: const TextStyle(fontSize: 24),
          ),
          const SizedBox(height: 10),

          Text(
            "Favourite Subject: $favouriteSubject",
            style: const TextStyle(fontSize: 20, color: Colors.grey),
          ),
        ],
      ),
    );
  }
}
