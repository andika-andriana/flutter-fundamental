import 'package:flutter_application_1/model/list_articles_model.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ListArticlesEvent {}

abstract class ListArticlesState {}

class ListUnitilized extends ListArticlesState {}

class ListLoaded extends ListArticlesState {
  List<ListArticlesModel> lists;
  bool hasReachedMax;

  ListLoaded({required this.lists, required this.hasReachedMax});

  ListLoaded copyWith({
    required List<ListArticlesModel> lists,
    required bool hasReachedMax,
  }) {
    return ListLoaded(
      lists: lists,
      hasReachedMax: hasReachedMax,
    );
  }
}

class ListArtclesBloc extends Bloc<ListArticlesEvent, ListArticlesState> {
  ListArtclesBloc() : super(ListUnitilized()) {
    List<ListArticlesModel> lists;
    on(
      (event, emit) async {
        if (state is ListUnitilized) {
          lists = await ListArticlesModel.getListFromApi(
            0.toString(),
            10.toString(),
          );
          emit(
            ListLoaded(
              lists: lists,
              hasReachedMax: false,
            ),
          );
        } else {
          ListLoaded listLoaded = state as ListLoaded;
          lists = await ListArticlesModel.getListFromApi(
            listLoaded.lists.length.toString(),
            10.toString(),
          );
          emit(
            (lists.isEmpty)
                ? listLoaded.copyWith(
                    lists: listLoaded.lists,
                    hasReachedMax: true,
                  )
                : ListLoaded(
                    lists: listLoaded.lists + lists,
                    hasReachedMax: false,
                  ),
          );
        }
      },
    );
  }
}
