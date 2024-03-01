import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mis_project/app/routes/app_pages.dart';

import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        alignment: Alignment.topCenter,
        children: [
          Positioned(
            top: 0,
            right: 0,
            child: SvgPicture.asset("assets/vectors/auth/auth_bg_1.svg"),
          ),
          Positioned(
            top: 0,
            right: 0,
            child: SvgPicture.asset("assets/vectors/auth/auth_bg_2.svg"),
          ),
          SafeArea(
            bottom: true,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.only(
                      right: 30,
                      top: 20,
                      left: 30,
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Hello,",
                          style: GoogleFonts.poppins(
                            fontSize: 35,
                            fontWeight: FontWeight.bold,
                            height: 1.2,
                            color: Get.theme.colorScheme.onBackground,
                          ),
                        ),
                        Text(
                          "Pratham.",
                          style: GoogleFonts.poppins(
                            fontSize: 35,
                            fontWeight: FontWeight.bold,
                            height: 1.2,
                            color: Get.theme.colorScheme.primary,
                          ),
                        ),
                        Expanded(
                          child: Card(
                            margin: const EdgeInsets.only(
                              top: 15,
                              bottom: 25,
                            ),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(15),
                            ),
                            shadowColor:
                                Get.theme.colorScheme.onBackground.withOpacity(
                              0.7,
                            ),
                            elevation: 5,
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(15),
                              child: Scaffold(
                                appBar: AppBar(
                                  title: Text(
                                    "Companies",
                                    style: GoogleFonts.poppins(
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold,
                                      color: Get.theme.colorScheme.onPrimary,
                                    ),
                                  ),
                                  backgroundColor:
                                      Get.theme.colorScheme.primary,
                                  elevation: 0,
                                  centerTitle: true,
                                  automaticallyImplyLeading: false,
                                ),
                                floatingActionButton: FloatingActionButton(
                                  onPressed: () {
                                    Get.toNamed(Routes.COMPANY_FORM);
                                  },
                                  child: const Icon(Icons.add),
                                ),
                                body: ListView.separated(
                                  itemCount: 10,
                                  separatorBuilder: (context, index) {
                                    return const Divider(
                                      height: 0.5,
                                      thickness: 0.5,
                                    );
                                  },
                                  itemBuilder: (context, index) {
                                    return ListTile(
                                      onTap: () {
                                        showDialog(
                                          context: context,
                                          builder: (context) {
                                            return Dialog(
                                              shape: RoundedRectangleBorder(
                                                borderRadius:
                                                    BorderRadius.circular(15),
                                              ),
                                              surfaceTintColor: Colors.white,
                                              child: Padding(
                                                padding:
                                                    const EdgeInsets.all(8.0),
                                                child: Column(
                                                  mainAxisSize:
                                                      MainAxisSize.min,
                                                  children: [
                                                    Icon(
                                                      CupertinoIcons.option,
                                                      color: Get.theme
                                                          .colorScheme.primary,
                                                    ),
                                                    Text(
                                                      "Company ${index + 1}",
                                                      style:
                                                          GoogleFonts.poppins(
                                                        fontSize: 20,
                                                        fontWeight:
                                                            FontWeight.w600,
                                                      ),
                                                    ),
                                                    ElevatedButton(
                                                      onPressed: () {},
                                                      child: Text("Submit"),
                                                    )
                                                  ],
                                                ),
                                              ),
                                            );
                                          },
                                        );
                                      },
                                      title: Text(
                                        "Company ${index + 1}",
                                        style: GoogleFonts.poppins(
                                          fontSize: 18,
                                          fontWeight: FontWeight.bold,
                                          color: Get.theme.colorScheme.primary,
                                        ),
                                      ),
                                      subtitle: Text(
                                        "Transport Name: Company ${index + 1}",
                                        style: GoogleFonts.poppins(
                                          fontSize: 14,
                                        ),
                                      ),
                                    );
                                  },
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                SvgPicture.asset(
                  "assets/vectors/home/home_bg_1.svg",
                  width: Get.width,
                  fit: BoxFit.cover,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
