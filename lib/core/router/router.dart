import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'router.g.dart';

@riverpod
GoRouter router(RouterRef ref) {
  return GoRouter(
    routes: [
      GoRoute(
        path: '/',
        pageBuilder: (context, state) => const MaterialPage(
          child: Scaffold(
            body: Center(
              child: Text('Hello World'),
            ),
          ),
        ),
        routes: [
          GoRoute(
            name: 'example',
            path: 'example/:param',
            pageBuilder: (context, state) => MaterialPage(
              child: Scaffold(
                body: Center(
                  child: Text(state.pathParameters['param']!),
                ),
              ),
            ),
          ),
        ],
      ),
    ],
  );
}
