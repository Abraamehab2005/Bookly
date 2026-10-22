import 'package:bookly/core/utils/service_locator.dart';
import 'package:bookly/features/home/data/models/book_model/book_model.dart';
import 'package:bookly/features/home/data/repos/home_repo_implementation.dart';
import 'package:bookly/features/home/presentation/manger/similar_books_cubit/similar_books_cubit.dart';
import 'package:bookly/features/home/presentation/views/book_details_view.dart';
import 'package:bookly/features/home/presentation/views/home_view.dart';
import 'package:bookly/features/splash/presentation/view/splash_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../features/search/presentation/view/search_view.dart';

abstract class AppRouters {
  static const kHomeView = '/homeView';
  static const kBookDetailsView = '/bookDetailsView';
  static const kSearchView = '/searchView';
  static final GoRouter router = GoRouter(
    routes: <RouteBase>[
      GoRoute(
        path: '/',
        builder: (BuildContext context, GoRouterState state) {
          return const SplashView();
        },
        routes: <RouteBase>[
          GoRoute(
            path: kHomeView,
            builder: (BuildContext context, GoRouterState state) {
              return const HomeView();
            },
          ),
          GoRoute(
            path: kBookDetailsView,
            builder: (BuildContext context, GoRouterState state) {
              return BlocProvider(
                  create: (context) => SimilarBooksCubit(homeRepo: getIt.get<HomeRepoImpelmention>()),
                  child:  BookDetailsView(
                    bookModel: state.extra as BookModel,
                  ));
            },
          ),  
          GoRoute(
            path: kSearchView,
            builder: (BuildContext context, GoRouterState state) {
              return const SearchView();
            },
          ),
        ],
      ),
    ],
  );
}
