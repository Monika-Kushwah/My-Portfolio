# Monika Kushwah — Flutter Portfolio

A fully functional Flutter portfolio app built with **GetX** state management.

## Project Structure

```
lib/
├── main.dart                        # GetMaterialApp entry point
├── bindings/
│   └── initial_binding.dart         # All GetX dependency injections
├── constants/
│   ├── app_colors.dart              # Color palette
│   └── app_text_styles.dart         # Text styles
├── controllers/
│   ├── nav_controller.dart          # Scroll navigation (GetX)
│   ├── contact_controller.dart      # Form + url_launcher (GetX)
│   ├── skills_controller.dart       # Animated skill bars (GetX Obs)
│   ├── experience_controller.dart   # 5-stage timeline data (GetX)
│   └── projects_controller.dart     # Project models + launch (GetX)
├── views/
│   ├── home_view.dart               # Main scaffold + GetView
│   └── sections/
│       ├── hero_section.dart        # Typewriter animation
│       ├── about_section.dart       # Avatar + stats
│       ├── skills_section.dart      # Animated progress bars
│       ├── projects_section.dart    # UbiAttendance + UbiHRM
│       ├── experience_section.dart  # 5-stage expandable timeline
│       ├── education_section.dart   # B.Tech + HSC cards
│       └── contact_section.dart    # Form + mail/github/linkedin
└── widgets/
    └── shared_widgets.dart          # HoverCard, PrimaryButton, SectionHeader, etc.
```

## Experience Timeline

| Period        | Role                                        |
|---------------|---------------------------------------------|
| June 2021     | Mobile Developer Intern                     |
| 2022          | Junior Flutter Developer                    |
| 2023          | Flutter Developer                           |
| 2024          | Senior Flutter Developer                    |
| 2025–Present  | Release Manager & Lead Software Engineer ✅ |

## Setup & Run

```bash
# 1. Install dependencies
flutter pub get

# 2. Run on device/emulator
flutter run

# 3. Build APK
flutter build apk --release

# 4. Build iOS
flutter build ios --release
```

## Dependencies

| Package               | Purpose                          |
|-----------------------|----------------------------------|
| get ^4.6.6            | State management + routing       |
| url_launcher ^6.2.5   | Open mail, phone, store links    |
| google_fonts ^6.1.0   | Inter font                       |
| animated_text_kit     | Typewriter hero animation        |
| font_awesome_flutter  | LinkedIn, GitHub icons           |
| visibility_detector   | Trigger skill bar animation      |

## Features

- Dark modern UI — purple/violet accent theme
- GetX for state management, dependency injection, reactive UI
- Smooth scroll navigation with section keys
- Expandable 5-stage experience timeline
- Animated skill progress bars (visibility-triggered)
- Real Play Store & App Store links
- Contact form opens Gmail with pre-filled subject/body
- Mobile responsive layout
