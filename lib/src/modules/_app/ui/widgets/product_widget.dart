import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:image_fade/image_fade.dart';
import 'package:simple_products_app/src/modules/_app/models/entities/product.dart';

class ProductWidget extends StatelessWidget {
  final Product product;

  const ProductWidget({
    super.key,
    required this.product,
  });

  @override
  Widget build(BuildContext context) {
    return IntrinsicHeight(
      child: Row(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(10.r),
            child: ImageFade(
              height: 90.h,
              width: 80.h,
              fit: BoxFit.cover,
              image: FileImage(
                File(product.images!.first),
              ),
              duration: const Duration(milliseconds: 900),
              syncDuration: const Duration(milliseconds: 150),
              alignment: Alignment.center,
              loadingBuilder: (context, progress, chunkEvent) => Center(
                child: SizedBox(
                  width: 15.h,
                  height: 15.h,
                  child: CircularProgressIndicator(
                    strokeWidth: 1,
                    color: Theme.of(context).primaryColor,
                  ),
                ),
              ),
              errorBuilder: (context, error) => Center(
                child: Icon(
                  Icons.broken_image_rounded,
                  color: Colors.black,
                  size: 25.h,
                ),
              ),
            ),
          ),
          15.horizontalSpace,
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  product.name!,
                  style: TextStyle(
                    fontSize: 15.sp,
                  ),
                ),
                Row(
                  children: [
                    Text(
                      '${product.price} ',
                      style: TextStyle(
                        fontSize: 15.sp,
                        color: Theme.of(context).primaryColor,
                      ),
                    ),
                    Text(
                      'دولار',
                      style: TextStyle(
                        fontSize: 12.sp,
                        color: Colors.black,
                      ),
                    ),
                  ],
                ),
                Container(
                  padding:
                      EdgeInsets.symmetric(vertical: 6.h, horizontal: 12.w),
                  decoration: BoxDecoration(
                    color: const Color(0xffEEEEEE),
                    borderRadius: BorderRadius.circular(8.r),
                  ),
                  child: Text(
                    product.storeName!,
                    style: TextStyle(
                      fontSize: 11.sp,
                      color: const Color(0xffA1A1A1),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
