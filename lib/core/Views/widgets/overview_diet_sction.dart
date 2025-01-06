import 'package:flutter/cupertino.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../styles/fonts.dart';
import 'overview_item.dart';

class OverviewDietsSection extends StatelessWidget {
  const OverviewDietsSection({
    super.key,
    required this.diets,
  });

  final List diets;

  @override
  Widget build(BuildContext context) {
    return (diets.isNotEmpty)
        ? Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const OverviewItem(
                text: 'Diets :',
                icon: FontAwesomeIcons.bowlFood,
                units: '',
              ),
              SizedBox(
                height: diets.length * 30,
                child: ListView.builder(
                  physics: const NeverScrollableScrollPhysics(),
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 20, vertical: 2),
                      child: Align(
                        alignment: AlignmentDirectional.topStart,
                        child: Text(
                          diets[index],
                          style: AppFonts.bodyText16,
                        ),
                      ),
                    );
                  },
                  itemCount: diets.length,
                ),
              ),
            ],
          )
        : const SizedBox();
  }
}
