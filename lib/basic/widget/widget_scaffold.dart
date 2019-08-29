import 'package:flutter/material.dart';
import 'package:flutter_widget_summary/basic/widget/widget_material_button.dart';

/// Material Design布局结构的基本实现。此类提供了用于显示drawer、snackbar和底部sheet的API。

class WidgetScaffold extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'widget scaffold',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'widget scaffold'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

/*
    AppBar({
  Key key,
  this.leading, //导航栏最左侧Widget，常见为抽屉菜单按钮或返回按钮。
  this.automaticallyImplyLeading = true, //如果leading为null，是否自动实现默认的leading按钮
  this.title,// 页面标题
  this.actions, // 导航栏右侧菜单
  this.bottom, // 导航栏底部菜单，通常为Tab按钮组
  this.elevation = 4.0, // 导航栏阴影
  this.centerTitle, //标题是否居中
  this.backgroundColor,
  ...   //其它属性见源码注释
})
 */

class _MyHomePageState extends State<MyHomePage>
    with SingleTickerProviderStateMixin {
  int _currentIndex = 0;

  TabController _tabController;
  List tabs = ['新闻', '历史', '图片', '视频'];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _tabController = TabController(length: tabs.length, vsync: this);
    /*
        通过TabBar我们只能生成一个静态的菜单，真正的Tab页还没有实现。由于Tab菜单和Tab页的切换需要同步，我们需要通过TabController去监听Tab菜单的切换去切换Tab页
     */
    _tabController.addListener(() {
      /* switch (_tabController.index) {
        case 1:
          _tabController.index = 1;
          break;
        case 1:
          _tabController.index = 2;
          break;
        case 1:
          _tabController.index = 3;
          break;
      }*/
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // 导航栏
        title: Text(widget.title),
        actions: <Widget>[
          IconButton(
            icon: Icon(
              Icons.share,
              color: Colors.white,
            ),
            onPressed: () {},
          )
        ],
        bottom: TabBar(
          // 导航栏底部tab按钮
          tabs: tabs.map((e) => Tab(text: e)).toList(),
          controller: _tabController,
        ),
      ),
      drawer: new MyDrawer(),
      // 抽屉
      bottomNavigationBar: BottomNavigationBar(
        // 底部导航
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
              icon: Icon(Icons.home),
              activeIcon: Icon(Icons.home, color: Colors.blue),
              title: Text('Home')),
          BottomNavigationBarItem(
              icon: Icon(Icons.business),
              activeIcon: Icon(Icons.business, color: Colors.blue),
              title: Text('Business')),
          BottomNavigationBarItem(
              icon: Icon(Icons.school),
              activeIcon: Icon(Icons.school, color: Colors.blue),
              title: Text('School'))
        ],
        currentIndex: _currentIndex,
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(context, MaterialPageRoute(builder: (context) => WidgetButton()));

        },
        child: Icon(Icons.add),
      ),
      body: TabBarView(
          /*
          如果我们Tab页可以滑动切换的话，还需要在滑动过程中更新TabBar指示器的偏移！
          显然，要手动处理这些是很麻烦的，为此，Material库提供了一个TabBarView组件，通过它不仅可以轻松的实现Tab页，而且可以非常容易的配合TabBar来实现同步切换和滑动状态同步
         */
          controller: _tabController,
          children: tabs.map((e) {
            return Container(
              alignment: Alignment.center,
              child: Text(
                e,
                textScaleFactor: 5,
              ),
            );
          }).toList()),
    );
  }
}

class MyDrawer extends Drawer {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: MediaQuery.removePadding(
          context: context,
          //移除抽屉菜单顶部默认留白
          removeTop: true,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Padding(
                padding: EdgeInsets.only(top: 35.0),
                child: Row(
                  children: <Widget>[
                    Padding(
                      // 代表left和right的值都为horizontal 16.0
                      padding: EdgeInsets.symmetric(horizontal: 16.0),
                      child: ClipOval(
                        child: Image.network(
                          'http://www.devio.org/img/avatar.png',
                          width: 80,
                        ),
                      ),
                    ),
                    Text(
                      'Drawer',
                      style: TextStyle(color: Colors.black),
                    )
                  ],
                ),
              ),
              Expanded(
                  child: ListView(
                //
                children: <Widget>[
                  ListTile(
                    leading: Icon(Icons.add),
                    title: Text('Add account'),
                  ),
                  ListTile(
                    leading: Icon(Icons.settings),
                    title: Text('Manage accounts'),
                  )
                ],
              ))
            ],
          )),
    );
  }
}
