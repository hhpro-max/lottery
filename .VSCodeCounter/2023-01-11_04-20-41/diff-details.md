# Diff Details

Date : 2023-01-11 04:20:41

Directory /media/hhpro/DL/Projects/LOT/lottery/server

Total : 45 files,  2228 codes, -5 comments, -105 blanks, all 2118 lines

[Summary](results.md) / [Details](details.md) / [Diff Summary](diff.md) / Diff Details

## Files
| filename | language | code | comment | blank | total |
| :--- | :--- | ---: | ---: | ---: | ---: |
| [lib/common/theme/custom_colors.dart](/lib/common/theme/custom_colors.dart) | Dart | -14 | -2 | -2 | -18 |
| [lib/common/theme/custom_text_theme.dart](/lib/common/theme/custom_text_theme.dart) | Dart | -16 | -2 | -3 | -21 |
| [lib/common/theme/custom_theme.dart](/lib/common/theme/custom_theme.dart) | Dart | -51 | -2 | -2 | -55 |
| [lib/common/widgets/custom_common_appbar.dart](/lib/common/widgets/custom_common_appbar.dart) | Dart | -11 | 0 | -2 | -13 |
| [lib/common/widgets/custom_common_elevatedbutton.dart](/lib/common/widgets/custom_common_elevatedbutton.dart) | Dart | -5 | 0 | -2 | -7 |
| [lib/common/widgets/custom_common_textbutton.dart](/lib/common/widgets/custom_common_textbutton.dart) | Dart | -5 | 0 | -2 | -7 |
| [lib/common/widgets/custom_common_textformfield.dart](/lib/common/widgets/custom_common_textformfield.dart) | Dart | -17 | 0 | -2 | -19 |
| [lib/common/widgets/loading_opacity_screen.dart](/lib/common/widgets/loading_opacity_screen.dart) | Dart | -23 | 0 | -3 | -26 |
| [lib/features/auth/screens/sign_up_screen.dart](/lib/features/auth/screens/sign_up_screen.dart) | Dart | -101 | 0 | -3 | -104 |
| [lib/features/auth/screens/sing_in_screen.dart](/lib/features/auth/screens/sing_in_screen.dart) | Dart | -82 | 0 | -3 | -85 |
| [lib/features/auth/services/auth_services.dart](/lib/features/auth/services/auth_services.dart) | Dart | -85 | -4 | -6 | -95 |
| [lib/features/home/screens/home_screen.dart](/lib/features/home/screens/home_screen.dart) | Dart | -40 | -1 | -6 | -47 |
| [lib/features/home/services/home_services.dart](/lib/features/home/services/home_services.dart) | Dart | -29 | -4 | -6 | -39 |
| [lib/features/home/widgets/custom_appbar.dart](/lib/features/home/widgets/custom_appbar.dart) | Dart | -18 | 0 | -6 | -24 |
| [lib/features/home/widgets/custom_drawer.dart](/lib/features/home/widgets/custom_drawer.dart) | Dart | -37 | -1 | -8 | -46 |
| [lib/features/home/widgets/custom_switch.dart](/lib/features/home/widgets/custom_switch.dart) | Dart | -5 | 0 | -4 | -9 |
| [lib/features/home/widgets/main_lottercard_widget.dart](/lib/features/home/widgets/main_lottercard_widget.dart) | Dart | -55 | 0 | -6 | -61 |
| [lib/features/lottery/screens/lottery_card_screen.dart](/lib/features/lottery/screens/lottery_card_screen.dart) | Dart | -50 | -1 | -9 | -60 |
| [lib/features/lottery/widgets/lottery_info.dart](/lib/features/lottery/widgets/lottery_info.dart) | Dart | -87 | -1 | -10 | -98 |
| [lib/features/lottery/widgets/lottery_play.dart](/lib/features/lottery/widgets/lottery_play.dart) | Dart | -52 | -1 | -5 | -58 |
| [lib/features/profile/screen/profile_screen.dart](/lib/features/profile/screen/profile_screen.dart) | Dart | -33 | -1 | -3 | -37 |
| [lib/helpers/applogger/app_logger.dart](/lib/helpers/applogger/app_logger.dart) | Dart | -12 | 0 | -2 | -14 |
| [lib/helpers/applogger/logger_config.dart](/lib/helpers/applogger/logger_config.dart) | Dart | -14 | 0 | -6 | -20 |
| [lib/helpers/config.dart](/lib/helpers/config.dart) | Dart | -14 | -3 | -3 | -20 |
| [lib/helpers/error_handler.dart](/lib/helpers/error_handler.dart) | Dart | -28 | 0 | -3 | -31 |
| [lib/helpers/show_custom_alertdialog.dart](/lib/helpers/show_custom_alertdialog.dart) | Dart | -19 | 0 | -1 | -20 |
| [lib/helpers/utils.dart](/lib/helpers/utils.dart) | Dart | -4 | 0 | -5 | -9 |
| [lib/main.dart](/lib/main.dart) | Dart | -57 | -4 | -4 | -65 |
| [lib/models/lottery_card.dart](/lib/models/lottery_card.dart) | Dart | -51 | -1 | -7 | -59 |
| [lib/models/user.dart](/lib/models/user.dart) | Dart | -31 | -1 | -8 | -40 |
| [lib/providers/app_provider.dart](/lib/providers/app_provider.dart) | Dart | -30 | 0 | 0 | -30 |
| [lib/providers/user_provider.dart](/lib/providers/user_provider.dart) | Dart | -25 | 0 | -2 | -27 |
| [server/app.js](/server/app.js) | JavaScript | 35 | 7 | 1 | 43 |
| [server/configs/config.env](/server/configs/config.env) | Environment Variables | 2 | 0 | 0 | 2 |
| [server/logs/logger.js](/server/logs/logger.js) | JavaScript | 16 | 0 | 2 | 18 |
| [server/middlewares/validSignupCheck.js](/server/middlewares/validSignupCheck.js) | JavaScript | 0 | 0 | 1 | 1 |
| [server/models/lotteryDescriptions.js](/server/models/lotteryDescriptions.js) | JavaScript | 43 | 0 | 3 | 46 |
| [server/models/lotteryImages.js](/server/models/lotteryImages.js) | JavaScript | 24 | 0 | 2 | 26 |
| [server/models/lotterycard.js](/server/models/lotterycard.js) | JavaScript | 35 | 0 | 2 | 37 |
| [server/models/user.js](/server/models/user.js) | JavaScript | 24 | 0 | 4 | 28 |
| [server/package-lock.json](/server/package-lock.json) | JSON | 3,046 | 0 | 1 | 3,047 |
| [server/package.json](/server/package.json) | JSON | 25 | 0 | 1 | 26 |
| [server/routes/auth.js](/server/routes/auth.js) | JavaScript | 56 | 13 | 6 | 75 |
| [server/routes/connection.js](/server/routes/connection.js) | JavaScript | 7 | 0 | 2 | 9 |
| [server/routes/lottery.js](/server/routes/lottery.js) | JavaScript | 16 | 4 | 4 | 24 |

[Summary](results.md) / [Details](details.md) / [Diff Summary](diff.md) / Diff Details