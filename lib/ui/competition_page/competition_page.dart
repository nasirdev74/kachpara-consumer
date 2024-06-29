import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kachpara/core/injector.dart';
import 'package:kachpara/ui/competition_page/cubit/competition_page_cubit.dart';
import 'package:kachpara/l10n/extensions/localizations_extension.dart';

class CompetitionPage extends StatelessWidget {
  static const String routeName = 'competition_page';
  final String storeId;
  final String storeName;
  const CompetitionPage({super.key, required this.storeId, required this.storeName});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt<CompetitionPageCubit>(param1: storeId),
      child: CompetitionPageLayout(storeName: storeName),
    );
  }
}

class CompetitionPageLayout extends StatefulWidget {
  const CompetitionPageLayout({Key? key, required this.storeName});
  final String storeName;

  @override
  State<CompetitionPageLayout> createState() => _CompetitionPageLayoutState();
}

class _CompetitionPageLayoutState extends State<CompetitionPageLayout> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: BlocBuilder<CompetitionPageCubit, CompetitionPageState>(
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
                _buildLeaderboard(state.competition?.directreach, (value) => value.toInt(), state.userNames),
                _buildLeaderboard(state.competition?.outreach, (value) => value.toInt(), state.userNames),
              ],
            ),
          );
        },
      ),
    );
  }

  Widget _buildLeaderboard(
    Map<String, num>? users,
    int Function(num value) sortingFunction,
    Map<String, String>? userNames,
  ) {
    if (users == null) {
      return Center(child: CircularProgressIndicator());
    }

    final sortedUsers = users.entries.toList()..sort((a, b) => sortingFunction(b.value).compareTo(sortingFunction(a.value)));

    final limitedUsers = sortedUsers.take(10).toList();

    if (limitedUsers.every((entry) => sortingFunction(entry.value) <= 0)) {
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
          child: Container(
            decoration: BoxDecoration(
              color: Colors.red.shade300, // Set the background color
              borderRadius: BorderRadius.circular(28), // Add rounded corners if needed
            ),
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(width: 16),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          context.l10n.competition_page_deadline_title,
                          style: Theme.of(context).textTheme.subtitle1?.copyWith(
                                fontWeight: FontWeight.bold,
                                color: Colors.yellow, // Set the text color
                              ),
                        ),
                        Text(
                          context.l10n.competition_page_deadline(BlocProvider.of<CompetitionPageCubit>(context).state.competition?.endDate ?? DateTime.now()),
                          style: Theme.of(context).textTheme.bodyText1?.copyWith(color: Colors.white),
                        ),
                        SizedBox(height: 8),
                        Text(
                          context.l10n.competition_page_prize_title,
                          style: Theme.of(context).textTheme.subtitle1?.copyWith(
                                fontWeight: FontWeight.bold,
                                color: Colors.yellow, // Set the text color
                              ),
                        ),
                        Text(
                          '${BlocProvider.of<CompetitionPageCubit>(context).state.competition?.prize ?? "No prize information"}', // Use actual prize information
                          style: Theme.of(context).textTheme.bodyText1?.copyWith(color: Colors.white),
                        ),
                      ],
                    ),
                  ),
                  Icon(
                    Icons.emoji_events, // Replace with your prize icon
                    color: Colors.yellow, // Set the icon color
                    size: 72, // Set the icon size
                  ),
                ],
              ),
            ),
          ),
        ),
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
          itemCount: limitedUsers.length,
          itemBuilder: (context, index) {
            final MapEntry<String, num> entry = limitedUsers[index];

            if (sortingFunction(entry.value) >= 1) {
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
                            Text(userNames![entry.key] ?? "",
                                style: Theme.of(context).textTheme.subtitle1?.copyWith(fontWeight: FontWeight.bold, color: Colors.white)),
                          ],
                        ),
                        Text('${sortingFunction(entry.value)}', style: Theme.of(context).textTheme.subtitle1?.copyWith(fontWeight: FontWeight.bold)),
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
