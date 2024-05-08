import 'package:challenge2/theme/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:challenge2/providers.dart';
import 'package:challenge2/widgets/widgets.dart';
import 'package:challenge2/data/data.dart';

class CommonInfoField extends ConsumerWidget {
  const CommonInfoField({super.key, required this.selectedUser});

  final Infos selectedUser;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    //final selectedUser = ref.watch(userSelectedProvider);
    return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CommonText(title: 'Nome completo', size: 12,),
        CommonText(title: selectedUser.name, size: 22),
        CommonText(title: 'Contato', size: 12,),
        CommonText(title: selectedUser.contact, size: 22),
        CommonText(title: 'Contato reserva', size: 12,),
        CommonText(title: selectedUser.contact, size: 22,),
        CommonText(title: 'E-mail reserva', size: 12,),
        CommonText(title: selectedUser.email, size: 22),
      ],
    );
  }
}
