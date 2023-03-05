import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:notes_app/constans.dart';
import 'package:notes_app/models/note_model.dart';
part 'add_note_state.dart';

class NotesCubit extends Cubit<AddNoteState> {
  NotesCubit() : super(AddNoteInitial());

  addNot(NoteModel note) async {
    emit(AddNoteLoading());

    try {
      var notesbox = Hive.box<NoteModel>(kNotesBox);
      emit(AddNoteSuccess());
      await notesbox.add(note);
    } catch (e) {
      AddNoteFailure(e.toString());
    }
  }
}
