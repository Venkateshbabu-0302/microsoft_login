import 'dart:io';

//
// abstract class DocumentPickerState {}
//
// class DocumentPickerInitial extends DocumentPickerState {}
//
// class DocumentPickerDocumentsPicked extends DocumentPickerState {
//   final List<File> filePaths;
//
//   DocumentPickerDocumentsPicked({required this.filePaths});
// }
// class DocumentPickerError extends DocumentPickerState {
//   final String error;
//
//   DocumentPickerError({required this.error});
// }



abstract class DocumentPickerState {}

class DocumentPickerInitial extends DocumentPickerState {}

class DocumentPickerDocumentsPicked extends DocumentPickerState {
  final List<File> files;

  DocumentPickerDocumentsPicked({required this.files});
}