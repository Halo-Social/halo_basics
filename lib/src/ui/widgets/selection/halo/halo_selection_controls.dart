import 'dart:io';

import 'package:flutter/widgets.dart';
import 'package:halo_basics/src/ui/widgets/selection/halo/android/selection_controls.dart' as android;
import 'package:halo_basics/src/ui/widgets/selection/halo/ios/selection_controls.dart' as ios;

typedef HandleCopy = void Function(TextSelectionDelegate delegate);

TextSelectionControls get haloTextSelectionControls =>
    Platform.isIOS ? ios.cupertinoTextSelectionControls : android.materialTextSelectionControls;

TextSelectionControls haloFeedTextSelectionControls(HandleCopy? handleCopy) =>
    Platform.isIOS ? ios.CupertinoTextSelectionControls(handleCopy) : android.MaterialTextSelectionControls(handleCopy);

String toolBarSelectLabel = "Select";
