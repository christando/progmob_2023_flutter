// import 'dart:html';
import 'package:flutter/material.dart';
import 'package:progmob_2023/constants.dart';
import 'package:progmob_2023/details_screen.dart';
import 'package:progmob_2023/model/category.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:progmob_2023/profile_screen.dart';
// import 'package:sidebarx/sidebarx.dart';
import 'package:progmob_2023/fetchdata.dart';
import 'package:progmob_2023/fetch2.dart';
import 'package:progmob_2023/updatefetch.dart';
import 'package:progmob_2023/deletefetch.dart';
import 'package:progmob_2023/maps.dart';
import 'package:progmob_2023/map.dart';




void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Course App',
      theme: ThemeData(),
      home: MyHomePage(),

      routes: {
        '/fetchdata':(context)=>FetchData(),
        '/fetch2':(context)=>Fetch2(),
        '/fetch_update':(context)=>UpdateFetch(),
        '/fetch_delete':(context)=>DeleteFetch(),
        '/maps':(context)=>Maps(),
        '/map': (context) => MapScreen(),
        '/profile': (context) => ProfileScreen(),
      },
    );
  }
}

class MyHomePage extends StatelessWidget {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  MyHomePage({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      // appBar: AppBar(
      // ),
      drawer: Drawer(
        child: ListView(
          children: <Widget>[
           const UserAccountsDrawerHeader(
            accountName: Text('valentino'),
            accountEmail: Text('vchristando@gmail.com'),
            currentAccountPicture: CircleAvatar(
              backgroundColor: Colors.white,
              child: Text("VA",
              style: TextStyle(fontSize: 40.0),),
            ),
            ),
          //   const DrawerHeader(
          //     decoration: BoxDecoration(
          //       color: Colors.blue,
          //     ),
          //     child: Text('Menu'),
          //   ),
            
            ListTile(
              title: const Text('Home'),
              trailing: Icon(Icons.home),
              subtitle: const Text('Kembali Ke Halaman Utama'),
              onTap: () {
                Navigator.pop(context);
                Navigator.push(context, MaterialPageRoute(builder: (context)=>MyHomePage())); // Close the drawer
                // Implement the navigation logic for Home here
              },
            ),
            ListTile(
              title: const Text('Profile'),
              subtitle: const Text('Ubah Profil anda sekarang :)'),
              trailing: Icon(Icons.person),
              // leading: Icon(Icons.home), menambahkan icon di bagian kiri
              // trailing: Icon(Icons.home), menambahkan icon di kanan
              onTap: () {
                Navigator.pop(context); // Close the drawer
                Navigator.push(context, MaterialPageRoute(builder: (context)=>ProfileScreen()));
              },
              
            ),
            
            ListTile(
              title: const Text('Bisnis'),
              subtitle: const Text('Pilih Rekan Bisnis anda'),
              trailing: Icon(Icons.business),
              // leading: Icon(Icons.home), menambahkan icon di bagian kiri
              // trailing: Icon(Icons.home), menambahkan icon di kanan
              onTap: () {
                Navigator.pop(context); // Close the drawer
                //Navigator.pushNamed(context, MaterialPageRoute(builder: (context)=>fetchAlbum()));
              },
            ),
            ListTile(
              title: const Text('Read'),
              subtitle: const Text('Read Fetching data'),
              //trailing: Icon(Icons.business),
              // leading: Icon(Icons.home), menambahkan icon di bagian kiri
              // trailing: Icon(Icons.home), menambahkan icon di kanan
              onTap: () {
                Navigator.pop(context); // Close the drawer
                Navigator.pushNamed(context, "/fetchdata");
              },
            ),
            ListTile(
              title: const Text('Create'),
              subtitle: const Text('Create Fetching data'),
              //trailing: Icon(Icons.business),
              // leading: Icon(Icons.home), menambahkan icon di bagian kiri
              // trailing: Icon(Icons.home), menambahkan icon di kanan
              onTap: () {
                Navigator.pop(context); // Close the drawer
                Navigator.pushNamed(context, "/fetch2");
              },
            ),
            ListTile(
              title: const Text('Update'),
              subtitle: const Text('Update Fetching data'),
              //trailing: Icon(Icons.business),
              // leading: Icon(Icons.home), menambahkan icon di bagian kiri
              // trailing: Icon(Icons.home), menambahkan icon di kanan
              onTap: () {
                Navigator.pop(context); // Close the drawer
                Navigator.pushNamed(context, "/fetch_update");
              },
            ),
ListTile(
              title: const Text('Delete'),
              subtitle: const Text('Delete Fetching data'),
              //trailing: Icon(Icons.business),
              // leading: Icon(Icons.home), menambahkan icon di bagian kiri
              // trailing: Icon(Icons.home), menambahkan icon di kanan
              onTap: () {
                Navigator.pop(context); // Close the drawer
                Navigator.pushNamed(context, "/fetch_delete");
              },
            ),
ListTile(
              title: const Text('Maps'),
              subtitle: const Text('open Maps'),
              //trailing: Icon(Icons.business),
              // leading: Icon(Icons.home), menambahkan icon di bagian kiri
              // trailing: Icon(Icons.home), menambahkan icon di kanan
              onTap: () {
                Navigator.pop(context); // Close the drawer
                Navigator.pushNamed(context, "/maps");
              },
            ),
            ListTile(
              title: const Text('Map'),
              leading: const Icon(Icons.map_rounded),
              onTap: () {
                Navigator.pop(context); // Close the drawer
                Navigator.pushNamed(context, "/map");
              },
            ),
            Divider(
              color: Colors.black,
              height: 20,
              indent: 10,
              endIndent: 10,
            ),
            ListTile(
              title: const Text('Log Out'),
              leading: const Icon(Icons.logout),
              onTap: () {
                Navigator.pop(context); // Close the drawer
                Navigator.pushNamed(context, "/profilescreen");
              },
            ),
            // Add more list items for other sections as needed
          ],
          
        ),
      ),
      
      body: Padding(
        padding: const EdgeInsets.only(left: 20, top: 50, right: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                InkWell(
                  onTap: () {
                    // Scaffold.of(context).openDrawer();
                    if (_scaffoldKey.currentState != null){
                      _scaffoldKey.currentState!.openDrawer();
                      }
                  },
                  child: SvgPicture.asset("assets/icons/list.svg"),
                ),
                InkWell(
                  onTap: () {
                    Navigator.pop(context);
                      Navigator.push(context, MaterialPageRoute(builder: (context) => DetailsScreen()));
                    }
                  ,
                  child: Image.asset("assets/images/user.png"),
                ),
              ],
            ),
            SizedBox(height: 30),
            Text("Hey Alex,", style: kHeadingextStyle),
            Text("Find a course you want to learn", style: kSubheadingextStyle),
            Container(
              margin: EdgeInsets.symmetric(vertical: 30),
              padding: EdgeInsets.symmetric(horizontal: 20, vertical: 16),
              height: 60,
              width: double.infinity,
              decoration: BoxDecoration(
                color: Color(0xFFF5F5F7),
                borderRadius: BorderRadius.circular(40),
              ),
              child: Row(
                children: <Widget>[
                  SvgPicture.asset("assets/icons/search.svg"),
                  SizedBox(width: 16),
                  Text(
                    "Search for anything",
                    style: TextStyle(
                      fontSize: 18,
                      color: Color(0xFFA0A5BD),
                    ),
                  )
                ],
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text("Category", style: kTitleTextStyle),
                Text(
                  "See All",
                  style: kSubtitleTextSyule.copyWith(color: kBlueColor),
                ),
              ],
            ),
            SizedBox(height: 30),
            Expanded(
              child: StaggeredGridView.countBuilder(
                padding: EdgeInsets.all(0),
                crossAxisCount: 2,
                itemCount: categories.length,
                crossAxisSpacing: 20,
                mainAxisSpacing: 20,
                itemBuilder: (context, index) {
                  return GestureDetector(
                    onTap: () {
                      if (_scaffoldKey.currentState != null){
                      _scaffoldKey.currentState!.openDrawer();
                      }
                    },
                    child: Container(
                      padding: EdgeInsets.all(20),
                      height: index.isEven ? 200 : 240,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(16),
                        image: DecorationImage(
                          image: AssetImage(categories[index].image),
                          fit: BoxFit.fill,
                        ),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text(
                            categories[index].name,
                            style: kTitleTextStyle,
                          ),
                          Text(
                            '${categories[index].numOfCourses} Courses',
                            style: TextStyle(
                              color: kTextColor.withOpacity(.5),
                            ),
                          )
                        ],
                      ),
                    ),
                  );
                },
                staggeredTileBuilder: (index) => StaggeredTile.fit(1),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
