import 'package:flutter/material.dart';
import 'package:flutter_news_app/services/error_dialog.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:share_plus/share_plus.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:webview_flutter/webview_flutter.dart';

import '../../consts/color.dart';

class NewsDetailPage extends StatefulWidget {
  const NewsDetailPage({super.key});

  @override
  State<NewsDetailPage> createState() => _NewsDetailPageState();
}

class _NewsDetailPageState extends State<NewsDetailPage> {
  late WebViewController webViewController;
  final _url =
      'https://techcrunch.com/2023/04/27/muslims-come-into-the-frame-in-southeast-asias-fintech-boom/';
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        if (await webViewController.canGoBack()) {
          webViewController.goBack();
          return false;
        } else {
          return true;
        }
      },
      child: Scaffold(
        backgroundColor: backgroundColor,
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
                await _showModalBottomSheet();
              },
              icon: const Icon(
                Icons.more_horiz,
                color: Colors.black,
              ),
            ),
          ],
        ),
        body: Column(
          children: [
            Expanded(
              child: WebView(
                initialUrl: _url,
                zoomEnabled: true,
                onWebViewCreated: (controller) {
                  webViewController = controller;
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  Future<void> _showModalBottomSheet() async {
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
            color: backgroundColor,
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
                onTap: () {
                  try {
                    webViewController.reload();
                  } catch (e) {
                    errorDialog(
                      errorMessage: e.toString(),
                      context: context,
                    );
                  } finally {
                    Navigator.pop(context);
                  }
                },
                leading: Icon(
                  Icons.refresh_rounded,
                  color: grey1,
                ),
                title: Text(
                  'Refresh',
                  style: TextStyle(
                    color: grey1,
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
              ListTile(
                onTap: () async {
                  try {
                    await Share.share(
                      'url',
                      subject: 'Check out this news!',
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
                  style: TextStyle(
                    color: grey1,
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
              ListTile(
                onTap: () async {
                  if (!await launchUrl(Uri.parse(_url))) {
                    throw Exception('Could not launch $_url');
                  }
                },
                leading: Icon(
                  Icons.link,
                  color: grey1,
                ),
                title: Text(
                  'Open In Browser',
                  style: TextStyle(
                    color: grey1,
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
