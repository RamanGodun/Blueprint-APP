import 'package:flutter/material.dart';
import 'dart:io';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';
import '../../../../State_management/Providers/Providers_for_store/auth_profile_provider.dart';
import '../../../../State_management/Providers/Providers_for_store/common_data_provider.dart';
import '../../../../State_management/Helpers/For_auth/dm_methods.dart';
import '../../../../State_management/Theme_configuration/app_colors.dart';
import '../../../Components/Buttons/for_shop/custom_button.dart';
import '../../../Components/Mini_widgets/dashed_border_container.dart';
import '../../../Components/Switchers/_2_my_switcher.dart';

// ignore_for_file: use_build_context_synchronously

class PersonalDataEditing4Admin extends StatefulWidget {
  const PersonalDataEditing4Admin({
    super.key,
  });

  @override
  State<PersonalDataEditing4Admin> createState() =>
      _PersonalDataEditing4AdminState();
}

class _PersonalDataEditing4AdminState extends State<PersonalDataEditing4Admin> {
  // vars next
  File? selectedImageOfAdmin;
  File? selectedImageOfCertificate;
  final formKey3 = GlobalKey<FormState>();
  late AuthProvider profileInfo;
  late CommonDataProvider generalInfo;
  TextEditingController textEditingController1 = TextEditingController();
  TextEditingController textEditingController2 = TextEditingController();
  List<TextEditingController> listOfControllers = [];
  bool isLoading = false;

  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);
    AuthProvider profile = Provider.of<AuthProvider>(context, listen: true);
    CommonDataProvider generalData =
        Provider.of<CommonDataProvider>(context, listen: true);

    return Scaffold(
      backgroundColor: AppColors.black,
      appBar: AppBar(
          backgroundColor: Colors.grey[900],
          leading: Padding(
              padding: const EdgeInsets.only(left: 10.0),
              child: CircleAvatar(
                  backgroundColor:
                      Theme.of(context).primaryColor.withOpacity(0.1),
                  child: Image.asset("assets/logo.png", fit: BoxFit.fill))),
          title: const Align(
              alignment: Alignment.topLeft,
              child: Text("Редагування даних",
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 15,
                      fontWeight: FontWeight.w500))),
          actions: const [MyCustomizedSwitcher(isThemeSwitcher: true)]),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Form(
          key: formKey3,
          child: Column(
              mainAxisSize: MainAxisSize.max,
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                const SizedBox(height: 10),
                Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      SizedBox(
                          height: mediaQuery.size.height * 0.11,
                          width: mediaQuery.size.width * 0.23,
                          child: Padding(
                              padding: const EdgeInsets.only(bottom: 12.0),
                              child: DashedBorderContainer(
                                dashSpace: 0.1,
                                borderWidth: 2,
                                dashWidth: 1,
                                // picture block next
                                child: InkWell(
                                    onTap: () => selectImage4Admin(),
                                    child: (selectedImageOfAdmin != null)
                                        ? Image.file(selectedImageOfAdmin!)
                                        : (profile.userProfileData.userImageURL!
                                                .isNotEmpty)
                                            ? SizedBox(
                                                child: Image.network(
                                                    profile.userProfileData
                                                        .userImageURL!,
                                                    fit: BoxFit.cover,
                                                    width: double.infinity,
                                                    height: double.infinity))
                                            : const Icon(Icons.add_a_photo,
                                                color:
                                                    AppColors.kAppPrimaryColor,
                                                size: 50)),
                              ))),
                      SizedBox(
                        height: mediaQuery.size.height * 0.15,
                        width: mediaQuery.size.width * 0.70,
                        // child: TextFormFieldBlock4AdminDataEditing(
                        //     textEditingController1: textEditingController1,
                        //     textEditingController2: textEditingController2),
                      ),
                    ]),
                SizedBox(
                    height: mediaQuery.size.height * 0.45,
                    width: mediaQuery.size.width * 0.99,
                    child: DashedBorderContainer(
                      dashWidth: 0.01,
                      child: Container(),
                      // child: SellerPointsListView(
                      //     listOfControllers: listOfControllers),
                    )),
                SizedBox(height: mediaQuery.size.height * 0.01),
                Padding(
                  padding: const EdgeInsets.only(left: 100.0),
                  child: Row(children: [
                    SizedBox(
                        height: 40,
                        width: 60,
                        child:
                            Image.asset("assets/logo.png", fit: BoxFit.cover)),
                    const SizedBox(width: 10),
                    //
                    TextButton(
                        onPressed: () => selectImage4Certificate(),
                        child: const Text('Обрати сертифікат',
                            style: TextStyle(
                                decoration: TextDecoration.underline,
                                color: AppColors.white))),
                  ]),
                ),
                SizedBox(height: mediaQuery.size.height * 0.03),
                //
                CustomButton(
                  width: mediaQuery.size.width * 0.9,
                  height: 40,
                  text: "OK",
                  onPressed: () async {
                    if (formKey3.currentState != null &&
                        formKey3.currentState!.validate()) {
                      //  uploading of admin's picture 2 DB and getting URL
                      //and then updating in DB and AuthProvider
                      if (selectedImageOfAdmin != null) {
                        await handlingWithAdminPic();
                      }
                      // the same 4 certificate
                      if (selectedImageOfCertificate != null) {
                        await handlingWithCertificatePic(generalData);
                      }
                      // saving profile data on DB
                      generalData.updateGeneralInfoDataInProvider(
                          newAdminPhoneNumber:
                              profileInfo.userProfileData.userPhoneNumber,
                          newAdminPicture:
                              profileInfo.userProfileData.userImageURL,
                          newAdminsNickName:
                              profileInfo.userProfileData.userAccountName);
                      await generalData.saveGeneralDataToFirebase();

                      await profile.saveUserDataToFirebase(false);
                      // saving seller's points info
                      await DMMethodsOnDB().updateSellerPointsInfoOnFirebase(
                          context, generalData.sellerPointsInfo);
                      // nextScreen(
                      //     context, const AppTabs(bottomTab: 2, appBarIndex: 0));
                    } else {
                      // Виконати код, якщо форма не ініціалізована або не пройшла валідацію
                      // showSnackbar(context,
                      //     color: Colors.red,
                      //     content: "потрібно заповнити всі обов'язкові поля");
                    }
                  },
                ),
                SizedBox(height: mediaQuery.size.height * 0.06),
              ]),
        ),
      ),
    );
  }

