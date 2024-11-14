import 'package:camera/camera.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:dharma_bakti_app/constants/global_constants.dart';
import 'package:dharma_bakti_app/pages/camera.dart';
import 'package:dharma_bakti_app/pages/info/info.dart';
import 'package:dharma_bakti_app/pages/initial.dart';
import 'package:dharma_bakti_app/services/http_helper.dart';
import 'package:dharma_bakti_app/widgets/app_bar_custom.dart';
import 'package:dharma_bakti_app/widgets/search_bar.dart';
import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Dashboard extends StatefulWidget {
  Dashboard({super.key});

  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  List<CameraDescription> camerasInit = [];

  bool _isCamerasInitialized = false;

  Future<void> initializingCameras() async {
    camerasInit = await availableCameras();
    setState(() {
      _isCamerasInitialized = true;
    });
  }

  FirebaseAnalytics analytics = FirebaseAnalytics.instance;
  Future<void> logAnalytics(String buttonName) async {
    await analytics
        .logEvent(name: buttonName, parameters: {'event_name': buttonName});
    print("Berhasil");
  }

  final CarouselSliderController _carouselController =
      CarouselSliderController();

  final TextEditingController _searchController = TextEditingController();

  void _onSearchChanged(String query) {
    // Handle search logic here, e.g., filter a list based on the query
    print("Search query: $query");
  }

  int carouselIndex = 0;

  Future<void> _saveLogoutStatus() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool('isLoggedIn', false);
  }

  List<String> menuLabel = ['INFO', 'ABSENSI', 'PEMBAYARAN', 'EVENT'];
  List<IconData> menuIcon = [
    Icons.info,
    Icons.list,
    Icons.currency_exchange,
    Icons.timelapse_outlined
  ];

  HttpHelper? httpHelperNews;
  List? news;

  void initializingNews() async {
    var tmpNews = await httpHelperNews?.getNews();
    setState(() {
      news = tmpNews;
    });
    print("Ini adalah news:");
    print(news);
  }

  @override
  void initState() {
    httpHelperNews = HttpHelper();
    initializingNews();
    initializingCameras();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    List<Widget> page = [
      const InfoPage(),
      _isCamerasInitialized ? CameraScreen(cameras: camerasInit) : InfoPage(),
      const InfoPage(),
      const InfoPage()
    ];

    return PopScope(
      canPop: false,
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        drawer: AppSideMenu(
          saveLogout: _saveLogoutStatus(),
        ),
        appBar: AppBar(
          backgroundColor: AppColors.primaryColor,
          toolbarHeight: 0,
        ),
        body: SafeArea(
          child: GestureDetector(
            onTap: () {
              FocusScope.of(context).unfocus();
            },
            child: Container(
              //Container ini memungkinkan GestureDetector dari search_bar bekerja dengan memberikan "warna" agar bisa digunakan
              decoration: const BoxDecoration(color: Colors.transparent),
              child: Column(
                children: [
                  const AppBarCustom(),
                  const SizedBox(
                    height: 20,
                  ),
                  SearchBarCustom(
                    searchController: _searchController,
                    onSearchChanged: _onSearchChanged,
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Container(
                    width: 1000,
                    decoration: const BoxDecoration(
                      color: AppColors.thirdColor,
                    ),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(vertical: 10),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(left: 30),
                            child: Text(
                              "Promo",
                              style: GoogleFonts.overpass(
                                  fontWeight: FontWeight.w900,
                                  color: AppColors.labelTextColor,
                                  fontSize: 20),
                            ),
                          ),
                          CarouselSlider(
                            items: [
                              Image.asset(
                                'assets/images/gopay.png',
                                height: 120,
                              ),
                              Image.asset(
                                'assets/images/gopay.png',
                                height: 120,
                              ),
                              Image.asset(
                                'assets/images/gopay.png',
                                height: 120,
                              ),
                              Image.asset(
                                'assets/images/gopay.png',
                                height: 120,
                              ),
                              Image.asset(
                                'assets/images/gopay.png',
                                height: 120,
                              ),
                            ],
                            carouselController: _carouselController,
                            options: CarouselOptions(
                                height: 120,
                                autoPlay: true,
                                viewportFraction: 1,
                                autoPlayInterval: const Duration(seconds: 3),
                                onPageChanged: (index, reason) {
                                  setState(() {
                                    carouselIndex = index;
                                  });
                                }),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: List.generate(5, (index) {
                              return GestureDetector(
                                onTap: () {
                                  _carouselController.animateToPage(index);
                                },
                                child: Container(
                                  width: 30,
                                  height: 10,
                                  margin:
                                      const EdgeInsets.symmetric(horizontal: 5),
                                  decoration: BoxDecoration(
                                    color: carouselIndex == index
                                        ? AppColors.secondaryColor
                                        : Colors.grey,
                                    borderRadius: BorderRadius.circular(5),
                                  ),
                                ),
                              );
                            }),
                          )
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: List.generate(4, (index) {
                        return Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            InkWell(
                              onTap: () {
                                logAnalytics('Tombol_${menuLabel[index]}');
                                Navigator.of(context).push(
                                  MaterialPageRoute(
                                    builder: (context) => page[index],
                                  ),
                                );
                              },
                              child: Container(
                                width: 70,
                                height: 70,
                                decoration: BoxDecoration(
                                  color: AppColors.thirdColor,
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                child: Icon(
                                  menuIcon[index],
                                  color: AppColors.labelTextColor,
                                ),
                              ),
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            Text(
                              menuLabel[index],
                              style: GoogleFonts.overpass(
                                  color: AppColors.labelTextColor,
                                  fontSize: 10,
                                  fontWeight: FontWeight.bold),
                            )
                          ],
                        );
                      })),
                  const SizedBox(
                    height: 15,
                  ),
                  Expanded(
                    child: Container(
                      width: 1000,
                      decoration: const BoxDecoration(
                        color: AppColors.thirdColor,
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(20),
                          topRight: Radius.circular(20),
                        ),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(left: 30, top: 10),
                            child: Text(
                              "Berita Terbaru",
                              style: GoogleFonts.overpass(
                                  fontWeight: FontWeight.w900,
                                  color: AppColors.labelTextColor,
                                  fontSize: 20),
                            ),
                          ),
                          CarouselSlider(
                            items: List.generate(5, (index) {
                              return Container(
                                height: 200,
                                width: 300,
                                decoration: const BoxDecoration(
                                    // border: Border.all(color: Colors.black),
                                    color: Colors.white),
                                child: news == null
                                    ? const Center(
                                        child: CircularProgressIndicator())
                                    : Column(
                                        children: [
                                          Container(
                                              height: 100,
                                              width: 300,
                                              child: Image.network(
                                                news![index].imgUrl,
                                                fit: BoxFit.cover,
                                                errorBuilder: (BuildContext
                                                        context,
                                                    Object exception,
                                                    StackTrace? stackTrace) {
                                                  return Image.asset(
                                                    'assets/images/db_logo.png',
                                                    fit: BoxFit.cover,
                                                  );
                                                },
                                              )),
                                          Container(
                                              child: Padding(
                                            padding: const EdgeInsets.all(8.0),
                                            child: Column(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                Text(
                                                  news![index].title,
                                                  style: GoogleFonts.overpass(
                                                      textStyle: const TextStyle(
                                                          color: AppColors
                                                              .labelTextColor,
                                                          fontWeight:
                                                              FontWeight.bold)),
                                                  maxLines: 2,
                                                  overflow:
                                                      TextOverflow.ellipsis,
                                                ),
                                                const SizedBox(
                                                  height: 10,
                                                ),
                                                Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceBetween,
                                                  children: [
                                                    Text(
                                                      news![index]
                                                          .date
                                                          .substring(0, 10),
                                                      style:
                                                          GoogleFonts.overpass(
                                                              textStyle:
                                                                  const TextStyle(
                                                        color: AppColors
                                                            .labelTextColor,
                                                      )),
                                                    ),
                                                    Container(
                                                      width: 140,
                                                      height: 30,
                                                      child: ElevatedButton(
                                                          onPressed: () {
                                                            // Tembak launchUrl
                                                          },
                                                          style: ButtonStyle(
                                                              elevation:
                                                                  const WidgetStatePropertyAll(
                                                                      0),
                                                              backgroundColor:
                                                                  WidgetStateProperty.all<
                                                                          Color>(
                                                                      AppColors
                                                                          .labelTextColor)),
                                                          child: Text(
                                                            'Selengkapnya >',
                                                            style: GoogleFonts.overpass(
                                                                textStyle: TextStyle(
                                                                    color: Colors
                                                                        .white,
                                                                    fontSize:
                                                                        10)),
                                                          )),
                                                    )
                                                  ],
                                                )
                                              ],
                                            ),
                                          ))
                                        ],
                                      ),
                              );
                            }),
                            options: CarouselOptions(
                              height: 200,
                              viewportFraction: 1,
                              enableInfiniteScroll: false,
                            ),
                          ),
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class AppSideMenu extends StatelessWidget {
  const AppSideMenu({super.key, required this.saveLogout});

  final Future<void> saveLogout;

  @override
  Widget build(BuildContext context) {
    return Drawer(
        child: Container(
      decoration: BoxDecoration(
        color: AppColors.thirdColor,
      ),
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          UserAccountsDrawerHeader(
            accountName: Text("Delvin Dwiantono", style: GoogleFonts.poppins()),
            accountEmail:
                Text("delvindwiantono@gmail.com", style: GoogleFonts.poppins()),
            currentAccountPicture: CircleAvatar(
              child: ClipOval(
                child: Image.network(
                  "https://plus.unsplash.com/premium_photo-1671656349218-5218444643d8?q=80&w=1887&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D",
                  width: 90,
                  height: 90,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            decoration: const BoxDecoration(
                color: Colors.blue,
                image: DecorationImage(
                  image: NetworkImage(
                      'https://upload.wikimedia.org/wikipedia/commons/thumb/e/ef/The_Forbidden_City_-_View_from_Coal_Hill.jpg/1280px-The_Forbidden_City_-_View_from_Coal_Hill.jpg'),
                  fit: BoxFit.cover,
                )),
          ),
          ListTile(
            leading: const Icon(Icons.share),
            title: Text("Bagikan", style: GoogleFonts.poppins()),
            onTap: () {},
          ),
          ListTile(
            leading: const Icon(Icons.person),
            title: Text("Profil Saya", style: GoogleFonts.poppins()),
            onTap: () {},
          ),
          ListTile(
            leading: const Icon(Icons.settings),
            title: Text("Pengaturan", style: GoogleFonts.poppins()),
            onTap: () {},
          ),
          const Divider(),
          ListTile(
            leading: const Icon(Icons.exit_to_app),
            title: Text(
              "Keluar",
              style: GoogleFonts.poppins(),
            ),
            onTap: () async {
              await saveLogout;
              Navigator.of(context).pushReplacement(
                MaterialPageRoute(
                  builder: (context) => const InitialPage(),
                ),
              );
            },
          ),
          const SizedBox(
            height: 200,
          ),
          Center(
            child: Image.asset(
              'assets/images/db_logo.png',
              width: 90,
            ),

            //     child: Image.network(
            //   "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTtv--lXzB9Vyxw-DlBRLY7QXXJ0QZ_5QZcRw&s",
            //   width: 90,
            // )
          ),
          const SizedBox(
            height: 10,
          ),
          Text(
            "Perguruan Dharma Bakti © 2024",
            style: GoogleFonts.poppins(fontSize: 10),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    ));
  }
}
