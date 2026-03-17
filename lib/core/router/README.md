# Router

This directory contains the GoRouter configuration for the app.

## Files

### `app_router.dart`
Creates and exports the `GoRouter` instance via `AppRouter.createRouter()`.

**Route tree:**
```
/                         → HomeScreen
/page1                    → Page1
ShellRoute (Page2 shell)
  /page2                  → redirect → /page2/location-list
  /page2/location-list    → LocationListScreen
    detail                → DetailLocationListScreen (still has AppBar + BottomNav)
  /page2/keyboard         → KeyboardScreen
  /page2/map              → MapScreen
  /page2/audio            → AudioScreen
```

> **ShellRoute pattern:** `Page2` is the shell widget. GoRouter passes the currently active child route as `child` to `Page2`, which renders it in its `body`. This means every sub-route of Page2 (including `DetailLocationListScreen`) automatically inherits Page2's `AppBar` and `BottomNavigationBar`.

### `route_names.dart`
Centralised route path constants.

| Constant | Value | Notes |
|----------|-------|-------|
| `home` | `'/'` | absolute |
| `page_1` | `'/page1'` | absolute |
| `page_2` | `'/page2'` | absolute |
| `locationListScreen` | `'location-list'` | relative segment |
| `detailLocationListScreen` | `'detail'` | relative segment |
| `keyboardScreen` | `'keyboard'` | relative segment |
| `mapScreen` | `'map'` | relative segment |
| `audioScreen` | `'audio'` | relative segment |

> All absolute paths in `GoRoute` inside `ShellRoute` are assembled as `'${Routes.page_2}/${Routes.screenName}'`.

## Dependencies

- `go_router` package
