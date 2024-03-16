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
                          "Good Morning.",
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
                                body: Obx(
                                  () => controller.isLoading.value
                                      ? const Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            CupertinoActivityIndicator(
                                              radius: 20,
                                            ),
                                            SizedBox(height: 20),
                                            Center(
                                              child: Text(
                                                "Loading...",
                                                style: TextStyle(
                                                  fontSize: 20,
                                                  fontWeight: FontWeight.bold,
                                                ),
                                              ),
                                            ),
                                          ],
                                        )
                                      : ListView.builder(
                                          itemCount: controller.clients.length,
                                          itemBuilder: (context, index) {
                                            return Column(
                                              children: [
                                                ListTile(
                                                  onTap: () {
                                                    showDialog(
                                                      context: context,
                                                      builder: (context) {
                                                        return Dialog(
                                                          shape:
                                                              RoundedRectangleBorder(
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        15),
                                                          ),
                                                          surfaceTintColor:
                                                              Colors.white,
                                                          child: Stack(
                                                            fit: StackFit
                                                                .passthrough,
                                                            children: [
                                                              Positioned(
                                                                right: 5,
                                                                top: 5,
                                                                child:
                                                                    IconButton(
                                                                  onPressed:
                                                                      () {
                                                                    Get.back();
                                                                  },
                                                                  iconSize: 20,
                                                                  icon:
                                                                      const Icon(
                                                                    CupertinoIcons
                                                                        .clear,
                                                                  ),
                                                                ),
                                                              ),
                                                              Padding(
                                                                padding:
                                                                    const EdgeInsets
                                                                        .symmetric(
                                                                  horizontal:
                                                                      30,
                                                                  vertical: 30,
                                                                ),
                                                                child: Column(
                                                                  mainAxisSize:
                                                                      MainAxisSize
                                                                          .min,
                                                                  children: [
                                                                    Text(
                                                                      "Actions",
                                                                      style: GoogleFonts
                                                                          .poppins(
                                                                        fontSize:
                                                                            25,
                                                                        fontWeight:
                                                                            FontWeight.w600,
                                                                      ),
                                                                    ),
                                                                    Text(
                                                                      "You can perform the following actions on the company.",
                                                                      textAlign:
                                                                          TextAlign
                                                                              .center,
                                                                      style: GoogleFonts
                                                                          .poppins(
                                                                        fontSize:
                                                                            14,
                                                                      ),
                                                                    ),
                                                                    const SizedBox(
                                                                      height:
                                                                          20,
                                                                    ),
                                                                    Row(
                                                                      children: [
                                                                        Expanded(
                                                                          child:
                                                                              ElevatedButton(
                                                                            onPressed:
                                                                                () {},
                                                                            child:
                                                                                const Text(
                                                                              "Track Vehicle",
                                                                            ),
                                                                          ),
                                                                        ),
                                                                        const SizedBox(
                                                                          width:
                                                                              10,
                                                                        ),
                                                                        Expanded(
                                                                          child:
                                                                              ElevatedButton(
                                                                            onPressed:
                                                                                () {},
                                                                            style:
                                                                                ElevatedButton.styleFrom(
                                                                              padding: EdgeInsets.zero,
                                                                            ),
                                                                            child:
                                                                                const Text(
                                                                              "Add/Edit Ledger",
                                                                            ),
                                                                          ),
                                                                        ),
                                                                      ],
                                                                    ),
                                                                    const SizedBox(
                                                                        height:
                                                                            10),
                                                                    TextButton(
                                                                      onPressed:
                                                                          () async {
                                                                        Get.back();
                                                                        final client =
                                                                            await Get.toNamed(
                                                                          Routes
                                                                              .CLIENT_FORM,
                                                                          arguments:
                                                                              controller.clients[index],
                                                                        );
                                                                        if (client !=
                                                                            null) {
                                                                          controller.clients[index] =
                                                                              client;
                                                                          controller
                                                                              .clients
                                                                              .refresh();
                                                                        }
                                                                      },
                                                                      child:
                                                                          const Text(
                                                                        "View Details",
                                                                      ),
                                                                    ),
                                                                  ],
                                                                ),
                                                              ),
                                                            ],
                                                          ),
                                                        );
                                                      },
                                                    );
                                                  },
                                                  title: Text(
                                                    "${index + 1}. ${controller.clients[index].name}",
                                                    style: GoogleFonts.poppins(
                                                      fontSize: 18,
                                                    ),
                                                  ),
                                                  minVerticalPadding: 0,
                                                  contentPadding:
                                                      const EdgeInsets
                                                          .symmetric(
                                                    horizontal: 20,
                                                  ),
                                                ),
                                                Divider(
                                                  height: .5,
                                                  thickness: .5,
                                                  color: Colors.grey.shade500,
                                                ),
                                              ],
                                            );
                                          },
                                        ),
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
