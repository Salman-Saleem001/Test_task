import 'package:bloc_demo/main_export.dart';
import '../../../collection_detail_screen/collection_detail_export.dart';

class CollectionView extends StatelessWidget {
  const CollectionView({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: BlocBuilder<CollectionBloc, CollectionState>(
        builder: (BuildContext context, state) {
          switch (state) {
            case CollectionFetched():
              return RefreshIndicator(
                backgroundColor: AppColors.greyScaleColor,
                color: AppColors.buttonColor,
                onRefresh: () async{
                  context.read<CollectionBloc>().add(GetCollection());
                  return;
                },
                child: GridView.builder(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  itemCount: 20,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    childAspectRatio: 0.6,
                    mainAxisSpacing: 8,
                    crossAxisSpacing: 8,
                  ),
                  itemBuilder: (_, index) {
                    final collectionData = state.collection[index];
                    return InkWell(
                    onTap: (){
                      context.read<CollectionDetailBloc>().add(GetCollectionDetail());
                      Navigator.push(context, MaterialPageRoute(builder: (context) => const CollectionDetailScreen()));
                    },
                    child:CollectionCard(
                      image: collectionData.imageUrl,
                      name: collectionData.name,
                      vintage: collectionData.vintage,
                      caskNumber: collectionData.caskNumber,
                      availableBottles: collectionData.availableBottles,
                      totalBottles: collectionData.totalBottles,
                      id: collectionData.id,
                    ),
                  );},
                ),
              );
            case ErrorInLoading():
              return Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  CustomText(text: "Something went wrong", fontSize: 12),
                  5.hp(),
                  GestureDetector(
                    onTap: () {
                      context.read<CollectionBloc>().add(GetCollection());
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

class CollectionCard extends StatelessWidget {
  const CollectionCard({
    super.key,
    required this.image,
    required this.name,
    required this.vintage,
    required this.caskNumber,
    required this.availableBottles,
    required this.totalBottles,
    required this.id,
  });

  final int id;
  final String image;
  final String name;
  final int vintage;
  final String caskNumber;
  final int availableBottles;
  final int totalBottles;

  @override
  Widget build(BuildContext context) {
    return ColoredBox(
      color: AppColors.containerColor,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Expanded(
              child: Image.network(
                alignment: Alignment.center,
                image,
                fit: BoxFit.cover,
                errorBuilder:
                    (context, error, stackTrace) =>
                        Center(child: const Icon(Icons.error, color: AppColors.buttonColor, size: 32)),
                loadingBuilder: (context, child, loadingProgress) {
                  if (loadingProgress == null) return child;
                  final val = loadingProgress.cumulativeBytesLoaded;
                  final total = loadingProgress.expectedTotalBytes;
                  final progress = val / total!;
                  return Center(child: CircularProgressIndicator.adaptive(value: progress));
                },
              ),
            ),
            Align(
              alignment: Alignment.bottomLeft,
                child: CustomText(text: "$name \n$vintage $caskNumber ", fontSize: 22, fontFamily: Assets.ebGaramondMedium)),
            Align(
              alignment: Alignment.bottomLeft,
              child: CustomText(
                text: "($availableBottles/$totalBottles))",
                fontSize: 12,
                fontFamily: Assets.ebGaramondMedium,
                textColor: AppColors.greyColor2,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
