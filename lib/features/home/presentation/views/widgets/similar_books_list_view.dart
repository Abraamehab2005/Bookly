import 'package:bookly/core/widgets/custom_loading_indicator.dart';
import 'package:bookly/features/home/presentation/manger/similar_books_cubit/similar_books_cubit.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'custom_book_image.dart';

class SimilarBooksListView extends StatelessWidget {
  const SimilarBooksListView({super.key});
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SimilarBooksCubit, SimilarBooksState>(
  builder: (context, state) {
    if (state is SimilarBooksSuccess) {
      return SizedBox(
        height: MediaQuery.of(context).size.height * 0.15,
        child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemBuilder: (BuildContext context, int index) {
            return const Padding(
              padding: EdgeInsets.symmetric(horizontal: 5.0),
              child: CustomBookImage(
                imageUrl: 'https://picsum.photos/200/300',
              ),
            );
          },
        ),
      );
    }else if(state is SimilarBooksFailer){
      return Text(state.errMessage);
    }else {
      return CustomLoadingIndicator();
    }
  },
);
  }
}