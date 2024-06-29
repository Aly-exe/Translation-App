// ignore_for_file: must_be_immutable
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:translator/translator.dart';
import 'package:url_launcher/url_launcher.dart';

class HomeScreen extends StatefulWidget {
  HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => HomeScreenState();
}

class HomeScreenState extends State<HomeScreen> {
  String? from;
  var inputtext = TextEditingController();
  Translation? outputtext;
  String? to;
  var translator = GoogleTranslator();
  void translateText(
      {required String sourceText,
      required String? from,
      required String? to}) async {
    await translator
        .translate(sourceText, from: from ?? "auto", to: to ?? "en")
        .then((value) {
      setState(() {
        outputtext = value;
      });
    }).catchError((error) {
      print(error);
    });
  }

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: Color(0xffEEEEEE),
      appBar: AppBar(
        title: Center(
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text("Translate"),
              Text(
                " me",
                style: TextStyle(color: Colors.blue),
              )
            ],
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Form(
          child: Column(
            children: [
              Container(
                color: Colors.white,
                width: double.infinity,
                child: Row(
                  children: [
                    SizedBox(
                      width: height * .02645,
                    ),
                    DropdownButton(
                      hint: Text("From"),
                      value: from,
                      items: [
                        DropdownMenuItem(
                          value: "auto",
                          child: Text("auto"),
                        ),
                        DropdownMenuItem(
                          value: "ar",
                          child: Text("Arabic"),
                        ),
                        DropdownMenuItem(
                          value: "en",
                          child: Text("English"),
                        ),
                        DropdownMenuItem(
                          value: "de",
                          child: Text("Deutsch"),
                        ),
                        DropdownMenuItem(
                          value: "es",
                          child: Text("Spanish"),
                        ),
                        DropdownMenuItem(
                          value: "it",
                          child: Text("Italian"),
                        ),
                        DropdownMenuItem(
                          value: "fr",
                          child: Text("French"),
                        ),
                      ],
                      onChanged: (value) {
                        setState(() {
                          from = value;
                          inputtext.text = inputtext.text + " ";
                        });
                      },
                    ),
                    SizedBox(
                      width: height * .0529,
                    ),
                    IconButton(
                      onPressed: () {
                        setState(() {
                          if (from != null && from != "auto" && to != null) {
                            String val = from!;
                            from = to;
                            to = val;
                          }
                        });
                      },
                      icon: Icon(
                        Icons.swap_horiz_outlined,
                        color: Colors.blue,
                      ),
                    ),
                    SizedBox(
                      width: height * .0529,
                    ),
                    DropdownButton<String>(
                      hint: Text("To"),
                      value: to,
                      items: [
                        DropdownMenuItem(
                          value: "en",
                          child: Text("English"),
                        ),
                        DropdownMenuItem(
                          value: "ar",
                          child: Text("Arabic"),
                        ),
                        DropdownMenuItem(
                          value: "de",
                          child: Text("Deutsch"),
                        ),
                        DropdownMenuItem(
                          value: "es",
                          child: Text("Spanish"),
                        ),
                        DropdownMenuItem(
                          value: "it",
                          child: Text("Italian"),
                        ),
                        DropdownMenuItem(
                          value: "fr",
                          child: Text("French"),
                        ),
                      ],
                      onChanged: (value) {
                        setState(() {
                          to = value;
                          inputtext.text = inputtext.text + " ";
                          
                        });
                      },
                    ),
                  ],
                ),
              ),
              SizedBox(height: height * .02645),
              Container(
                color: Colors.white,
                child: TextFormField(
                  style: TextStyle(
                    color: Colors.black,
                  ),
                  controller: inputtext,
                  onChanged: (inputtext) async {
                    translateText(
                        sourceText: inputtext.toString(), from: from, to: to);
                  },
                  maxLines: 7,
                  scribbleEnabled: true,
                  decoration: InputDecoration(
                      hintTextDirection:
                          from == "ar" ? TextDirection.rtl : TextDirection.ltr,
                      border: InputBorder.none,
                      contentPadding: EdgeInsets.all(height * .01645),
                      hintText: "Enter text to translate",
                      hintStyle: TextStyle(
                      color: Colors.black
                    )
                      ),
                ),
              ),
              SizedBox(height: height * .03645),
              Container(
                color: Colors.white,
                child: TextFormField(
                  style: TextStyle(
                    color: Colors.black,
                  ),
                  enabled: false,
                  controller: TextEditingController(
                      text: outputtext.toString() == "null"
                          ? "Translated Text"
                          : outputtext.toString()),
                  maxLines: 7,
                  scribbleEnabled: true,
                  decoration: InputDecoration(
                    hintTextDirection:
                        to == "ar" ? TextDirection.rtl : TextDirection.ltr,
                    border: InputBorder.none,
                    contentPadding: EdgeInsets.all(height * .01645),
                    hintText: "Translated Text",
                    hintStyle: TextStyle(
                      color: Colors.black
                    )
                  ),
                ),
              ),
              SizedBox(height: height * .03645),
              // Scoial Media Icons
              Text("contact with me"),
              SizedBox(height: height * .01645),
              SocialMediaIcons()
            ],
          ),
        ),
      ),
    );
  }
}

class SocialMediaIcons extends StatelessWidget {
  const SocialMediaIcons({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        IconButton(
            onPressed: () async {
              final Uri facebook = Uri.parse(
                  "https://www.facebook.com/profile.php?id=100026765389745");

              await launchUrl(facebook);
            },
            icon: Icon(
              Icons.facebook,
              color: Colors.blue,
              size: 40,
            )),
        IconButton(
            onPressed: () {
              final Uri whatsApp = Uri.parse('https://wa.me/+201018961447');
              launchUrl(whatsApp);
            },
            icon: Icon(
              FontAwesomeIcons.whatsapp,
              color: Colors.green,
              size: 40,
            )),
        IconButton(
            onPressed: () {
              final Uri instagram =
                  Uri.parse("https://www.instagram.com/3liisayed/");
              launchUrl(instagram);
            },
            icon: Icon(
              FontAwesomeIcons.instagram,
              color: Colors.redAccent,
              size: 40,
            )),
        IconButton(
            onPressed: () {
              final Uri github = Uri.parse("https://github.com/Aly-exe");
              launchUrl(github);
            },
            icon: Icon(
              FontAwesomeIcons.github,
              color: Colors.grey,
              size: 40,
            )),
        IconButton(
            onPressed: () {
              final Uri linkedin =
                  Uri.parse("https://www.linkedin.com/in/ali-sayed-8a8b81220/");
              launchUrl(linkedin);
            },
            icon: Icon(
              FontAwesomeIcons.linkedin,
              color: Colors.blue,
              size: 40,
            )),
      ],
    );
  }
}
