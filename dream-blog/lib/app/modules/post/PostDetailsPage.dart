import 'package:dreamersblog/app/AppStyle.dart';
import 'package:flutter/material.dart';
import '../home/Post.dart';
import '../../Services.dart';
import '../home/HomePageStyle.dart';
import 'PostDetailsPageStyle.dart';

class SecondRoute extends StatefulWidget {

  final int index;

  SecondRoute(this.index);

  @override
  _SecondRouteState createState() => _SecondRouteState();
}

class _SecondRouteState extends State<SecondRoute> {


  @override
  Widget build(BuildContext context) {
    return Scaffold(

        backgroundColor: AppColors.lilac,
        appBar: AppBar(
          title: Text(
              '_post',
              style: AppBarTextStyle.dreamDefault
          ),
          actions: [
            Container(width: 30),
          ],
          backgroundColor: AppColors.semiDarkPurple,
        ),
        body: Container(

            margin: const EdgeInsets.all(15),
            child: FutureBuilder<Post>(

              future: fetchPost(this.widget.index+1),
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: RichText(
                      text: TextSpan(
                        text: snapshot.data.title.toUpperCase(),
                        style: PostPageTitle.h1Style,
                        children: <TextSpan>[
                          TextSpan(
                              text: formatContent (snapshot.data.body),
                              style: PostPageContent.pStyle
                          ),
                        ],
                      ),
                    ),
                  );
                } else if (snapshot.hasError) {
                  return Text("${snapshot.error}");
                }
                return Center (
                  child: CircularProgressIndicator(),
                );
              },
            )
        )
    );
  }
}
