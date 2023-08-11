import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:simple_products_app/src/config/core/enums.dart';
import 'package:simple_products_app/src/config/helpers.dart';
import 'package:simple_products_app/src/managers/navigation_manager.dart';
import 'package:simple_products_app/src/modules/_app/ui/widgets/custom_button_widget.dart';

class SelectOptionWidget extends StatefulWidget {
  final String title;
  final List<dynamic> options;
  final Function(List<dynamic> values) onOptionSelected;
  final bool isMultiSelect;

  const SelectOptionWidget({
    Key? key,
    required this.title,
    required this.options,
    required this.onOptionSelected,
    this.isMultiSelect = false,
  }) : super(key: key);

  @override
  State<SelectOptionWidget> createState() => _SelectOptionWidgetState();
}

class _SelectOptionWidgetState extends State<SelectOptionWidget> {
  late List<dynamic>? _selectedValues = widget.options
      .where((e) => e['isSelected'])
      .map((e) => e['value'])
      .toList();

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.5,
      padding: EdgeInsets.all(16.h),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(14.r),
        ),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Row(
            children: [
              const Spacer(),
              Text(widget.title),
              const Spacer(),
              InkWell(
                onTap: () {
                  N.back();
                },
                child: CircleAvatar(
                  radius: 12.r,
                  backgroundColor: Colors.grey.shade200,
                  child: Icon(
                    Icons.close,
                    color: const Color(0xff818C99),
                    size: 14.h,
                  ),
                ),
              ),
            ],
          ),
          SizedBox(
            height: 15.h,
          ),
          Expanded(
            child: ListView.separated(
              itemCount: widget.options.length,
              separatorBuilder: (_, index) => SizedBox(
                height: 10.h,
              ),
              itemBuilder: (_, index) => InkWell(
                onTap: () {
                  setState(() {
                    if (widget.isMultiSelect) {
                      if (_selectedValues!
                          .contains(widget.options[index]['value'])) {
                        _selectedValues!.remove(widget.options[index]['value']);
                      } else {
                        _selectedValues!.add(widget.options[index]['value']);
                      }
                    } else {
                      _selectedValues!.clear();
                      _selectedValues!.add(widget.options[index]['value']);
                    }
                  });
                },
                child: Container(
                  padding: EdgeInsets.all(8.h),
                  child: Row(
                    children: [
                      Expanded(
                        child: Text(
                          widget.options[index]['title'],
                        ),
                      ),
                      _selectedValues!.contains(widget.options[index]['value'])
                          ? CircleAvatar(
                              backgroundColor: Theme.of(context).primaryColor,
                              radius: 12.r,
                              child: Icon(
                                Icons.check,
                                color: Colors.white,
                                size: 15.h,
                              ),
                            )
                          : CircleAvatar(
                              radius: 12.r,
                              backgroundColor: Colors.transparent,
                            ),
                    ],
                  ),
                ),
              ),
            ),
          ),
          SizedBox(
            height: 5.h,
          ),
          CustomButtonWidget(
            title: 'اختيار',
            onTap: () {
              if (_selectedValues!.isEmpty) {
                Helpers.showMessage(
                    text: 'الرجاء الاختيار للاستمرار',
                    messageType: MessageType.failureMessage);
                return;
              }
              N.back();
              widget.onOptionSelected(_selectedValues!);
            },
          ),
        ],
      ),
    );
  }
}
