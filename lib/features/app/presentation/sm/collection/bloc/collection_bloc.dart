import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:ecowash/features/app/domain/collection_repo.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

import '../../../../../../core/di/service_locator.dart';
import '../../../../data/model/collection/create_collection_payload.dart';
import '../../../../data/model/collection/get_collection_model.dart';

part 'collection_event.dart';
part 'collection_state.dart';

// Collection BLoC
class CollectionBloc extends Bloc<CollectionEvent, CollectionState> {
  final collectionRepo = Di.getIt<CollectionRepo>();

  CollectionBloc() : super(CollectionInitial()) {
    on<GetCollectionsEvent>(_onGetCollections);
  }

  Future<void> _onGetCollections(
      GetCollectionsEvent event, Emitter<CollectionState> emit) async {
    emit(CollectionLoading());
    final result = await collectionRepo.getCollections();

    result.fold(
      (failure) => emit(CollectionError(error: failure.message)),
      (collections) => emit(CollectionsLoaded(collections: collections)),
    );
  }
}
