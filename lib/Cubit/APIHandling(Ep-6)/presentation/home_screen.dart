import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:socials/Cubit/APIHandling(Ep-6)/logic/Cubit/PostCubit/post_cubit.dart';

import '../logic/Cubit/PostCubit/post_state.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('API Handler'),
      ),
      body: SafeArea(
          child: BlocBuilder<PostCubit, PostState>(
          builder: (context, state) {
            if(state is PostLoadingState) {
              return Center(
                child: CircularProgressIndicator(),
              );
            }
            
            else if(state is PostLoadedState) {
              return ListView.builder(
                  itemCount: state.posts.length,
                  itemBuilder: (context, index) {
                    return ListTile(
                      contentPadding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
                      leading: CircleAvatar(
                        child: Text(state.posts[index].userId.toString()),
                      ),
                      title: Text(
                        state.posts[index].title!,
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      subtitle: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(height: 4.0),
                          Text('ID: ${state.posts[index].id.toString()}'),
                          SizedBox(height: 4.0),
                          Text(state.posts[index].body!),
                        ],
                      ),
                      isThreeLine: true,
                    );

                  }
              );
            }

            else if(state is PostErrorState) {
              return Center(
                child: Container(
                  width: 300,
                  child: Center(
                    child: Text(state.error),
                  ),
                ),
              );
            }
            return Container();
          }
        )
      ),
    );
  }
}