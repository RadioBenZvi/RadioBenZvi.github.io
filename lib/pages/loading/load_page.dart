// ignore_for_file: non_constant_identifier_names

Future<void> LoadPage({required ToPage, required Page}) async
{
    ToPage(await Page(ToPage: ToPage));
}