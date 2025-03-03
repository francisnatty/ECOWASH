part of 'collection_bloc.dart';

@immutable
abstract class CollectionState extends Equatable {
  @override
  List<Object?> get props => [];
}

class CollectionInitial extends CollectionState {}

class CollectionLoading extends CollectionState {}

class CollectionsLoaded extends CollectionState {
  final GetCollectionModel collections;

  CollectionsLoaded({required this.collections});

  @override
  List<Object?> get props => [collections];
}

class CollectionActionSuccess extends CollectionState {
  final String message;

  CollectionActionSuccess({required this.message});

  @override
  List<Object?> get props => [message];
}

class CollectionError extends CollectionState {
  final String error;

  CollectionError({required this.error});

  @override
  List<Object?> get props => [error];
}