// Methods next
  Future<void> selectImage4Admin() async {
    setState(() {
      isLoading = true;
    });
    final pickedImage =
        await ImagePicker().pickImage(source: ImageSource.gallery);
    setState(() {
      if (pickedImage != null) {
        selectedImageOfAdmin = File(pickedImage.path);
      } else {
        return;
      }
    });
    setState(() {
      isLoading = false;
    });
  }

  Future<void> selectImage4Certificate() async {
    setState(() {
      isLoading = true;
    });
    final pickedImage =
        await ImagePicker().pickImage(source: ImageSource.gallery);
    setState(() {
      if (pickedImage != null) {
        selectedImageOfCertificate = File(pickedImage.path);
      } else {
        return;
      }
    });
    setState(() {
      isLoading = false;
    });
  }

  Future<void> handlingWithAdminPic() async {
    String? adminPictureURL = await DMMethodsOnDB().uploadImageToStorage(
        selectedFile4DB: selectedImageOfAdmin,
        fileNameOnStorage: profileInfo.userProfileData.userId,
        isProduct: false,
        isCertificate: false);
    profileInfo.userProfileData.userImageURL = adminPictureURL;
    await DMMethodsOnDB().updateProfileOrCertificatePictureURLonDB(
        context: context,
        userId: profileInfo.userProfileData.userId,
        newPictureURL: adminPictureURL,
        isProfilePicture: true,
        isAdmin: true);
  }

  Future<void> handlingWithCertificatePic(
      CommonDataProvider generalData) async {
    String? certificatePictureURL = await DMMethodsOnDB().uploadImageToStorage(
        selectedFile4DB: selectedImageOfCertificate,
        fileNameOnStorage: "Certificate",
        isProduct: false,
        isCertificate: true);
    generalData.generalInfoData.certificateURL = certificatePictureURL!;
    await DMMethodsOnDB().updateProfileOrCertificatePictureURLonDB(
        context: context,
        userId: profileInfo.userProfileData.userId,
        newPictureURL: certificatePictureURL,
        isProfilePicture: false);
  }

  @override
  void initState() {
    super.initState();

    profileInfo = Provider.of<AuthProvider>(context, listen: false);
    generalInfo = Provider.of<CommonDataProvider>(context, listen: false);

    textEditingController1 = TextEditingController(
        text: profileInfo.userProfileData.userAccountName);
    textEditingController2 =
        TextEditingController(text: generalInfo.generalInfoData.adminEmail);

    for (int i = 0;
        i < generalInfo.sellerPointsInfo.sellerPointsTowns.length;
        i++) {
      listOfControllers.add(TextEditingController(
          text: generalInfo.sellerPointsInfo.sellerPointsTowns[i]));
      listOfControllers.add(TextEditingController(
          text: generalInfo.sellerPointsInfo.sellerPointsStreets[i]));
    }
  }

  @override
  void dispose() {
    super.dispose();
    textEditingController1.dispose();
    textEditingController2.dispose();

    for (var controller in listOfControllers) {
      controller.dispose();
    }
  }
  //
  //
}
