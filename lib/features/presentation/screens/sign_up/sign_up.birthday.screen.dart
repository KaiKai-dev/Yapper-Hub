import 'package:chat_app/core/extra_data/months.dart';
import 'package:chat_app/features/data/provider/signup.data.provider.dart';
import 'package:chat_app/features/data/service/datetime.service.dart';
import 'package:chat_app/features/presentation/components/inputs/app_dropdown.widget.dart';
import 'package:chat_app/features/presentation/components/gap.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class SignupBirthdayScreen extends ConsumerWidget {
  const SignupBirthdayScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = Theme.of(context);
    final provider = ref.watch(signupProvider);
    final notifier = ref.read(signupProvider.notifier);
    

    return Form(
      key: provider.birthdayFormKey,
      child: Container(
        color: theme.colorScheme.surface,
        width: double.infinity,
        child: Column(
          crossAxisAlignment: .stretch,
          children: [
            Gap(height: 16),
            Text("When is your birthday?", style: theme.textTheme.displaySmall),
            Gap(height: 8),
            Text(
              "Your profile won't show this information",
              style: theme.textTheme.titleSmall,
            ),
            Gap(height: 40),

            // INPUTS
            AppDropdown<int>(
              title: "YEAR",
              initialValue: provider.birthdate!.year!,
              dropdownMenuEntries: DatetimeService.instance.validYearList
                  .map(
                    (year) => DropdownMenuEntry(
                      value: year,
                      label: year.toString(),
                    ),
                  )
                  .toList(),
              onSelected: (value) => notifier.updateBirthdate(year: value),
            ),
            Gap(height: 20,),

            Row(
              spacing: 12,
              children: [
                Expanded(
                  flex: 7,
                  child: AppDropdown<String>(
                    title: "MONTH",
                    initialValue: provider.birthdate!.month!,
                    menuController: MenuController(),
                    dropdownMenuEntries: months
                        .map((month) => DropdownMenuEntry(value: month, label: month))
                        .toList(),
                    onSelected: (value) => notifier.updateBirthdate(month: value),
                  ),
                ),

                Expanded(
                  flex: 3,
                  child: AppDropdown<int>(
                    title: "DATE",
                    initialValue: 1,
                    dropdownMenuEntries: DatetimeService.instance
                        .dates(
                          month: provider.birthdate!.month!, year: provider.birthdate!.year!,
                        ).map(
                          (date) => DropdownMenuEntry<int>(
                            value: date,
                            label: date.toString()
                          )
                        ).toList(),
                    onSelected: (value) => notifier.updateBirthdate(date: value),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
