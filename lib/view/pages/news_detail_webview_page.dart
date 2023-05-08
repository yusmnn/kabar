import 'package:flutter/material.dart';
import 'package:flutter_news_app/services/error_dialog.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:share_plus/share_plus.dart';
import 'package:webview_flutter/webview_flutter.dart';

import '../../consts/color.dart';

class NewsDetailPage extends StatefulWidget {
  const NewsDetailPage({super.key, required this.url});

  final String url;
  @override
  State<NewsDetailPage> createState() => _NewsDetailPageState();
}

class _NewsDetailPageState extends State<NewsDetailPage> {
  late WebViewController webViewController;
  WebViewController? _controller;

  @override
  void initState() {
    super.initState();
    _controller = WebViewController()
      ..setJavaScriptMode(JavaScriptMode.unrestricted)
      ..setBackgroundColor(const Color(0x00000000))
      ..setNavigationDelegate(
        NavigationDelegate(
          onNavigationRequest: (NavigationRequest request) {
            if (request.url.startsWith(widget.url)) {
              return NavigationDecision.prevent;
            }
            return NavigationDecision.navigate;
          },
        ),
      )
      ..loadRequest(Uri.parse(widget.url));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: primaryColor,
      appBar: AppBar(
        elevation: 0,
        centerTitle: true,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(
            Icons.arrow_back_ios_new_rounded,
            color: grey1,
          ),
        ),
        title: SvgPicture.asset(
          'assets/icons/icon_app.svg',
        ),
        actions: [
          IconButton(
            onPressed: () async {
              await showModalBottomSheet(
                context: context,
                shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.vertical(
                    top: Radius.circular(20),
                  ),
                ),
                builder: (context) {
                  return Container(
                    decoration: BoxDecoration(
                      color: primaryColor,
                      borderRadius: const BorderRadius.vertical(
                        top: Radius.circular(20),
                      ),
                    ),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        const SizedBox(
                          height: 20,
                        ),
                        Center(
                          child: Container(
                            width: 40,
                            height: 5,
                            decoration: BoxDecoration(
                              color: grey1,
                              borderRadius: BorderRadius.circular(10),
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        const Text(
                          'More Options',
                          style: TextStyle(
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        Divider(
                          color: grey1,
                          thickness: 1,
                          indent: 20,
                          endIndent: 20,
                        ),
                        ListTile(
                          onTap: () async {
                            await _controller?.reload();
                            if (mounted) {
                              Navigator.pop(context);
                            }
                          },
                          leading: Icon(
                            Icons.refresh_rounded,
                            color: grey1,
                          ),
                          title: Text(
                            'Refresh',
                            style: Theme.of(context).textTheme.labelMedium,
                          ),
                        ),
                        ListTile(
                          onTap: () async {
                            try {
                              await Share.share(
                                widget.url,
                                subject: 'Udah baca berita ini? Cek yuk!',
                              );
                            } catch (e) {
                              errorDialog(
                                errorMessage: e.toString(),
                                context: context,
                              );
                            } finally {
                              Navigator.pop(context);
                            }
                          },
                          leading: SvgPicture.asset(
                            'assets/icons/share.svg',
                            width: 24,
                            height: 24,
                            fit: BoxFit.scaleDown,
                            colorFilter: ColorFilter.mode(
                              grey1,
                              BlendMode.srcIn,
                            ),
                          ),
                          title: Text(
                            'Share',
                            style: Theme.of(context).textTheme.labelMedium,
                          ),
                        ),
                        ListTile(
                          onTap: () {
                            showDialog(
                              context: context,
                              builder: (BuildContext context) {
                                return AlertDialog(
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                  title: Column(
                                    children: [
                                      Container(
                                        decoration: BoxDecoration(
                                          shape: BoxShape.circle,
                                          border: Border.all(
                                            color: Colors.green,
                                          ),
                                        ),
                                        child: const Icon(
                                          Icons.check,
                                          color: Colors.green,
                                        ),
                                      ),
                                      const SizedBox(height: 10),
                                      Text(
                                        'Thanks for reporting this post!',
                                        style: Theme.of(context)
                                            .textTheme
                                            .labelMedium,
                                      ),
                                    ],
                                  ),
                                  actions: <Widget>[
                                    TextButton(
                                      child: Text("OK",
                                          style: TextStyle(color: grey1)),
                                      onPressed: () {
                                        Navigator.of(context).pop();
                                      },
                                    ),
                                  ],
                                );
                              },
                            );
                          },
                          leading: const Icon(
                            Icons.report_rounded,
                            color: Colors.red,
                          ),
                          title: Text(
                            'Report',
                            style: Theme.of(context).textTheme.labelMedium,
                          ),
                        ),
                      ],
                    ),
                  );
                },
              );
            },
            icon: Icon(
              Icons.more_horiz,
              color: grey1,
            ),
          ),
        ],
      ),
      body: Column(
        children: [
          Expanded(
            child: WebViewWidget(
              controller: _controller!,
            ),
          ),
        ],
      ),
    );
  }
}
