<!--
This README describes the package. If you publish this package to pub.dev,
this README's contents appear on the landing page for your package.

For information about how to write a good package README, see the guide for
[writing package pages](https://dart.dev/guides/libraries/writing-package-pages).

For general information about developing packages, see the Dart guide for
[creating packages](https://dart.dev/guides/libraries/create-library-packages)
and the Flutter guide for
[developing packages and plugins](https://flutter.dev/developing-packages).
-->

Easily integrate smooth, anim side menus with customization options.


## Properties
```
Here are some important properties you can customize:

 Property            Description                                 
---------------------------------------------------------------------
 animatedDuration:   Adjust the duration of the slider animation.    
 background:         The background color of the slider menu.    
 curve:              Adjust the animation curve style of the slider.           
 closeIcon:          The icon displayed to close the slider.

```

## How To Use

To integrate **My anim_side_menu Package** into your project, follow these steps:

### 1. Add the Dependency

```yaml
dependencies:
  flutter:
    sdk: flutter
  anim_side_menu:
  ```

### 2. SideMenuType.animNRotate
![Image Alt Text](assets/animNRotate.JPEG)
``` sidemenubar


final GlobalKey<SideMenuState> _sideMenuKey = GlobalKey<SideMenuState>();

SideMenu(
    key: _sideMenuKey,
    menu: buildMenu(),
    type: SideMenuType.animNRotate,
    child: Scaffold(
        appBar: AppBar(
            leading: IconButton(
              icon: Icon(Icons.menu),
              onPressed: () {
                final _state = _sideMenuKey.currentState;
                if (_state.isOpened)
                  _state.closeSideMenu(); // close side menu
                else
                  _state.openSideMenu();// open side menu
              },
            ),
        ...
    ),
));
```

### 3. SideMenuType.animNSlide
![Image Alt Text](assets/animNSlide.JPEG)
``` sidemenubar


final GlobalKey<SideMenuState> _sideMenuKey = GlobalKey<SideMenuState>();

SideMenu(
    key: _sideMenuKey,
    menu: buildMenu(),
    type: SideMenuType.animNSlide,
    child: Scaffold(
        appBar: AppBar(
            leading: IconButton(
              icon: Icon(Icons.menu),
              onPressed: () {
                final _state = _sideMenuKey.currentState;
                if (_state.isOpened)
                  _state.closeSideMenu(); // close side menu
                else
                  _state.openSideMenu();// open side menu
              },
            ),
        ...
    ),
));
```

### 4. SideMenuType.slide
![Image Alt Text](assets/slide.JPEG)
``` sidemenubar


final GlobalKey<SideMenuState> _sideMenuKey = GlobalKey<SideMenuState>();

SideMenu(
    key: _sideMenuKey,
    menu: buildMenu(),
    type: SideMenuType.slide,
    child: Scaffold(
        appBar: AppBar(
            leading: IconButton(
              icon: Icon(Icons.menu),
              onPressed: () {
                final _state = _sideMenuKey.currentState;
                if (_state.isOpened)
                  _state.closeSideMenu(); // close side menu
                else
                  _state.openSideMenu();// open side menu
              },
            ),
        ...
    ),
));
```

### 5. SideMenuType.slideNRotate

![Image Alt Text](assets/slideNRotate.JPEG)
``` sidemenubar

final GlobalKey<SideMenuState> _sideMenuKey = GlobalKey<SideMenuState>();

SideMenu(
    key: _sideMenuKey,
    menu: buildMenu(),
    type: SideMenuType.slideNRotate,
    child: Scaffold(
        appBar: AppBar(
            leading: IconButton(
              icon: Icon(Icons.menu),
              onPressed: () {
                final _state = _sideMenuKey.currentState;
                if (_state.isOpened)
                  _state.closeSideMenu(); // close side menu
                else
                  _state.openSideMenu();// open side menu
              },
            ),
        ...
    ),
));
```


### License
This package is licensed under the MIT License. See LICENSE for more information.
