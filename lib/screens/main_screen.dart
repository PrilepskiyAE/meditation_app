import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:meditation_app/models/item_model.dart';
import 'package:just_audio/just_audio.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  final List<Item> items = [
    Item(
        name: "Бедняжка",
        imagesPath: "meditation_images/img1.jpg",
        audioPath: "meditation_audios/movie1.mp3"),

    Item(
        name: "Ведьма и Осел",
        imagesPath: "meditation_images/forest.jpeg",
        audioPath: "meditation_audios/movie2.mp3"),

    Item(
        name: "Забытые ботинки",
        imagesPath: "meditation_images/img1.jpg",
        audioPath: "meditation_audios/movie3.mp3"),

    Item(
        name: "Прыгнуть со сколы",
        imagesPath: "meditation_images/img1.jpg",
        audioPath: "meditation_audios/movie4.mp3"),

    Item(
        name: "Валет и дама",
        imagesPath: "meditation_images/forest.jpeg",
        audioPath: "meditation_audios/movie5.mp3"),

    Item(
        name: "Внезапная голова",
        imagesPath: "meditation_images/img1.jpg",
        audioPath: "meditation_audios/movie6.mp3"),

    Item(
        name: "Воспоминания о былой любьви",
        imagesPath: "meditation_images/img1.jpg",
        audioPath: "meditation_audios/movie7.mp3"),

    Item(
        name: "Два монаха",
        imagesPath: "meditation_images/img1.jpg",
        audioPath: "meditation_audios/movie8.mp3"),

    Item(
        name: "Ели мясо мужики",
        imagesPath: "meditation_images/img1.jpg",
        audioPath: "meditation_audios/movie9.mp3"),

    Item(
        name: "Отражения",
        imagesPath: "meditation_images/forest.jpeg",
        audioPath: "meditation_audios/movie10.mp3"),

    Item(
        name: "Помнят с горе древняне",
        imagesPath: "meditation_images/forest.jpeg",
        audioPath: "meditation_audios/movie11.mp3"),

    Item(
        name: "проклятый старый дом",
        imagesPath: "meditation_images/img1.jpg",
        audioPath: "meditation_audios/movie12.mp3"),

    Item(
        name: "Камнем по голове",
        imagesPath: "meditation_images/img1.jpg",
        audioPath: "meditation_audios/movie13.mp3"),




  ];
  final AudioPlayer audioPlayer = AudioPlayer();
  int? playingIndex;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: ListView.builder(
          itemCount: items.length,
          itemBuilder: (BuildContext context, int index) {
            return Padding(
              padding: const EdgeInsets.all(8.5),
              child: Container(
                height: 100,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    image: DecorationImage(
                        fit: BoxFit.cover,
                        image: AssetImage(items[index].imagesPath))),
                child: ListTile(
                  title: Text(items[index].name),
                  leading: IconButton(
                    icon: playingIndex == index ? FaIcon(FontAwesomeIcons.stop) :FaIcon(FontAwesomeIcons.play) ,
                    onPressed:  () async {
                      if (playingIndex == index) {
                        audioPlayer.stop();
                        setState(() {
                          playingIndex = null;
                        });

                      } else {
                        await audioPlayer.setAsset(items[index].audioPath);
                        audioPlayer.play();
                        audioPlayer.seekToPrevious();
                        setState(() {
                          playingIndex = index;
                        });
                      }
                    },
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
