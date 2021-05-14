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
      theme: AppTheme.blackTheme,
      darkTheme: ThemeData.dark(),

      home: Scaffold(

          appBar: AppBar(

            title: Text(
              '_dream blog',
              style: AppBarTextStyle.dreamDefault,
            ),

            leading: IconButton(
              icon: AppIcons.moreInfo,
              tooltip: 'My account',
              onPressed: () {

              },
            ),
            actions: [
              Container(
                width: 30,
                child: AppImages.logo,
              ),

              IconButton(
                icon: AppIcons.account,
                tooltip: 'My account',
                onPressed: () {
                  // handle the press
                },
              ),
            ],
          ),

          body: HomeBody(),

          drawer: ShowInfo(),
      ),
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
              color: AppColors.darkPurple,
            ),
            child: Container(

              margin: const EdgeInsets.all(4.0),
              height: 200,
              alignment: Alignment.centerLeft,
              child: RichText (
                  text: TextSpan(
                  text: 'Made with 🤍 by AnaCrisOliver\n\nImage copyright: Dreamlabs',
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

      padding: const EdgeInsets.all(8),
      itemCount: posts.length,
      itemBuilder: (BuildContext context, int index) {

        return GestureDetector( // Setting a tap action on the post
          onTap: () =>
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => SecondRoute(index)),
              ),
          child: Container( // Each post settings
            decoration: HomePostBox.light,
            margin: const EdgeInsets.all(4.0),
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
