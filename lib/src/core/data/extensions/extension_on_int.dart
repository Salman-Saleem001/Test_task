import 'package:bloc_demo/main_export.dart';

extension ExtensionOnInt on int{

  SizedBox hp(){
    return SizedBox(height: toDouble(),);
  }

  SizedBox wp(){
    return SizedBox(width: toDouble(),);
  }

}