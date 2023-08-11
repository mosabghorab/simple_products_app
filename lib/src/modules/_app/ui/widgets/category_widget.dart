import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:image_fade/image_fade.dart';

class CategoryWidget extends StatelessWidget {
  final VoidCallback onTap;
  final String name;
  final String image;
  final bool isSelected;

  const CategoryWidget({
    super.key,
    required this.onTap,
    required this.name,
    required this.image,
    required this.isSelected,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 6.h, horizontal: 8.w),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10.r),
          border: Border.all(
            color: isSelected ? Theme.of(context).primaryColor : Colors.white,
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(10.r),
              child: ImageFade(
                height: 55.h,
                width: 70.h,
                fit: BoxFit.cover,
                image: NetworkImage(
                  image,
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
            15.verticalSpace,
            Text(
              name,
              overflow: TextOverflow.ellipsis,
            ),
          ],
        ),
      ),
    );
  }
}
