import 'package:bloc_demo/main_export.dart';

import '../../collection_detail_export.dart';

class CollectionDetailScreen extends StatefulWidget {
  const CollectionDetailScreen({super.key});

  @override
  State<CollectionDetailScreen> createState() => _CollectionDetailScreenState();
}

class _CollectionDetailScreenState extends State<CollectionDetailScreen> {
  @override
  Widget build(BuildContext context) {
    return Center(
        child: BlocBuilder<CollectionDetailBloc, CollectionDetailState>(
          builder: (BuildContext context, state) {
            switch (state) {
              case CollectionDetailFetched():
                final CollectionDetail collectionDetailData = state.collection;
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
                                CustomText(text: collectionDetailData.title, fontSize: 12, fontFamily: Assets.latoRegular),
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
                            Image.asset(collectionDetailData.imageUrl, height: 400),
                            16.hp(),
                            Flexible(
                              child: ColoredBox(
                                color: AppColors.containerColor,
                                child: Padding(
                                  padding: const EdgeInsets.all(18.0),
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      CustomText(text: collectionDetailData.bottleId, fontSize: 12, fontFamily: Assets.latoRegular),
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
                                                text: '#${collectionDetailData.id} ',
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
                                            DetailsTab(collectionDetail: collectionDetailData,),
                                            TestingNotesScreen(collectionDetail: collectionDetailData,),
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
                case ErrorInCollectionDetailLoading():
                return Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    CustomText(text: "Something went wrong", fontSize: 12),
                    5.hp(),
                    GestureDetector(
                      onTap: () {
                        context.read<CollectionDetailBloc>().add(GetCollectionDetail());
                      },
                      child: CustomText(text: "Try again", fontSize: 12, textColor: AppColors.buttonColor),
                    ),
                  ],
                );
              default:
                return CircularProgressIndicator.adaptive();
            }
          },
        ),
      );
  }
}

class DetailsTab extends StatelessWidget {
  final CollectionDetail collectionDetail;
  const DetailsTab({super.key, required this.collectionDetail});

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
      collectionDetail.details.distillery,
      collectionDetail.details.region,
      collectionDetail.details.country,
      collectionDetail.details.type,
      collectionDetail.details.ageStatement,
      collectionDetail.details.filled,
      collectionDetail.details.bottled,
      collectionDetail.details.caskNumber,
      collectionDetail.details.abv,
      collectionDetail.details.size,
      collectionDetail.details.filled,
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

class TestingNotesScreen extends StatefulWidget {
  final CollectionDetail collectionDetail;
  const TestingNotesScreen({super.key, required this.collectionDetail});

  @override
  State<TestingNotesScreen> createState() => _TestingNotesScreenState();
}

class _TestingNotesScreenState extends State<TestingNotesScreen> {
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
            CustomText(text: widget.collectionDetail.tastingNotes.author, fontSize: 16, fontFamily: Assets.latoRegular,textColor:AppColors.whiteColor),
            16.hp(),

            notesSection(widget.collectionDetail.tastingNotes.sections[0].title, [widget.collectionDetail.tastingNotes.sections[0].descriptions[0],widget.collectionDetail.tastingNotes.sections[0].descriptions[1] , widget.collectionDetail.tastingNotes.sections[0].descriptions[2]], sectionColor),
            notesSection(widget.collectionDetail.tastingNotes.sections[1].title, [widget.collectionDetail.tastingNotes.sections[1].descriptions[0],widget.collectionDetail.tastingNotes.sections[1].descriptions[1] , widget.collectionDetail.tastingNotes.sections[1].descriptions[2]], sectionColor),
            notesSection(widget.collectionDetail.tastingNotes.sections[2].title, [widget.collectionDetail.tastingNotes.sections[2].descriptions[0],widget.collectionDetail.tastingNotes.sections[2].descriptions[1] , widget.collectionDetail.tastingNotes.sections[2].descriptions[2]], sectionColor),

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
                child: CustomText(text: desc, fontSize: 16, fontFamily: Assets.latoRegular,textColor:AppColors.whiteColor,maxLines: 4,),

              ),
            ),
        ],
      ),
    );
  }
}


