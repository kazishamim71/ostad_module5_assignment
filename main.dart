import 'package:flutter/material.dart';
//Kazi Shamim (01949376654) - Module5 Assignment
void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Module Five Assignment',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: TabViewScreen(),
    );
  }
}

class TabViewScreen extends StatefulWidget {
  @override
  _TabViewScreenState createState() => _TabViewScreenState();
}

class _TabViewScreenState extends State<TabViewScreen> with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Module Five Assignment'),
      ),
      drawer: Drawer(
        
        child: ListView(
          children: [
            DrawerHeader(child:
            CircleAvatar(child: Image.network("https://w7.pngwing.com/pngs/716/128/png-transparent-kaaba-mecca-art-kaaba-medina-umrah-hajj-umra-mosque-islam-package-thumbnail.png"),
            radius: 100,),
            ),
            ListTile(
              title: Text('Page1'),
              leading: Icon(Icons.home),
              onTap: () {
                _tabController.animateTo(0);
                Navigator.pop(context);
              },
            ),
            ListTile(
              title: Text('Page2'),
              leading: Icon(Icons.settings),
              onTap: () {
                _tabController.animateTo(1);
                Navigator.pop(context);
              },
            ),
            ListTile(
              title: Text('Page3'),
              leading: Icon(Icons.person),
              onTap: () {
                _tabController.animateTo(2);
                Navigator.pop(context);
              },
            ),
          ],
        ),
      ),
      body: TabBarView(
        controller: _tabController,
        children: [
          PageWidget(pageNumber: 1, color: Colors.red),
          PageWidget(pageNumber: 2, color: Colors.green),
          PageWidget(pageNumber: 3, color: Colors.blue),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _tabController.index,
        onTap: (index) {
          _tabController.animateTo(index);
        },
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Page1',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.business),
            label: 'Page2',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.school),
            label: 'Page3',
          ),
        ],
      ),
    );
  }
}

class PageWidget extends StatelessWidget {
  final int pageNumber;
  final Color color;

  const PageWidget({required this.pageNumber, required this.color});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        backgroundColor: color,
        child: Icon(Icons.add),
      ),
      body: Center(
        child: Text(
          'Page $pageNumber',
          style: TextStyle(fontSize: 24),
        )



      ),
    );
  }
}