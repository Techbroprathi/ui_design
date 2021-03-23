import 'package:flutter/material.dart';
import 'package:flutter_instagram_feed_ui_redesign/models/comment_model.dart';
import 'package:flutter_instagram_feed_ui_redesign/models/post_model.dart';
import 'package:flutter_instagram_feed_ui_redesign/screens/view_post_screen.dart';

class FeedScreen extends StatefulWidget {
  @override
  _FeedScreenState createState() => _FeedScreenState();
}

class _FeedScreenState extends State<FeedScreen> {
  Widget _buildPost(int index) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 5.0),
      child: Container(
        width: double.infinity,
        height: 560.0,
        decoration: BoxDecoration(
          color: Colors.white10,
          borderRadius: BorderRadius.circular(25.0),
        ),
        child: Column(
          children: <Widget>[
            Padding(
              padding: EdgeInsets.symmetric(vertical: 10.0),
              child: Column(
                children: <Widget>[
                  ListTile(
                      leading: Container(
                        width: 50.0,
                        height: 50.0,
                        decoration: BoxDecoration(
                          image: DecorationImage(
                              image: AssetImage(comments[index].authorImageUrl),
                              fit: BoxFit.cover),
                          borderRadius: BorderRadius.all(Radius.circular(15.0)),
                        ),
                      ),


                    title: Text(
                      posts[index].authorName,
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.white
                      ),
                    ),
                    subtitle: Text(posts[index].timeAgo,
                    style: TextStyle(
                      color: Colors.white
                    ),),
                    trailing: IconButton(
                      icon: Icon(Icons.more_horiz),
                      color: Colors.white,
                      onPressed: () => print('More'),
                    ),
                  ),
                  InkWell(
                    onDoubleTap: () => print('Like post'),
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (_) => ViewPostScreen(
                            post: posts[index],
                          ),
                        ),
                      );
                    },
                    child: Container(
                      margin: EdgeInsets.all(10.0),
                      width: double.infinity,
                      height: 350.0,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(25.0),

                        image: DecorationImage(
                          image: AssetImage(posts[index].imageUrl),
                          fit: BoxFit.fitWidth,
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 20.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Row(
                          children: <Widget>[
                            Row(
                              children: <Widget>[
                                IconButton(
                                  icon: Icon(Icons.local_fire_department_outlined),
                                  color: Colors.white70,
                                  iconSize: 30.0,
                                  onPressed: () => print('Like post'),
                                ),
                                Text(
                                  '',
                                  style: TextStyle(
                                    fontSize: 14.0,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(width: 20.0),
                            Row(
                              children: <Widget>[
                                IconButton(
                                  icon: Icon(Icons.chat),
                                  color: Colors.white70,
                                  iconSize: 30.0,
                                  onPressed: () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (_) => ViewPostScreen(
                                          post: posts[index],
                                        ),
                                      ),
                                    );
                                  },
                                ),
                                Text(
                                  '',
                                  style: TextStyle(
                                    fontSize: 14.0,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                        IconButton(
                          icon: Icon(Icons.bookmark_border),
                          color: Colors.white70,
                          iconSize: 30.0,
                          onPressed: () => print('Save post'),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget  build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: ListView(
        physics: AlwaysScrollableScrollPhysics(),
        children: <Widget>[
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[IconButton(
                icon: Icon(Icons.person_rounded),
                color: Colors.white30,
                iconSize: 30.0,
                onPressed: () => print('Profile'),
              ),

                Row(
                  children: <Widget>[Text(
                    'WeebNet',
                    style: TextStyle(
                      fontFamily: 'sf',
                      fontSize: 30.0,
                      fontWeight: FontWeight.bold,
                      color: Colors.white
                    ),
                  ),

                    SizedBox(width: 80.0),
                    Container(
                      width: 35.0,
                      child: IconButton(
                        icon: Icon(Icons.send_outlined),
                        iconSize: 30.0,
                        color: Colors.white30,
                        onPressed: () => print('Direct Messages'),
                      ),
                    )
                  ],
                )
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(0,10,0,20),
            child: Container(
              color: Colors.white30,
              width: double.infinity,
              height: 100.0,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: stories.length + 1,
                itemBuilder: (BuildContext context, int index) {
                  if (index == 0) {
                    return SizedBox(width: 10.0);
                  }
                  return Container(
                    margin: EdgeInsets.all(10.0),
                    width: 70.0,
                    height: 60.0,
                            decoration: BoxDecoration(
                              image: DecorationImage(
                           image: AssetImage(stories[index - 1]),
                            fit: BoxFit.cover),
                                borderRadius: BorderRadius.all(Radius.circular(20.0)),
                          ),

                      );



                }
              ),
            ),
          ),
          _buildPost(0),
          _buildPost(1),
        ],
      ),
      bottomNavigationBar: ClipRRect(
        //borderRadius: BorderRadius.only(
          //topLeft: Radius.circular(30.0),
          //topRight: Radius.circular(30.0),
        //),
        child: BottomNavigationBar(
          backgroundColor: Color(0xFFABABAB),
          type: BottomNavigationBarType.fixed,
          items: [
            BottomNavigationBarItem(
              icon: Icon(
                Icons.home_outlined,
                size: 30.0,
                color: Colors.black54,
              ),
              title: Text('Home'),
            ),
            BottomNavigationBarItem(
              icon: Icon(
                Icons.search,
                size: 30.0,
                color: Colors.black54,
              ),
              title: Text('search'),
            ),
            BottomNavigationBarItem(
              icon: Icon(
                    Icons.add_circle_outline_outlined,
                    size: 35.0,
                    color: Colors.black54,
                  ),
              title: Text(''),
            ),
            BottomNavigationBarItem(
              icon: Icon(
                Icons.event_note_rounded,
                size: 30.0,
                color: Colors.black54,
              ),
              title: Text('discussion'),
            ),
            BottomNavigationBarItem(
              icon: Icon(
                Icons.notifications_active_rounded,
                size: 30.0,
                color: Colors.black54,
              ),
              title: Text('Activity'),
            ),
          ],
        ),
      ),
    );
  }
}
