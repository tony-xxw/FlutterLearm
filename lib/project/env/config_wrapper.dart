import 'package:flutter/cupertino.dart';
import 'package:helloflutter/project/common/config/config.dart';

import 'env_config.dart';

class ConfigWrapper extends StatelessWidget {
  ConfigWrapper({Key key, this.config, this.child});

  final EnvConfig config;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    Config.DEBUG = this.config.debug;
    print("ConfigWrapper build Debug  ${Config.DEBUG}");
    return new _InheritedConfig(config: this.config, child: this.child);
  }

  static EnvConfig of(BuildContext context) {
    final _InheritedConfig _inheritedConfig =
        context.inheritFromWidgetOfExactType(_InheritedConfig);
    return _inheritedConfig.config;
  }
}

class _InheritedConfig extends InheritedWidget {
  const _InheritedConfig(
      {Key key, @required this.config, @required Widget child})
      : assert(child != null),
        super(key: key, child: child);

  final EnvConfig config;

  @override
  bool updateShouldNotify(_InheritedConfig oldWidget) =>
      config != oldWidget.config;
}
