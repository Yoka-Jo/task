// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:task/presentation/resources/assets_manager.dart';
import 'package:task/presentation/resources/colors_manager.dart';
import 'package:task/presentation/resources/strings_manager.dart';
import 'package:task/presentation/shared/components/build_text.dart';

import 'cubit/services_cubit.dart';

class ServiceGridItem {
  final String title;
  final String image;
  ServiceGridItem({
    required this.title,
    required this.image,
  });
}

class ServicesScreen extends StatefulWidget {
  const ServicesScreen({Key? key}) : super(key: key);

  @override
  State<ServicesScreen> createState() => _ServicesScreenState();
}

class _ServicesScreenState extends State<ServicesScreen> {
  final List<ServiceGridItem> items = [
    ServiceGridItem(title: AppStrings.cleanCars, image: IllustrationsAsset.car),
    ServiceGridItem(
        title: AppStrings.cleanBuilding, image: IllustrationsAsset.building),
    ServiceGridItem(
        title: AppStrings.rentingOilCars, image: IllustrationsAsset.oilTruck),
    ServiceGridItem(
        title: AppStrings.rentingCars, image: IllustrationsAsset.truck),
    ServiceGridItem(
        title: AppStrings.containersServices,
        image: IllustrationsAsset.containerCar),
    ServiceGridItem(
        title: AppStrings.maintenanceServices, image: IllustrationsAsset.gear),
  ];

  @override
  void initState() {
    super.initState();
    context.read<ServicesCubit>().getServices();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff04683A),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 50.0),
        child: Column(
          children: [
            Row(
              textDirection: TextDirection.rtl,
              children: [
                Image.asset(IconsAsset.arrow),
                const SizedBox(
                  width: 15.0,
                ),
                const BuildText(
                  text: AppStrings.mainServices,
                  textColor: AppColors.white,
                )
              ],
            ),
            Expanded(
              child: GridView.builder(
                itemCount: items.length,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    crossAxisSpacing: 10.0,
                    mainAxisSpacing: 10.0,
                    mainAxisExtent: 180.0),
                itemBuilder: (context, i) => Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10.0),
                    color: const Color(0xff2C864F),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset(
                        items[i].image,
                        color: AppColors.white,
                      ),
                      const SizedBox(
                        height: 15.0,
                      ),
                      BuildText(
                        text: items[i].title,
                        textColor: AppColors.white,
                        fontSize: 14.0,
                      )
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
