import 'package:fifa/r.dart';
import 'package:fifa/src/common/extensions.dart';
import 'package:fifa/src/features/login/signup/cubit/signup_form_cubit.dart';
import 'package:fifa/src/features/login/signup/cubit/signup_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class DropdownDatePicker extends StatefulWidget {
  final int minYear;
  final int maxYear;

  const DropdownDatePicker({
    Key? key,
    required this.maxYear,
    required this.minYear,
  }) : super(key: key);

  @override
  _DropdownDatePickerState createState() => _DropdownDatePickerState();
}

class _DropdownDatePickerState extends State<DropdownDatePicker> {
  late final List<String> years = List<String>.generate(
    widget.maxYear - widget.minYear + 1,
    (index) => '${widget.minYear + index}',
  ).reversed.toList();

  late final Map<String, int> monthsMap = Map.fromEntries(List<MapEntry<String, int>>.generate(
    12,
    (index) => MapEntry((index + 1).toMonthAbbr, index + 1),
  ));

  late final months = monthsMap.keys.toList();

  @override
  Widget build(BuildContext context) {
    return BlocSelector<SignupFormCubit, SignupState, DateTime>(
      selector: (state) => state.formDate,
      builder: (context, selectedDate) {
        final days = List<String>.generate(
          selectedDate.getDaysInMonth(),
          (index) => '${index + 1}',
        );

        return DropdownButtonHideUnderline(
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              _DateDropdown(
                items: years,
                onChange: (newYear) {
                  if (selectedDate.year != int.parse(newYear!)) {
                    context.signupFormCubit.changeDate(
                      selectedDate.specialCopyWith(
                        year: int.parse(newYear),
                      ),
                    );
                  }
                },
                selectedValue: '${selectedDate.year}',
              ),
              const SizedBox(
                width: 8,
              ),
              _DateDropdown(
                items: months,
                onChange: (newMonth) {
                  if (selectedDate.month != monthsMap[newMonth]) {
                    context.signupFormCubit.changeDate(
                      selectedDate.specialCopyWith(
                        month: monthsMap[newMonth],
                      ),
                    );
                  }
                },
                selectedValue: months.firstWhere((key) => monthsMap[key] == selectedDate.month),
              ),
              const SizedBox(
                width: 8,
              ),
              _DateDropdown(
                items: days,
                onChange: (newDay) {
                  if (selectedDate.day != int.parse(newDay!)) {
                    context.signupFormCubit.changeDate(
                      selectedDate.specialCopyWith(
                        day: int.parse(newDay),
                      ),
                    );
                  }
                },
                selectedValue: '${selectedDate.day}',
              )
            ],
          ),
        );
      },
    );
  }
}

class _DateDropdown extends StatelessWidget {
  final List<String> items;
  final void Function(String? value) onChange;
  final String selectedValue;

  const _DateDropdown({
    Key? key,
    required this.items,
    required this.onChange,
    required this.selectedValue,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        padding: const EdgeInsets.only(left: 15),
        height: R.dimen.fieldsAndButtonsHeight,
        decoration: BoxDecoration(
            color: R.colors.textBoxBG,
            borderRadius: R.shapes.radius_4,
            border: Border.all(color: R.colors.inputBoxStroke)),
        child: DropdownButton<String>(
          items: items.map<DropdownMenuItem<String>>((item) {
            return DropdownMenuItem(
              value: item,
              child: Text(
                item,
                style: const TextStyle(color: Colors.white, fontSize: 13),
              ),
            );
          }).toList(),
          onChanged: onChange,
          value: selectedValue,
          isExpanded: true,
          iconEnabledColor: const Color(0xFFC4C4C4),
          dropdownColor: R.colors.textBoxBG,
          onTap: () => context.unfocusAll(),
        ),
      ),
    );
  }
}
