# flutter_food
Flutter小试牛刀 - 仿饿了么APP（Flutter + Native混合栈）

本工程仅用于学习

Android Native工程点[这里](https://github.com/YangJ0720/FoodHybridAndroid)  
iOS Native工程暂不上传

## APK下载
[Download](https://github.com/YangJ0720/FoodHybridAndroid/blob/master/app/release/app-release.apk)

## 效果图
![image](https://github.com/YangJ0720/flutter_food/raw/master/doc/4.gif)
![image](https://github.com/YangJ0720/flutter_food/raw/master/doc/8.gif)
![image](https://github.com/YangJ0720/flutter_food/raw/master/doc/11.gif)
![image](https://github.com/YangJ0720/flutter_food/raw/master/doc/12.gif)

## 实现功能
* 完成APP各项基本功能开发（网络请求、数据解析、组件通信、channel通信等）
* 基于阿里闲鱼flutter_boost混合栈实现APP界面跳转
* 基于百度地图和百度定位SDK实现地图和定位等相关功能
* 基于百度语音识别SDK实现搜索模块语音识别功能

## 框架依赖

Flutter端
```
# 图片缓存框架
cached_network_image: ^2.0.0
# 浏览器框架
webview_flutter: ^0.3.19+9
# 瀑布流框架
flutter_staggered_grid_view: ^0.3.0
# 网络请求框架
dio: ^3.0.0
# 阿里混合栈框架
flutter_boost:
  git:
    url: 'https://github.com/alibaba/flutter_boost.git'
    ref: '1.12.13'
```

Android端
```
implementation fileTree(dir: 'libs', include: ['*.aar', '*.jar'], exclude: [])
implementation "org.jetbrains.kotlin:kotlin-stdlib-jdk7:$kotlin_version"
implementation 'androidx.appcompat:appcompat:1.1.0'
implementation 'androidx.core:core-ktx:1.2.0'
implementation 'androidx.constraintlayout:constraintlayout:1.1.3'
testImplementation 'junit:junit:4.12'
androidTestImplementation 'androidx.test.ext:junit:1.1.1'
androidTestImplementation 'androidx.test.espresso:espresso-core:3.2.0'
// Android Flutter 混编步骤三
implementation project(':flutter')
// 依赖阿里混合栈框架
implementation project(':flutter_boost')
```

## 编译配置

1.分别创建Android Native工程、iOS Native工程和flutter model工程

#### 需要注意flutter工程选择的是model，如下图：
![image](https://github.com/YangJ0720/flutter_food/raw/master/doc/WX20200510-132511@2x.png)

#### 创建好工程后结构目录，如下图
![image](https://github.com/YangJ0720/flutter_food/raw/master/doc/credentials.png)


2.Android Native依赖flutter model模块

#### 打开Android工程找到settings.gradle文件，增加以下配置：
```
// Android Flutter 混编步骤一
setBinding(new Binding([gradle: this]))
evaluate(new File(settingsDir.parentFile, 'flutter_food/.android/include_flutter.groovy'))
// 如果希望在Android Studio中既可以编译Android工程又可以编译Flutter工程，需要在这里导入Flutter模块（将flutter_food更改为自己的名称）
include ':flutter_food'
project(':flutter_food').projectDir = new File('../flutter_food')
```

#### 在app目录下找到build.gradle文件，增加以下配置：
```
android {
    // Android Flutter 混编步骤二
    compileOptions {
        sourceCompatibility JavaVersion.VERSION_1_8
        targetCompatibility JavaVersion.VERSION_1_8
    }
}

dependencies {
    // Android Flutter 混编步骤三
    implementation project(':flutter')
}
```

#### 配置flutter run
* 在Android Studio中找到Edit Configurations
* 点击左上角 + 号
* 选择Flutter
* 在Dart entrypoint路径中配置flutter model的入口文件（我这里是main.dart）
* 完成


## 遗留问题
1.目前使用的百度地图SDK在flutter_boost中加载显示正常，但是当Activity销毁时并未移除，后续优化该问题(Flutter标准API实现没有出现该问题)  
2.生产环境中需要使用地图功能，可以使用百度地图flutter插件，本工程旨在学习flutter各种功能特性


## 相关示例
### 现有Native工程依赖Flutter模块进行混合开发
[Flutter示例工程](https://github.com/YangJ0720/FlutterHybridAndroid)
[Android示例工程](https://github.com/YangJ0720/FlutterHybridAndroid)
* 现有Native工程依赖Flutter模块
* Android Native加载FlutterView和FlutterFragment
* 使用三种Channel进行Native和Flutter的通信

### Flutter使用PlatformView渲染Native View
[示例工程](https://github.com/YangJ0720/flutter_platform)
* Flutter使用PlatformView渲染Android Native View
