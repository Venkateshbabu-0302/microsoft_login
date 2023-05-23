import 'dart:async';
import 'dart:io';
//
import 'package:bloc/bloc.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/foundation.dart';

import 'document_picker_state.dart';

part 'document_picker_event.dart';
//
// class DocumentPickerBloc extends Bloc<DocumentPickerEvent, DocumentPickerState> {
//   DocumentPickerBloc() : super(DocumentPickerInitial());
//
//   @override
//   Stream<DocumentPickerState> mapEventToState(DocumentPickerEvent event) async* {
//     if (event is DocumentPickerPickDocuments) {
//       try {
//         final result = await FilePicker.platform.pickFiles(
//           type: FileType.custom,
//           allowedExtensions: ['pdf', 'doc', 'docx'],
//           allowMultiple: true,
//         );
//         if (result != null) {
//           final filePaths = result.paths.map((path) => File(path!)).toList();
//           yield DocumentPickerDocumentsPicked(filePaths: filePaths);
//         }
//       } catch (e) {
//         yield DocumentPickerError(error: 'An error occurred while picking documents.');
//       }
//     }
//   }
// }


class DocumentPickerBloc extends Bloc<DocumentPickerEvent, DocumentPickerState> {
  DocumentPickerBloc() : super(DocumentPickerInitial()) {
    on<DocumentPickerPickDocuments>((event, emit) async {
      final result = await FilePicker.platform.pickFiles(
        type: FileType.custom,
        allowedExtensions: ['pdf', 'doc', 'docx'],
        allowMultiple: true,
      );
      if (result != null) {
        final files = result.paths.map((path) => File(path!)).toList();
        emit(DocumentPickerDocumentsPicked(files: files));
      }
    });
  }
}
