import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kachpara/core/injector.dart';
import 'package:kachpara/domain/entities/user.dart';
import 'package:kachpara/domain/entities/user_store.dart';
import 'package:kachpara/ui/leaderboard_page/cubit/leaderboard_page_cubit.dart';

class LeaderboardPage extends StatelessWidget {
  static const String routeName = 'leaderboard_page';
  final String storeId;
  final String storeName;
  const LeaderboardPage({super.key, required this.storeId, required this.storeName});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt<LeaderboardPageCubit>(param1: storeId),
      child: LeaderboardPageLayout(storeName: storeName),
    );
  }
}

class LeaderboardPageLayout extends StatefulWidget {
  const LeaderboardPageLayout({Key? key, required this.storeName});
  final String storeName;

  @override
  State<LeaderboardPageLayout> createState() => _LeaderboardPageLayoutState();
}

class _LeaderboardPageLayoutState extends State<LeaderboardPageLayout> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: BlocBuilder<LeaderboardPageCubit, LeaderboardPageState>(
        builder: (context, state) {
          return Scaffold(
            appBar: AppBar(
              title: Text(widget.storeName),
              bottom: TabBar(
                unselectedLabelColor: Colors.grey,
                labelColor: Colors.red,
                indicatorColor: Colors.black,
                tabs: [
                  Container(
                    height: 60,
                    child: Tab(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(Icons.handshake),
                          SizedBox(height: 2), // Adjust the spacing between icon and text
                          Text('Ekletmeler'),
                        ],
                      ),
                    ),
                  ),
                  Container(
                    height: 60,
                    child: Tab(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(Icons.group),
                          SizedBox(height: 2), // Adjust the spacing between icon and text
                          Text('Erişim'),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            body: TabBarView(
              children: [
                _buildLeaderboard(state.stores, (store) => store.totalStoreAdditions!),
                _buildLeaderboard(state.stores, (store) => store.outreach.length),
              ],
            ),
          );
        },
      ),
    );
  }

  Widget _buildLeaderboard(
    Map<User, UserStore>? stores,
    int Function(UserStore store) sortingFunction,
  ) {
    if (stores == null) {
      return Center(child: CircularProgressIndicator());
    }

    final sortedStores = stores.entries.toList()..sort((a, b) => sortingFunction(b.value).compareTo(sortingFunction(a.value)));

    final limitedStores = sortedStores.take(10).toList();

    if (limitedStores.every((entry) => sortingFunction(entry.value) <= 0)) {
      return Center(
        child: Text(
          'Liderimiz yok ama sen olabilirsin!',
          style: Theme.of(context).textTheme.subtitle1?.copyWith(fontWeight: FontWeight.bold),
        ),
      );
    }

    return Column(
      children: [
        Padding(
          padding: EdgeInsets.all(8),
          child: Text(
            'Liderlik Tablosu',
            style: Theme.of(context).textTheme.headline6?.copyWith(fontWeight: FontWeight.bold),
          ),
        ),
        ListView.builder(
          shrinkWrap: true,
          physics: ClampingScrollPhysics(),
          itemCount: limitedStores.length,
          itemBuilder: (context, index) {
            final MapEntry<User, UserStore> entry = limitedStores[index];
            final user = entry.key;
            final userStore = entry.value;

            if (sortingFunction(userStore) >= 1) {
              return Padding(
                padding: EdgeInsets.symmetric(vertical: 4, horizontal: 8),
                child: Container(
                  height: 50,
                  decoration: BoxDecoration(
                    color: Colors.green,
                    borderRadius: BorderRadius.circular(8),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.5),
                        spreadRadius: 2,
                        blurRadius: 3,
                        offset: Offset(0, 3),
                      ),
                    ],
                  ),
                  child: ListTile(
                    title: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            Text('${index + 1}.', style: TextStyle(color: Colors.black)),
                            SizedBox(width: 8),
                            Text(user.name ?? '', style: Theme.of(context).textTheme.subtitle1?.copyWith(fontWeight: FontWeight.bold, color: Colors.white)),
                          ],
                        ),
                        Text('${sortingFunction(userStore)}', style: Theme.of(context).textTheme.subtitle1?.copyWith(fontWeight: FontWeight.bold)),
                      ],
                    ),
                  ),
                ),
              );
            }
          },
        ),
      ],
    );
  }
}
