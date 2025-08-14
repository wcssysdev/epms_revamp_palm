# epms_tech

lib/
│
├── core/
│   ├── constants/        # Warna, ukuran font, padding, dsb
│   ├── utils/            # Helper function (format date, currency, dsb)
│   ├── theme/            # ThemeData global (light/dark)
│   └── config/           # Konfigurasi API baseURL, dll
│
├── data/
│   ├── models/           # Model data (User, OPH, HarvestPlan, dsb)
│   ├── repositories/     # Repository untuk handle request API & database
│   └── datasources/      # API service / local database (SharedPreferences, SQLite, dll)
│
├── logic/
│   ├── blocs/            # Semua BLoC dipisah per fitur
│   │   ├── auth/         
│   │   │   ├── auth_bloc.dart
│   │   │   ├── auth_event.dart
│   │   │   └── auth_state.dart
│   │   ├── oph/
│   │   │   ├── oph_bloc.dart
│   │   │   ├── oph_event.dart
│   │   │   └── oph_state.dart
│   │   ├── harvesting_plan/
│   │   └── backlog/
│   │
│   └── cubits/           # Jika ada state sederhana (misal toggle, counter)
│
├── presentation/
│   ├── widgets/          # Reusable Widget
│   │   ├── oph_card.dart
│   │   ├── oph_form.dart
│   │   └── custom_button.dart
│   │
│   ├── screens/
│   │   ├── login/
│   │   │   ├── login_screen.dart
│   │   │   └── login_form.dart
│   │   ├── mandor_setup/
│   │   ├── main/
│   │   ├── create_oph/
│   │   ├── history_oph/
│   │   ├── today_plan/
│   │   ├── backlog_report/
│   │   ├── administration/
│   │   │   ├── change_data_oph/
│   │   │   ├── replace_lost_oph/
│   │   │   └── split_oph/
│   │   └── splash/
│
└── main.dart

=====================================================
REUSABLE WIDGET

Karena banyak fitur di Checker Produksi Sawit punya tampilan mirip, kita bikin komponen reusable:
    OphCard → untuk menampilkan data OPH di History, Today Plan, Backlog
    OphForm → untuk Create, Change, Replace, Split
    SectionHeader → judul section + tombol aksi
    CustomButton → untuk seluruh tombol
    CustomTextField → field input dengan style konsisten
    EmptyStateWidget → tampilan jika data kosong

====================================================
4️⃣ Alur Aplikasi
Splash → Login
    Jika token ada, langsung ke MainScreen

MainScreen (Bottom Tab / Drawer)
    Tab/Drawer menuju:
        Mandor Setup
        Create OPH
        History OPH
        Today Plan
        Backlog Report
        Administration (sub menu)
    Administration → sub screen:
        Change Data OPH
        Replace Lost OPH
        Split OPH
===================================================