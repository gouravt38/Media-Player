import 'package:audioplayers/audio_cache.dart';
import 'package:flutter/material.dart';
import 'package:audioplayers/audioplayers.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

var play = false;
var stop = true;
final AudioCache audioPlay = AudioCache();
AudioPlayer assetPlayer = AudioPlayer();

lplay() async {
  assetPlayer = await audioPlay.play('audios/Paradise_Coldplay.mp3');
}

lpause() async {
  assetPlayer.pause();
}

lstop() async {
  assetPlayer.stop();
}

var audioPlayer = AudioPlayer();
int result;

iplay() async {
  result = await audioPlayer
      .play('https://www.soundhelix.com/examples/mp3/SoundHelix-Song-1.mp3');
  if (result == 1) {
    // success
  }
}

ipause() async {
  result = await audioPlayer.pause();
}

istop() async {
  result = await audioPlayer.stop();
}

YoutubePlayerController _controller = YoutubePlayerController(
  initialVideoId: 'VPRjCeoBqrI',
  flags: YoutubePlayerFlags(
    autoPlay: false,
    //mute: true,
  ),
);

myBody() {
  return Container(
    height: double.infinity,
    width: double.infinity,
    color: Colors.grey.shade300,
    margin: EdgeInsets.all(2),
    // decoration: BoxDecoration(
    //   image: DecorationImage(
    //     image: NetworkImage(
    //         "https://images.unsplash.com/photo-1510133744874-096621a0e01e?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&w=1000&q=80"),
    //     fit: BoxFit.cover,
    //   ),
    // ),
    child: Column(
      children: <Widget>[
        Container(
          margin: EdgeInsets.only(top: 10),
          width: 300,
          height: 50,
          // decoration: BoxDecoration(
          //   borderRadius: BorderRadius.circular(10),
          //   color: Colors.blue.shade100,
          // ),
          //color: Colors.brown.shade200,
          child: Text(
            "Play Audio from App",
            textAlign: TextAlign.center,
            style: TextStyle(
              color: Colors.black54,
              fontSize: 30,
              //fontStyle: FontStyle.italic,
              fontWeight: FontWeight.w500,
              fontFamily: 'DancingScript',
            ),
          ),
        ),
        Image(
          image: NetworkImage(
            "https://encrypted-tbn0.gstatic.com/images?q=tbn%3AANd9GcTqLJ_X9CQZsICjcbiLHWuW4JQVelWoQ-wQbg&usqp=CAU",
          ),
          fit: BoxFit.cover,
        ),
        Container(
          width: 300,
          height: 50,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              RaisedButton(
                onPressed: lplay,
                child: Icon(Icons.play_arrow),
              ),
              RaisedButton(
                onPressed: lpause,
                child: Icon(Icons.pause),
              ),
              RaisedButton(
                onPressed: lstop,
                child: Icon(Icons.stop),
              ),
            ],
          ),
        ),
        Container(
          width: 300,
          height: 50,
          margin: EdgeInsets.only(top: 50),
          // decoration: BoxDecoration(
          //   borderRadius: BorderRadius.circular(10),
          //   color: Colors.blue.shade100,
          // ),
          child: Text(
            "Play Audio from Net",
            textAlign: TextAlign.center,
            style: TextStyle(
              color: Colors.black54,
              fontSize: 30,
              //fontStyle: FontStyle.italic,
              fontWeight: FontWeight.w500,
              fontFamily: 'DancingScript',
            ),
          ),
        ),
        Container(
          width: 300,
          height: 50,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              RaisedButton(
                onPressed: iplay,
                child: Icon(Icons.play_arrow),
              ),
              RaisedButton(
                onPressed: ipause,
                child: Icon(Icons.pause),
              ),
              RaisedButton(
                onPressed: istop,
                child: Icon(Icons.stop),
              ),
            ],
          ),
        ),
        Container(
          margin: EdgeInsets.only(top: 50),
          width: 300,
          height: 300,
          child: Column(
            children: <Widget>[
              YoutubePlayer(
                controller: _controller,
                showVideoProgressIndicator: true,
              ),
            ],
          ),
        ),
      ],
    ),
  );
}

myHome() {
  return MaterialApp(
    home: Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.brown,
        title: Center(
          child: Text("MEDIA PLAYER"),
        ),
      ),
      body: myBody(),
    ),
    debugShowCheckedModeBanner: false,
  );
}
