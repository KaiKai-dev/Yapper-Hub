import 'package:chat_app/core/constants/months.dart';
import 'package:chat_app/features/data/providers/signup.provider.dart';
import 'package:chat_app/core/services/datetime.service.dart';
import 'package:chat_app/features/domain/models/date.data.model/date.data.model.dart';
import 'package:chat_app/core/widgets/inputs/app_dropdown.widget.dart';
import 'package:chat_app/core/widgets/gap.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class SignupBirthdayScreen extends ConsumerStatefulWidget {
  const SignupBirthdayScreen({super.key});

  @override
  ConsumerState<SignupBirthdayScreen> createState() => _SignupBirthdayScreenState();
}

class _SignupBirthdayScreenState extends ConsumerState<SignupBirthdayScreen> {

  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      if(ref.read(signupProvider).birthdate != null) return;
      
      await Future.delayed(Durations.extralong4);
      ref
          .read(signupProvider.notifier)
          .updateBirthdateTo(DateDataModel.initial());
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final provider = ref.watch(signupProvider);
    final notifier = ref.read(signupProvider.notifier);
    
    if(provider.birthdate == null){
      return Center(
        child: CircularProgressIndicator()
      );
    }

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
              onSelected: (value) => notifier.updateBirthdateTo(
                provider.birthdate!.copyWith(year: value)
              ),
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
                    onSelected: (value) => notifier.updateBirthdateTo(
                      provider.birthdate!.copyWith(month: value)
                    ),
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
                    onSelected: (value) => notifier.updateBirthdateTo(
                      provider.birthdate!.copyWith(date: value)
                    ),
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
