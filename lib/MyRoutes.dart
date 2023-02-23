import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'HomePage.dart';
import 'Widgets/Alphabets.dart';
import 'Widgets/DisplayScreen.dart';
import 'main.dart';

final GlobalKey<NavigatorState> _rootNavigatorKey =
    GlobalKey<NavigatorState>(debugLabel: 'root');
final GlobalKey<NavigatorState> _shellNavigatorKey =
    GlobalKey<NavigatorState>(debugLabel: 'shell');

class MyRoutes {
  static GoRouter myRoutes = GoRouter(
    navigatorKey: _rootNavigatorKey,
    initialLocation: '/1/A',
    routes: <RouteBase>[
      ShellRoute(
          navigatorKey: _shellNavigatorKey,
          builder: (BuildContext context, GoRouterState state, Widget child) {
            return HomePage2(
              child: child,
            );
          },
          routes: <RouteBase>[
            GoRoute(
              name: '/1',
              path: '/1',
              builder: (BuildContext context, GoRouterState state) {
                return HomePage(params: state.queryParams);
              },
              routes: <RouteBase>[
                // The details screen to display stacked on the inner Navigator.
                // This will cover screen A but not the application shell.
                ShellRoute(
                    // navigatorKey:  _firstShellNavigatorKey,
                    builder: (BuildContext context, GoRouterState state,
                        Widget child) {
                      return HomeNestedPage(
                        child: child,
                      );
                    },
                    routes: <RouteBase>[
                      GoRoute(
                        name: 'A',
                        path: 'A',
                        builder: (BuildContext context, GoRouterState state) {
                          print("2nd A startt, ${state.queryParams}");

                          if (state.queryParams.isEmpty) {
                            print("par are nul");
                            // state.queryParams.addAll({"index": "0",  "alpha":"A"});
                          }

                          return DisplayDetail(params: state.queryParams);
                        },
                      ),
                      GoRoute(
                        name: 'B',
                        path: 'B',
                        builder: (BuildContext context, GoRouterState state) {
                          print("2nd B startt, ${state.queryParams}");
                          return DisplayDetail(params: state.queryParams);
                        },
                      ),
                      GoRoute(
                        name: 'C',
                        path: 'C',
                        builder: (BuildContext context, GoRouterState state) {
                          print("2nd C startt, ${state.queryParams}");
                          return DisplayDetail(params: state.queryParams);
                        },
                      ),
                    ]),
              ],
            ),
            GoRoute(
              name: '/2',
              path: '/2',
              builder: (BuildContext context, GoRouterState state) {
                return HomePage(params: state.queryParams);
              },
              routes: <RouteBase>[
                // The details screen to display stacked on the inner Navigator.
                // This will cover screen A but not the application shell.
                ShellRoute(
                    // navigatorKey: _secondShellNavigatorKey,
                    builder: (BuildContext context, GoRouterState state,
                        Widget child) {
                      return HomeNestedPage(
                        child: child,
                      );
                    },
                    routes: <RouteBase>[
                      GoRoute(
                        name: 'D',
                        path: 'D',
                        builder: (BuildContext context, GoRouterState state) {
                          print("2nd D startt, ${state.queryParams}");

                          return DisplayDetail(params: state.queryParams);
                        },
                      ),
                      GoRoute(
                        name: 'E',
                        path: 'E',
                        builder: (BuildContext context, GoRouterState state) {
                          print("2nd E startt, ${state.queryParams}");
                          return DisplayDetail(params: state.queryParams);
                        },
                      ),
                      GoRoute(
                        name: 'F',
                        path: 'F',
                        builder: (BuildContext context, GoRouterState state) {
                          print("2nd F startt, ${state.queryParams}");
                          return DisplayDetail(params: state.queryParams);
                        },
                      ),
                    ]),
              ],
            ),
            GoRoute(
              name: '/3',
              path: '/3',
              builder: (BuildContext context, GoRouterState state) {
                return HomePage(params: state.queryParams);
              },
              routes: <RouteBase>[
                // The details screen to display stacked on the inner Navigator.
                // This will cover screen A but not the application shell.
                ShellRoute(
                    // navigatorKey: _thirdShellNavigatorKey,
                    builder: (BuildContext context, GoRouterState state,
                        Widget child) {
                      return HomeNestedPage(
                        child: child,
                      );
                    },
                    routes: <RouteBase>[
                      GoRoute(
                        name: 'G',
                        path: 'G',
                        builder: (BuildContext context, GoRouterState state) {
                          print("2nd G startt, ${state.queryParams}");

                          return DisplayDetail(params: state.queryParams);
                        },
                      ),
                      GoRoute(
                        name: 'H',
                        path: 'H',
                        builder: (BuildContext context, GoRouterState state) {
                          print("2nd H startt, ${state.queryParams}");
                          return DisplayDetail(params: state.queryParams);
                        },
                      ),
                      GoRoute(
                        name: 'I',
                        path: 'I',
                        builder: (BuildContext context, GoRouterState state) {
                          print("2nd I startt, ${state.queryParams}");
                          return DisplayDetail(params: state.queryParams);
                        },
                      ),
                    ]),
              ],
            ),
            GoRoute(
              name: '/4',
              path: '/4',
              builder: (BuildContext context, GoRouterState state) {
                return HomePage(params: state.queryParams);
              },
              routes: <RouteBase>[
                // The details screen to display stacked on the inner Navigator.
                // This will cover screen A but not the application shell.
                ShellRoute(
                    // navigatorKey: _fourthShellNavigatorKey,
                    builder: (BuildContext context, GoRouterState state,
                        Widget child) {
                      return HomeNestedPage(
                        child: child,
                      );
                    },
                    routes: <RouteBase>[
                      GoRoute(
                        name: 'J',
                        path: 'J',
                        builder: (BuildContext context, GoRouterState state) {
                          print("2nd J startt, ${state.queryParams}");

                          return DisplayDetail(params: state.queryParams);
                        },
                      ),
                      GoRoute(
                        name: 'K',
                        path: 'K',
                        builder: (BuildContext context, GoRouterState state) {
                          print("2nd K startt, ${state.queryParams}");
                          return DisplayDetail(params: state.queryParams);
                        },
                      ),
                      GoRoute(
                        name: 'L',
                        path: 'L',
                        builder: (BuildContext context, GoRouterState state) {
                          print("2nd L startt, ${state.queryParams}");
                          return DisplayDetail(params: state.queryParams);
                        },
                      ),
                    ]),
              ],
            ),
          ]),
    ],
    errorBuilder: (BuildContext context, GoRouterState state) =>
        ErrorScreen(state.error!),
  );
}
