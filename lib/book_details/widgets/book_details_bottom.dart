import 'package:books_finder/book_details/book_details.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class BookDetailsBottom extends StatelessWidget {
  const BookDetailsBottom({
    super.key,
    required this.url,
  });

  final String url;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        bottom: 30,
        left: 30,
        right: 30,
        top: 8,
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Expanded(
            child: BottomIconButton(
              text: "Buy",
              onPressed: () async {
                final uri = Uri.parse(url);

                if (await canLaunchUrl(uri)) {
                  await launchUrl(uri);
                }
              },
              icon: Icons.shop,
            ),
          ),
        ],
      ),
    );
  }
}
