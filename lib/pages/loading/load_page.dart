// ignore_for_file: non_constant_identifier_names

import 'package:radio_ben_zvi_website/pages/loading/loading.dart';

Future<void> LoadPage({required ToPage, required Page}) async
{
    ToPage(Loading(ToPage: ToPage, Page: Page));
}