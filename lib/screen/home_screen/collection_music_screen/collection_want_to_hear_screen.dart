import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class CollectionWantToHearScreen extends StatefulWidget {
  const CollectionWantToHearScreen({super.key});

  @override
  State<CollectionWantToHearScreen> createState() =>
      _CollectionWantToHearScreenState();
}

class _CollectionWantToHearScreenState
    extends State<CollectionWantToHearScreen> {
  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text(AppLocalizations.of(context)!.maybeYouWantToHear),
        centerTitle: true,
        actions: [
          Container(
              padding: const EdgeInsets.only(right: 16),
              child: const Icon(Icons.search))
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: GridView.builder(
          shrinkWrap: true,
          physics: const BouncingScrollPhysics(),
          gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
              maxCrossAxisExtent: 200,
              childAspectRatio: 1,
              crossAxisSpacing: 20,
              mainAxisSpacing: 20),
          itemCount: 12,
          itemBuilder: (BuildContext context, index) {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: Image.asset(
                    'lib/assets/images/anh.png',
                    fit: BoxFit.fill,
                    height: screenWidth * 0.35,
                  ),
                ),
                const SizedBox(
                  height: 8,
                ),
                const SizedBox(
                  child: Text(
                    'Music corner IU',
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.w400),
                  ),
                )
              ],
            );
          },
        ),
      ),
    );
  }
}
