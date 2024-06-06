import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../../State_management/Providers/Providers_for_store/auth_profile_provider.dart';
import '../../../../State_management/Providers/Providers_for_store/common_data_provider.dart';
import '../../../../State_management/Theme_configuration/this_app_colors.dart';
import '../../../Components/Buttons/_1_custom_button.dart';
import '../../../Components/Cards_and_tiles/_5_users_info_card.dart';
import '../../../Components/Others/dash_divider.dart';

class SellersInfo extends StatefulWidget {
  const SellersInfo({super.key});

  @override
  State<SellersInfo> createState() => _SellersInfoState();
}

class _SellersInfoState extends State<SellersInfo> {
  bool isCertificateVisible = false;

  @override
  Widget build(BuildContext context) {
    final CommonDataProvider productData =
        Provider.of<CommonDataProvider>(context, listen: false);
    final AuthProvider profileData =
        Provider.of<AuthProvider>(context, listen: false);

    return Stack(children: [
      SingleChildScrollView(
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          //info card next
          UsersInfoCard(isSellersInfo: true, isAdmin: profileData.isAdmin),
          //
          const SizedBox(height: 10),
          const DashedLineDivider(color: ThisAppColors.hover),
          const SizedBox(height: 10),
          //
          const Padding(
            padding:
                EdgeInsets.only(top: 3.0, bottom: 3.0, left: 130, right: 10),
            child: Text("Точки продажу",
                style: TextStyle(
                    color: ThisAppColors.kAppPrimaryColor,
                    fontSize: 15,
                    fontWeight: FontWeight.bold)),
          ),
          const SizedBox(height: 10),
          Padding(
              padding: const EdgeInsets.all(8.0),
              child: SizedBox(
                height: 150,
                // gridView builder next
                child: GridView.builder(
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      childAspectRatio: 3.2 / 1,
                      crossAxisSpacing: 10,
                      mainAxisSpacing: 10),
                  shrinkWrap: true,
                  itemCount: productData.filteredTowns.length,
                  itemBuilder: (ctx, i) {
                    return Container(
                      padding: const EdgeInsets.all(5),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: ThisAppColors.hover.withOpacity(0.5),
                      ),
                      child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(top: 5.0),
                              child: Icon(Icons.location_on,
                                  color: Colors.amber.withOpacity(0.5),
                                  size: 36),
                            ),
                            // flexible text
                            Flexible(
                              child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(productData.filteredTowns[i],
                                        style: const TextStyle(
                                            fontSize: 13,
                                            fontWeight: FontWeight.w600,
                                            color: Colors.white)),
                                    const SizedBox(height: 1),
                                    Flexible(
                                      child: Text(
                                          productData.filteredStreets[i],
                                          style: const TextStyle(
                                              fontSize: 11,
                                              fontWeight: FontWeight.w500,
                                              color: Colors.white)),
                                    ),
                                  ]),
                            ),
                          ]),
                    );
                  },
                ),
              )),
          const DashedLineDivider(color: ThisAppColors.hover),
          const SizedBox(height: 10),
          const Padding(
              padding: EdgeInsets.all(10.0),
              child: Text(
                  "   Мед - один з найцінніших продуктів харчування, якому немає замінників і на який ніколи не втратить попит. Україна є лідером в Європі з виробництва меду, а в світі займає 3-ю позицію.один з найцінніших продуктів харчування, якому немає замінників і на який ніколи не втратить попит. Україна є лідером в Європі з виробництва меду, а в світі займає 3-ю позицію.",
                  style: TextStyle(color: Colors.white, fontSize: 13))),
          const SizedBox(height: 20),
          const DashedLineDivider(),
          const SizedBox(height: 1),
          Padding(
            padding: const EdgeInsets.only(left: 85.0),
            child: Row(children: [
              SizedBox(
                  height: 40,
                  width: 50,
                  child: Image.asset("assets/logo.png", fit: BoxFit.fill)),
              const SizedBox(width: 10),
              TextButton(
                  onPressed: () {
                    toggleDetails();
                  },
                  child: const Text('Дивитись сертифікат',
                      style: TextStyle(
                          decoration: TextDecoration.underline,
                          color: ThisAppColors.white))),
            ]),
          ),
          const SizedBox(height: 1),
          const DashedLineDivider(),
        ]),
      ),
      //
      // toggling part (for certificate showing) next:
      //
      if (isCertificateVisible) ...[
        GestureDetector(
          onTap: toggleDetails,
          child: Container(color: Colors.black.withOpacity(0.1)),
        ),
        Positioned(
            child: Container(
          alignment: Alignment.topCenter,
          decoration: BoxDecoration(
            color: Colors.black.withOpacity(0.85),
            borderRadius: BorderRadius.circular(12.0),
          ),
          padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 5.0),
          child: Column(mainAxisSize: MainAxisSize.min, children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Spacer(),
                IconButton(
                    icon: const Icon(Icons.close, size: 20),
                    color: Colors.white,
                    onPressed: toggleDetails),
              ],
            ),
            SizedBox(
              height: 500,
              child: (productData.generalInfoData.certificateURL.isNotEmpty
                  ? Image.network(productData.generalInfoData.certificateURL,
                      fit: BoxFit.cover,
                      width: double.infinity,
                      height: double.infinity)
                  // when there is no certificate URL
                  : const NoCertificate()),
            ),
            const SizedBox(height: 20),
            CustomButton(
              width: MediaQuery.of(context).size.width * 0.9,
              onPressed: toggleDetails,
              text: "OK",
            ),
          ]),
        )),
      ],
    ]);
  }

  //
  void toggleDetails() {
    setState(() {
      isCertificateVisible = !isCertificateVisible;
    });
  }
  //
}

//
//
class NoCertificate extends StatelessWidget {
  const NoCertificate({
    super.key,
  });
  @override
  Widget build(BuildContext context) {
    return const SizedBox(
      height: 500,
      child: Center(
        child: Text(
          "На даний момент сертифікат відсутній",
          style: TextStyle(color: ThisAppColors.white),
        ),
      ),
    );
  }
}
