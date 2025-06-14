import 'package:bloc_demo/main_export.dart';

class CollectionDetailScreen extends StatefulWidget {
  const CollectionDetailScreen({super.key});

  @override
  State<CollectionDetailScreen> createState() => _CollectionDetailScreenState();
}

class _CollectionDetailScreenState extends State<CollectionDetailScreen> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        body: DecoratedBox(
          decoration: BoxDecoration(
            color: AppColors.backgroundColor,
            image: DecorationImage(image: AssetImage(Assets.backgroundImage), fit: BoxFit.cover),
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0,),
            child: Column(
              children: [
                60.hp(),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    CustomText(text: 'Genesis Collection', fontSize: 12, fontFamily: Assets.latoRegular),
                    GestureDetector(
                      onTap: (){
                        Navigator.pop(context);
                      },
                      child: Container(
                        padding: EdgeInsets.all(5),
                          decoration: BoxDecoration(
                            color: AppColors.backgroundColor,
                            shape: BoxShape.circle
                          ),
                          child: Icon(Icons.clear,size: 24,color: AppColors.whiteColor,)),
                    )
                  ],
                ),
                16.hp(),
                Image.asset(Assets.dummySpringImage, height: 500),
                16.hp(),
                Flexible(
                  child: ColoredBox(
                      color: AppColors.containerColor,
                    child: Padding(
                      padding: const EdgeInsets.all(18.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                           CustomText(text: 'Bottle 135/184', fontSize: 12, fontFamily: Assets.latoRegular),
                          8.hp(),
                          RichText(
                            text: TextSpan(
                                text: 'Talisker ',
                                style: TextStyle(
                                    fontFamily: Assets.ebGaramondMedium,
                                    fontSize:32,
                                    color: AppColors.whiteColor),
                                children: [
                                  TextSpan(
                                    text: '18 Year old ',
                                    style: TextStyle(
                                        fontFamily: Assets.ebGaramondMedium,
                                        fontSize:32,
                                        color: AppColors.buttonColor),
                                  ),
                                  TextSpan(
                                    text: '#2504s ',
                                    style: TextStyle(
                                        fontFamily: Assets.ebGaramondMedium,
                                        fontSize:32,
                                        color: AppColors.whiteColor),
                                  ),
                                ]),
                          ),
                         24.hp(),
                          Container(
                            decoration: BoxDecoration(
                              color: AppColors.backgroundColor,
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: TabBar(
                              indicator: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                color: AppColors.buttonColor,
                              ),
                              indicatorSize: TabBarIndicatorSize.tab,
                              labelColor: Colors.amber,
                              dividerColor: AppColors.transparentColor,
                              unselectedLabelColor: AppColors.greyColor4,
                              labelStyle: TextStyle(
                                fontSize: 12,
                              ),
                              unselectedLabelStyle: TextStyle(
                                fontSize: 12,
                              ),
                              tabs: [
                                Tab(text: 'Details'),
                                Tab(text: 'Tasting notes'),
                                Tab(text: 'History'),
                              ],
                            ),
                          ),
                          Flexible(
                            child: TabBarView(
                              children: [
                                DetailsTab(),
                                VideoPlayerScreen(),
                                const Center(child: Text('History content')),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
        floatingActionButton: FloatingActionButton.extended(
          onPressed: () {},
          backgroundColor: Colors.amber[700],
          icon: const Icon(Icons.add),
          label:
          CustomText(text: "Add to my collection", fontSize: 16, fontFamily: Assets.ebGaramondSemiBold,textColor:AppColors.blackColor),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      ),
    );
  }
}

class DetailsTab extends StatelessWidget {
  const DetailsTab({super.key});

  @override
  Widget build(BuildContext context) {
    List<String> title=[
      "Distillery",
      "Region",
      "Country",
      "Type",
      "Age statement",
      "Filled",
      "Bottled",
      "Cask number",
      "ABV",
      "Size",
      "Finish",
    ];
    List<String> values=[
      "Talisker",
      "Isle of Skye",
      "Scotland",
      "Single Malt Scotch",
      "18 Years'",
      "2003",
      "2021",
      "2504",
      "45.8%",
      "700ml",
      "Oak Cask",
    ];
    Widget buildDetailRow(String label, String value) {
      return Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          CustomText(text: label, fontSize: 16, fontFamily: Assets.latoRegular,textColor:AppColors.whiteColor),
          CustomText(text: value, fontSize: 16, fontFamily: Assets.latoRegular,textColor:AppColors.whiteColor),
        ],
      );
    }
    return ListView.separated(
        padding: EdgeInsets.symmetric(vertical: 12),
        itemBuilder: (context, index){
      return buildDetailRow(title[index],values[index]);
    }, separatorBuilder: (context, index){
      return 12.hp();

    }, itemCount: title.length);
  }
}


class VideoPlayerScreen extends StatefulWidget {
  const VideoPlayerScreen({super.key});

  @override
  State<VideoPlayerScreen> createState() => _VideoPlayerScreenState();
}

class _VideoPlayerScreenState extends State<VideoPlayerScreen> {
  late VideoPlayerController _controller;
  bool _isInitialized = false;

  @override
  void initState() {
    super.initState();

    _controller = VideoPlayerController.networkUrl(
      Uri.parse(
      'https://flutter.github.io/assets-for-api-docs/assets/videos/bee.mp4',
      )
    )
      ..initialize().then((_) {
        setState(() {
          _isInitialized = true;
        });
      })
      ..setLooping(true);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _togglePlayPause() {
    setState(() {
      _controller.value.isPlaying ? _controller.pause() : _controller.play();
    });
  }

  @override
  Widget build(BuildContext context) {
    final backgroundColor = const Color(0xFF0A1B1F);
    final sectionColor = const Color(0xFF0F2126);
    final highlightColor = const Color(0xFFDAA200);
    return Expanded(
      child: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            12.hp(),
            Center(
              child: _isInitialized
                  ? AspectRatio(
                aspectRatio: _controller.value.aspectRatio,
                child: Stack(
                  alignment: Alignment.center,
                  children: [
                    VideoPlayer(_controller),
                    if (!_controller.value.isPlaying)
                      IconButton(
                        icon: const Icon(Icons.play_circle_fill,
                            size: 64, color: Colors.white),
                        onPressed: _togglePlayPause,
                      )
                    else
                      GestureDetector(
                        onTap: _togglePlayPause,
                      ),
                  ],
                ),
              )
                  : const CircularProgressIndicator(),
            ),
            14.hp(),

            CustomText(text: "Tasting notes", fontSize: 22, fontFamily: Assets.ebGaramondMedium,textColor:AppColors.whiteColor),
        4.hp(),
            CustomText(text: "by Charles MacLean MBE", fontSize: 16, fontFamily: Assets.latoRegular,textColor:AppColors.whiteColor),
            16.hp(),

            notesSection("Nose", ["Description", "Description", "Description"], sectionColor),
            notesSection("Palate", ["Description", "Description", "Description"], sectionColor),
            notesSection("Finish", ["Description", "Description", "Description"], sectionColor),
            30.hp(),
          ],
        ),
      ),
    );
  }
  Widget tabItem(String title, {bool isSelected = false, Color? highlightColor}) {
    return Expanded(
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 12),
        decoration: BoxDecoration(
          color: isSelected ? highlightColor : Colors.transparent,
          borderRadius: BorderRadius.circular(6),
        ),
        child: Center(
          child: Text(
            title,
            style: TextStyle(
              color: isSelected ? Colors.black : Colors.grey,
              fontWeight: FontWeight.w500,
              fontSize: 16,
            ),
          ),
        ),
      ),
    );
  }

  Widget notesSection(String title, List<String> descriptions, Color bgColor) {
    return Container(
      margin: const EdgeInsets.only(bottom: 16),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: bgColor,
        borderRadius: BorderRadius.circular(8),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CustomText(text: title, fontSize: 22, fontFamily: Assets.ebGaramondMedium,textColor:AppColors.whiteColor),
          8.hp(),
          for (var desc in descriptions)
            SizedBox(
              width: double.infinity,
              child: Padding(
                padding: const EdgeInsets.only(bottom: 4),
                child: CustomText(text: desc, fontSize: 16, fontFamily: Assets.latoRegular,textColor:AppColors.whiteColor),

              ),
            ),
        ],
      ),
    );
  }
}


