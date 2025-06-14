import 'package:bloc_demo/main_export.dart';
import 'package:bloc_demo/src/features/collection_detail_screen/collection_detail_export.dart';

class CollectionView extends StatefulWidget {
  const CollectionView({super.key});

  @override
  State<CollectionView> createState() => _CollectionViewState();
}

class _CollectionViewState extends State<CollectionView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        surfaceTintColor: AppColors.backgroundColor,
        backgroundColor: AppColors.backgroundColor,
        elevation: 0,
        title: CustomText(text: 'My collection', fontSize: 32, fontFamily: Assets.ebGaramondMedium),
        actions: [
          Stack(
            children: [
              InkWell(
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) => const CollectionDetailScreen()));
                },
                borderRadius: BorderRadius.circular(100),
                child:  Image.asset(Assets.notificationIcon, width: 24, height: 24),
              ),
              Positioned(
                right: 2,
                bottom: 3,
                child: DecoratedBox(
                  decoration: BoxDecoration(shape: BoxShape.circle, color: AppColors.redColor),
                  child: SizedBox(height: 7, width: 7),
                ),
              ),
            ],
          ),
          10.wp(),
        ],
      ),
    );
  }
}
