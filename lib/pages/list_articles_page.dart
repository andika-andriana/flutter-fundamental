import 'package:flutter/material.dart';
import 'package:flutter_application_1/bloc/list_articles_bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ListArticlesPage extends StatefulWidget {
  const ListArticlesPage({super.key});

  @override
  State<ListArticlesPage> createState() => _ListArticlesPageState();
}

class _ListArticlesPageState extends State<ListArticlesPage> {
  ScrollController scrollController = ScrollController();
  ListArtclesBloc? listArtclesBloc;

  void onScroll() {
    double maxScroll = scrollController.position.maxScrollExtent;
    double currentScroll = scrollController.position.pixels;

    if (currentScroll == maxScroll) {
      listArtclesBloc?.add(ListArticlesEvent());
    }
  }

  @override
  Widget build(BuildContext context) {
    listArtclesBloc = BlocProvider.of<ListArtclesBloc>(context);
    scrollController.addListener(onScroll);

    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text("Infinite List with BloC"),
        ),
        body: BlocBuilder<ListArtclesBloc, ListArticlesState>(
            builder: (context, state) {
          if (state is ListUnitilized) {
            return Container(
              margin: const EdgeInsets.all(20),
              child: const Center(
                child: SizedBox(
                  height: 30,
                  width: 30,
                  child: CircularProgressIndicator(),
                ),
              ),
            );
          } else {
            ListLoaded listLoaded = state as ListLoaded;
            return ListView.builder(
              controller: scrollController,
              itemCount: (listLoaded.hasReachedMax)
                  ? listLoaded.lists.length
                  : listLoaded.lists.length + 1,
              itemBuilder: (context, index) {
                if (index < listLoaded.lists.length) {
                  return Container(
                    margin: EdgeInsets.only(
                      bottom: 16,
                      top: (index == 0) ? 16 : 0,
                      left: 16,
                      right: 16,
                    ),
                    padding: const EdgeInsets.all(16),
                    decoration: BoxDecoration(color: Colors.white, boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.2),
                        offset: const Offset(1, 1),
                        blurRadius: 2,
                      )
                    ]),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "${listLoaded.lists[index].id}. ",
                          style: const TextStyle(
                            fontFamily: "Poppins",
                            fontSize: 14,
                            fontWeight: FontWeight.bold,
                            color: Colors.black87,
                          ),
                        ),
                        Container(
                          width: MediaQuery.of(context).size.width * 0.75,
                          margin: const EdgeInsets.only(left: 8),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                listLoaded.lists[index].title,
                                style: const TextStyle(
                                  fontFamily: "Poppins",
                                  fontSize: 14,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black87,
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ),
                              Text(
                                listLoaded.lists[index].body,
                                textAlign: TextAlign.justify,
                                maxLines: 3,
                                style: const TextStyle(
                                  fontFamily: "Poppins",
                                  fontSize: 10,
                                  fontWeight: FontWeight.w500,
                                  color: Colors.black87,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  );
                } else {
                  return Container(
                    margin: const EdgeInsets.only(top: 16, bottom: 20),
                    child: const Center(
                      child: SizedBox(
                        width: 30,
                        height: 30,
                        child: CircularProgressIndicator(),
                      ),
                    ),
                  );
                }
              },
            );
          }
        }),
      ),
    );
  }
}
