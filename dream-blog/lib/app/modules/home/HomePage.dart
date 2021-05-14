import 'package:flutter/material.dart';
import '../../Services.dart';
import '../post/PostDetailsPage.dart';
import 'HomePageStyle.dart';
import '../../AppStyle.dart';
import 'Post.dart';

class HomePage extends StatefulWidget  {

  HomePage();
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(

      title: 'Dream blog',
      debugShowCheckedModeBanner: false,
      theme: AppTheme.purpleTheme,
      darkTheme: ThemeData.dark(),

      home: HomeScaffold(),
    );
  }
}

class HomeScaffold extends StatefulWidget {
  HomeScaffold();
  @override
  _HomeScaffoldState createState() => _HomeScaffoldState();
}

class _HomeScaffoldState extends State<HomeScaffold> {


  Widget build(BuildContext context) {
    return new Scaffold(

      backgroundColor: Colors.white,
      appBar: new PreferredSize(

        child: new Container(
          padding: new EdgeInsets.only(
              top: MediaQuery.of(context).padding.top
          ),

          child: new Padding(
            padding: const EdgeInsets.only(
                left: 30.0,
                top: 20.0,
                bottom: 20.0
            ),
            child: new Container(

              child: new Text(
                '_dream blog',
                style: AppBarTextStyle.dreamDefault,
            ),
            )
          ),
          decoration: new BoxDecoration(
              gradient: new LinearGradient(
                  begin: Alignment.topRight,
                  end: Alignment.bottomLeft,
                  colors: [
                    AppColors.darkPurple,
                    Colors.purple.shade400
                  ]
              ),
              boxShadow: [
                new BoxShadow(
                  color: Colors.grey[500],
                  blurRadius: 20.0,
                  spreadRadius: 1.0,
                )
              ]
          ),
        ),
        preferredSize: new Size(
            MediaQuery.of(context).size.width,
            150.0
        ),
      ),
      body: HomeBody(),
      drawer: ShowInfo(),
    );
  }
  
}

class ShowInfo extends StatefulWidget {
  ShowInfo();
  @override
  _ShowInfoState createState() => _ShowInfoState();
}

class _ShowInfoState extends State<ShowInfo> {


  Widget build(BuildContext context) {

    return Drawer(


      child: ListView(

        padding: EdgeInsets.zero,
        children: <Widget>[
          DrawerHeader(
            decoration: BoxDecoration(
              color: AppColors.semiDarkPurple,
            ),
            child: Container(
              margin: const EdgeInsets.all(4.0),
              height: 200,

              alignment: Alignment.centerLeft,
              child: RichText (
                  text: TextSpan(
                  text: 'Made with 🤍 by AnaCrisOliver',
                  style: HomeContentStyle.p2Style,
              ),
            ),
           ),
          ),
        ],
      ),
    );
  }
}

class HomeBody extends StatefulWidget {

  HomeBody();
  @override
  _HomeBodyState createState() => _HomeBodyState();

}

class _HomeBodyState extends State<HomeBody> {


  List<Future> posts = fetchAllPosts();


  Widget build(BuildContext context) {

    // Creating the list of posts
    return ListView.separated(

      padding: const EdgeInsets.all(20),
      itemCount: posts.length,
      itemBuilder: (BuildContext context, int index) {

        return GestureDetector( // Setting a tap action on the post
          onTap: () =>
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => SecondRoute(index)),
              ),
          child: Container( // Each post settings
            decoration: HomePostBox.dark,
            margin: const EdgeInsets.all(0),
            height: 200,
            alignment: Alignment.centerLeft,

            child:  FutureBuilder<Post>(

              future: posts[index],
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  return PostPadding(snapshot.data.title, snapshot.data.body);
                } else if (snapshot.hasError) {
                  return Text("${snapshot.error}");
                }
                return Center(
                  child: CircularProgressIndicator(),
                );
              },
            ),
            ),
          );

      }, separatorBuilder: (BuildContext context, int index) => const Divider(),
    );
  }
}

class PostPadding extends StatefulWidget {

  final String title;
  final String body;

  PostPadding(this.title, this.body);
  @override
  _PostPaddingState createState() => _PostPaddingState();

}

class _PostPaddingState extends State<PostPadding> {


  Widget build(BuildContext context) {

    //formating post text
    return Padding(

      padding: const EdgeInsets.all(8.0),
      child: RichText(
        text: TextSpan(
          text: this.widget.title.toUpperCase(),
          style: HomeTitleStyle.h1Style,
          children: <TextSpan>[
            TextSpan(
                text: cutBodyText(this.widget.body),
                style: HomeContentStyle.pStyle),
          ],
        ),
      ),
    );
  }

}
