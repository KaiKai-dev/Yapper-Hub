// import 'package:flutter/material.dart';

// extension FilledButtonExtension on FilledButton {

//   FilledButton _copyWith({
//     void Function()? onPressed,
//     void Function()? onLongPress,
//     void Function(bool)? onHover,
//     void Function(bool)? onFocusChange,
//     ButtonStyle? style,
//     FocusNode? focusNode,
//     bool? autofocus,
//     Clip? clipBehavior,
//     WidgetStatesController? statesController,
//     Widget? child,
//   }) => FilledButton(
//     onPressed: onPressed ?? this.onPressed,
//     onLongPress: onLongPress ?? this.onLongPress,
//     onHover: onHover ?? this.onHover,
//     onFocusChange: onFocusChange ?? this.onFocusChange,
//     style: style ?? this.style,
//     focusNode: focusNode ?? this.focusNode,
//     autofocus: autofocus ?? this.autofocus,
//     clipBehavior: clipBehavior ?? this.clipBehavior,
//     statesController: statesController ?? this.statesController,
//     child: child ?? this.child,
//   );

//   Widget get neutral => Builder(
//     builder: (context){
//       final theme = Theme.of(context);

//       return _copyWith(
//         style: FilledButton.styleFrom(
//           backgroundColor: theme.colorScheme.surfaceContainer,
//           side: BorderSide(
//             color: 
//           ) 
//         )
//       );
//     }
//   );
// }