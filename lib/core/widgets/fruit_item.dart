import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruit_hub/core/entities/product_entity.dart';
import 'package:fruit_hub/core/utils/app_colors.dart';
import 'package:fruit_hub/core/utils/app_text_styles.dart';

import '../../features/home/presentation/cubits/cart_cubit/cart_cubit.dart';
import 'custom_network_image.dart';

class FruitItem extends StatelessWidget {
  const FruitItem({super.key, required this.productEntity});

  final ProductEntity productEntity;
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: ShapeDecoration(
        color: Color(0xFFF3F5F7),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4)),
      ),
      child: Stack(
        children: [
          Positioned(
            top: 0,
            right: 0,
            child: IconButton(
              onPressed: () {},
              icon: Icon(Icons.favorite_border_outlined),
            ),
          ),
          Positioned.fill(
              child: Column(
            children: [
              SizedBox(height: 16),
              productEntity.imageUrl != null
                  ? Flexible(
                      child:
                          CustomNetworkImage(imageUrl: productEntity.imageUrl!),
                    )
                  : Container(
                      color: Colors.grey,
                      height: 100,
                      width: 100,
                    ),
              SizedBox(height: 12),
              ListTile(
                title: Text(
                  productEntity.name,
                  textAlign: TextAlign.right,
                  style: TextStyles.bold13,
                ),
                subtitle: Text.rich(
                  TextSpan(
                    children: [
                      TextSpan(
                        text: '${productEntity.price}جنية ',
                        style: TextStyles.bold13.copyWith(
                          color: AppColors.secondaryColor,
                        ),
                      ),
                      TextSpan(
                        text: '/',
                        style: TextStyles.bold13.copyWith(
                          color: AppColors.lightSecondaryColor,
                        ),
                      ),
                      TextSpan(
                        text: 'كيلو',
                        style: TextStyles.semiBold13.copyWith(
                          color: AppColors.lightSecondaryColor,
                        ),
                      ),
                    ],
                  ),
                  textAlign: TextAlign.right,
                ),
                trailing: GestureDetector(
                  onTap: () {
                    context.read<CartCubit>().addProduct(productEntity);
                  },
                  child: CircleAvatar(
                    backgroundColor: AppColors.primaryColor,
                    child: Icon(
                      Icons.add,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ],
          ))
        ],
      ),
    );
  }
}
