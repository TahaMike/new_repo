import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

import '../provider/news_provider.dart';

class NewsPage extends StatefulWidget {
  const NewsPage({super.key});

  @override
  State<NewsPage> createState() => _NewsPageState();
}

class _NewsPageState extends State<NewsPage> {
  @override
  void initState() {
    super.initState();
    Future.microtask(() {
      context.read<NewsProvider>().getNewsData();
      print('Micro task hit');
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("News App"),
        centerTitle: true,
        leading: IconButton(
          onPressed: () => context.pop(),
          icon: const Icon(Icons.arrow_back),
        ),
      ),
      body: Consumer<NewsProvider>(
        builder: (context, provider, child) {
          if (provider.newsList.isEmpty) {
            return const Center(child: Text("No article found"));
          }

          return ListView.builder(
            itemCount: provider.newsList.length,
            itemBuilder: (_, index) {
              final article = provider.newsList[index];
              return Card(
                margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
                elevation: 2,
                child: Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // 📰 Image
                      if (article.image != null && article.image!.isNotEmpty)
                        ClipRRect(
                          borderRadius: BorderRadius.circular(8),
                          child: Image.network(
                            article.image!,
                            height: 180,
                            width: double.infinity,
                            fit: BoxFit.cover,
                          ),
                        ),
                      const SizedBox(height: 8),

                      // 📰 Title
                      Text(
                        article.title ?? "No title",
                        style: const TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),

                      const SizedBox(height: 4),

                      // 📰 Description
                      if (article.description != null)
                        Text(
                          article.description!,
                          style: const TextStyle(fontSize: 14),
                        ),

                      const SizedBox(height: 4),

                      // 📰 Content
                      if (article.content != null)
                        Text(
                          article.content!,
                          style: const TextStyle(
                            fontSize: 13,
                            color: Colors.grey,
                          ),
                          maxLines: 3,
                          overflow: TextOverflow.ellipsis,
                        ),

                      const SizedBox(height: 6),

                      // 📰 Published Date & Language
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            article.publishedAt != null
                                ? "Published: ${article.publishedAt!.toLocal()}"
                                : "No date",
                            style: const TextStyle(
                              fontSize: 12,
                              color: Colors.black54,
                            ),
                          ),
                          if (article.lang != null)
                            Text(
                              "Lang: ${article.lang}",
                              style: const TextStyle(
                                fontSize: 12,
                                color: Colors.black54,
                              ),
                            ),
                        ],
                      ),

                      const SizedBox(height: 4),

                      // 📰 Source Info
                      if (article.source != null)
                        Text(
                          "Source: ${article.source?.name ?? "Unknown"}",
                          style: const TextStyle(
                            fontSize: 12,
                            color: Colors.blueGrey,
                          ),
                        ),

                      // 🌐 URL
                      if (article.url != null)
                        Padding(
                          padding: const EdgeInsets.only(top: 6),
                          child: Text(
                            article.url!,
                            style: const TextStyle(
                              fontSize: 12,
                              color: Colors.blue,
                              decoration: TextDecoration.underline,
                            ),
                          ),
                        ),
                    ],
                  ),
                ),
              );
            },
          );
        },
      ),
    );
  }
}
