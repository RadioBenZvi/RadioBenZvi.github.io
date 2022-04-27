import 'package:flutter_web_plugins/flutter_web_plugins.dart' deferred as plugins;

void configureApp() 
{
    plugins.setUrlStrategy(plugins.PathUrlStrategy());
}