# Screens

This directory contains all full-screen widgets (pages) used in the app.

## Files

| File | Description |
|------|-------------|
| `home_screen.dart` | Entry/home screen shown at `/`. |
| `page1.dart` | Demo page 1, accessible at `/page1`. |
| `page2.dart` | Main shell page at `/page2`. Hosts a `BottomNavigationBar` with three tabs (`LocationListScreen`, `KeyboardScreen`, `MapScreen`). Uses `IndexedStack` so GoRouter can navigate over the tab content. |
| `location_list_screen.dart` | Tab 0 of Page2. Shows a scrollable list of location cards. Tapping a card navigates to `DetailLocationListScreen` via `context.push('/page2/location-list/detail')`. |
| `detail_location_list_screen.dart` | Detail view for a selected location, pushed on top of the GoRouter stack at `/page2/location-list/detail`. |
| `keyboard_screen.dart` | Tab 1 of Page2. Keyboard-based input screen. |
| `map_screen.dart` | Tab 2 of Page2. Map display screen. |
| `audio_screen.dart` | Audio playback screen, navigated to from Page2 sub-routes. |

## Dependencies

- `go_router` — all navigation uses `context.push` / `context.pop` / `context.go`.
- `app_theme.dart` — shared color tokens (e.g., `themeRed`).
