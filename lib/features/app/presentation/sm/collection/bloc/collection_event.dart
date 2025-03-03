part of 'collection_bloc.dart';

@immutable
abstract class CollectionEvent extends Equatable {
  @override
  List<Object?> get props => [];
}

class GetCollectionsEvent extends CollectionEvent {}

class CreateCollectionEvent extends CollectionEvent {
  final CreateCollectionModel payload;

  CreateCollectionEvent({required this.payload});

  @override
  List<Object?> get props => [payload];
}

class UpdateCollectionEvent extends CollectionEvent {
  final String id;

  UpdateCollectionEvent({required this.id});

  @override
  List<Object?> get props => [id];
}

class DeleteCollectionEvent extends CollectionEvent {
  final String id;

  DeleteCollectionEvent({required this.id});

  @override
  List<Object?> get props => [id];
}
