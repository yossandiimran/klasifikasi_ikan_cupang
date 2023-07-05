// ignore_for_file: file_names, prefer_const_constructors, prefer_const_literals_to_create_immutables
part of '../header.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final ImagePicker picker = ImagePicker();
  late File imageFile;
  late List results;
  bool loadImage = false;

  String name = "";
  String confidence = "";

  loadMyModels() async {
    await Tflite.loadModel(
      model: "assets/model_unquant.tflite",
      labels: "assets/labels.txt",
    );
  }

  @override
  void initState() {
    super.initState();
    loadMyModels();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueGrey.shade50,
      appBar: AppBar(
        title: Text("Klasifikasi Ikan Cupang"),
        backgroundColor: defGreen,
        centerTitle: true,
        elevation: 0,
      ),
      body: Stack(
        children: [
          loadImage
              ? Positioned(
                  top: kToolbarHeight * 3,
                  left: 0,
                  right: 0,
                  bottom: 0,
                  child: Column(
                    children: [
                      Container(
                        height: 200,
                        width: 200,
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            image: FileImage(
                              File(imageFile.path),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(height: 10),
                      Container(
                        padding: EdgeInsets.all(10),
                        child: Text(
                          name,
                          style: textStyling.defaultBlackBold(20),
                        ),
                      ),
                    ],
                  ),
                )
              : Container(),
          Positioned(
            top: 0,
            left: 0,
            right: 0,
            bottom: 0,
            child: Column(
              children: [
                Container(
                  height: kToolbarHeight * 2.2,
                  decoration: widget.decCont2(defGreen, 40, 40, 0, 0),
                  child: Row(
                    children: [
                      Spacer(),
                      GestureDetector(
                        onTap: () {
                          openImageCamera("camera");
                        },
                        child: Container(
                          height: 70,
                          padding: EdgeInsets.symmetric(horizontal: 40),
                          decoration: widget.decCont2(
                            defBlue,
                            30,
                            30,
                            30,
                            30,
                          ),
                          child: Column(
                            children: [
                              Spacer(),
                              Icon(Icons.camera, color: Colors.white),
                              Spacer(),
                              Text(
                                "Camera",
                                style: textStyling.defaultWhiteBold(14),
                              ),
                              Spacer(),
                            ],
                          ),
                        ),
                      ),
                      Spacer(),
                      GestureDetector(
                        onTap: () {
                          openImageCamera("galery");
                        },
                        child: Container(
                          height: 70,
                          padding: EdgeInsets.symmetric(horizontal: 45),
                          decoration: widget.decCont2(
                            defOrange,
                            30,
                            30,
                            30,
                            30,
                          ),
                          child: Column(
                            children: [
                              Spacer(),
                              Icon(Icons.image, color: Colors.white),
                              Spacer(),
                              Text(
                                "Galery",
                                style: textStyling.defaultWhiteBold(14),
                              ),
                              Spacer(),
                            ],
                          ),
                        ),
                      ),
                      Spacer(),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  openImageCamera(type) async {
    XFile? image;
    if (type == "galery") {
      image = await picker.pickImage(source: ImageSource.gallery);
    } else {
      image = await picker.pickImage(source: ImageSource.camera);
    }
    if (image != null) {
      setState(() {
        imageFile = File(image!.path);
        readFaceAssets(imageFile);
        loadImage = true;
      });
    }
  }

  readFaceAssets(File file) async {
    var res = await Tflite.runModelOnImage(
      path: file.path,
      numResults: 2,
      threshold: 0.5,
      imageMean: 127.5,
      imageStd: 127.5,
    );

    print(res);

    setState(() {
      results = res!;
      String nme = results[0]["label"];
      name = nme.substring(2);
    });
  }
}
