import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'documentPicker/document_picker_bloc.dart';
import 'documentPicker/document_picker_state.dart';

class DocumentPickerScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Document Picker'),
      ),
      body: BlocBuilder<DocumentPickerBloc, DocumentPickerState>(
        builder: (context, state) {
          if (state is DocumentPickerDocumentsPicked) {
            return Column(
              children: [
                Expanded(
                  child: ListView.builder(
                    itemCount: state.files.length,
                    itemBuilder: (context, index) {
                      final file = state.files[index];
                      return ListTile(
                        title: Text(file.path),
                        leading: Icon(Icons.insert_drive_file),
                      );
                    },
                  ),
                ),
                ElevatedButton(
                  onPressed: () {
                    context.read<DocumentPickerBloc>().add(DocumentPickerPickDocuments());
                  },
                  child: Text('Pick Documents'),
                ),
              ],
            );
          } else {
            return Center(
              child: ElevatedButton(
                onPressed: () {
                  context.read<DocumentPickerBloc>().add(DocumentPickerPickDocuments());
                },
                child: Text('Pick Documents'),
              ),
            );
          }
        },
      ),
    );
  }
}