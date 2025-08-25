part of 'documents_cubit.dart';

sealed class DocumentsState extends Equatable {
  const DocumentsState();
}

final class DocumentsInitialState extends DocumentsState {
  const DocumentsInitialState();

  @override
  List<Object> get props => [];
}
