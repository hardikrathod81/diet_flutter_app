import 'package:bloc/bloc.dart';
import 'package:diet_app/BLoC/bloc/api_calling_model.dart';
import 'package:equatable/equatable.dart';
import 'package:http/http.dart' as http;

part 'api_calling_event.dart';
part 'api_calling_state.dart';

class ApiCallingBloc extends Bloc<ApiCallingEvent, ApiCallingState> {
  ApiCallingBloc() : super(ApiCallingLoadingState()) {
    on<ApiCallingLoadEvent>((event, emit) async {
      try {
        emit(ApiCallingLoadingState());

        final responce = await http
            .get(Uri.parse('https://jsonplaceholder.typicode.com/posts'));

        if (responce.statusCode == 200) {
          emit(ApiCallingLoadedState(postModelFromJson(responce.body)));
        } else {
          throw Exception('faild load Api');
        }
      } catch (e) {
        emit(ApiCallingErrorState(e.toString()));
      }
    });
  }
}
