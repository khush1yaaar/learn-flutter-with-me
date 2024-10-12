import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:socials/Cubit/APIHandling(Ep-6)/data/Reposetories/post_reposetories.dart';
import 'package:socials/Cubit/APIHandling(Ep-6)/logic/Cubit/PostCubit/post_state.dart';

import '../../../data/Models/post_model.dart';

class PostCubit extends Cubit<PostState> {
  PostCubit() : super(PostLoadingState()){
    fetchPost();
  }

  PostReposetory postReposetory = PostReposetory();

  void fetchPost() async {
    try {
      List<PostModel> posts = await postReposetory.fetchPosts();
      emit(PostLoadedState(posts));
    }
    catch(e) {
      emit(PostErrorState(e.toString()));
    }
  }

}