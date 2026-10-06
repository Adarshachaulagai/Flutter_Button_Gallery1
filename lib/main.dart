import 'package:flutter/material.dart';

void main() {
  runApp(const ButtonGalleryApp());
}

class ButtonGalleryApp extends StatefulWidget {
  const ButtonGalleryApp({super.key});

  @override
  State<ButtonGalleryApp> createState() => _ButtonGalleryAppState();
}

class _ButtonGalleryAppState extends State<ButtonGalleryApp> {
  ThemeMode themeMode = ThemeMode.light;

  void changeTheme(bool dark) {
    setState(() {
      themeMode = dark ? ThemeMode.dark : ThemeMode.light;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Button Gallery',
      themeMode: themeMode,
      theme: ThemeData(
        useMaterial3: true,
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color(0xFF3F51B5),
        ),
        scaffoldBackgroundColor: const Color(0xFFF7F8FA),
      ),
      darkTheme: ThemeData(
        useMaterial3: true,
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color(0xFF3F51B5),
          brightness: Brightness.dark,
        ),
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => const LoginScreen(),
        '/gallery': (context) => const GalleryScreen(),
        '/profile': (context) => const ProfileScreen(),
        '/details': (context) => const DetailsScreen(),
        '/settings': (context) => SettingsScreen(
          isDark: themeMode == ThemeMode.dark,
          onThemeChanged: changeTheme,
        ),
      },
    );
  }
}

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  void login() {
    Navigator.pushReplacementNamed(context, '/gallery');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            padding: const EdgeInsets.symmetric(horizontal: 28),
            child: ConstrainedBox(
              constraints: const BoxConstraints(maxWidth: 420),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  const Icon(
                    Icons.widgets_outlined,
                    size: 64,
                  ),
                  const SizedBox(height: 24),
                  Text(
                    'Button Gallery',
                    textAlign: TextAlign.center,
                    style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    'Material buttons and navigation',
                    textAlign: TextAlign.center,
                    style: Theme.of(context).textTheme.bodyMedium,
                  ),
                  const SizedBox(height: 40),
                  TextField(
                    controller: emailController,
                    keyboardType: TextInputType.emailAddress,
                    decoration: const InputDecoration(
                      labelText: 'Email',
                      prefixIcon: Icon(Icons.email_outlined),
                      border: OutlineInputBorder(),
                    ),
                  ),
                  const SizedBox(height: 16),
                  TextField(
                    controller: passwordController,
                    obscureText: true,
                    decoration: const InputDecoration(
                      labelText: 'Password',
                      prefixIcon: Icon(Icons.lock_outline),
                      border: OutlineInputBorder(),
                    ),
                  ),
                  const SizedBox(height: 24),
                  FilledButton(
                    onPressed: login,
                    style: FilledButton.styleFrom(
                      minimumSize: const Size.fromHeight(50),
                    ),
                    child: const Text('Login'),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class GalleryScreen extends StatelessWidget {
  const GalleryScreen({super.key});

  void message(BuildContext context, String text) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text(text)),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Button Gallery'),
        actions: [
          IconButton(
            tooltip: 'Profile',
            onPressed: () {
              Navigator.pushNamed(context, '/profile');
            },
            icon: const Icon(Icons.person_outline),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (_) => const AddScreen(),
            ),
          );
        },
        child: const Icon(Icons.add),
      ),
      body: ListView(
        padding: const EdgeInsets.all(20),
        children: [
          Text(
            'Material Buttons',
            style: Theme.of(context).textTheme.headlineSmall?.copyWith(
              fontWeight: FontWeight.w700,
            ),
          ),
          const SizedBox(height: 6),
          Text(
            'Common button styles available in Flutter.',
            style: Theme.of(context).textTheme.bodyMedium,
          ),
          const SizedBox(height: 24),

          ElevatedButton(
            onPressed: () {
              message(context, 'Elevated button pressed');
            },
            child: const Text('Elevated Button'),
          ),

          const SizedBox(height: 12),

          FilledButton(
            onPressed: () {
              Navigator.pushNamed(context, '/profile');
            },
            child: const Text('Filled Button'),
          ),

          const SizedBox(height: 12),

          FilledButton.tonal(
            onPressed: () {
              Navigator.pushNamed(context, '/settings');
            },
            child: const Text('Filled Tonal Button'),
          ),

          const SizedBox(height: 12),

          OutlinedButton(
            onPressed: () {
              Navigator.pushNamed(context, '/details');
            },
            child: const Text('Outlined Button'),
          ),

          const SizedBox(height: 12),

          TextButton(
            onPressed: () {
              message(context, 'Text button pressed');
            },
            child: const Text('Text Button'),
          ),

          const SizedBox(height: 12),

          Row(
            children: [
              IconButton(
                tooltip: 'Favorite',
                onPressed: () {
                  message(context, 'Favorite selected');
                },
                icon: const Icon(Icons.favorite_border),
              ),
              const SizedBox(width: 8),
              const Text('Icon Button'),
            ],
          ),

          const SizedBox(height: 12),

          ElevatedButton.icon(
            onPressed: () {
              Navigator.pushNamed(context, '/profile');
            },
            icon: const Icon(Icons.person_outline),
            label: const Text('Profile'),
          ),

          const SizedBox(height: 28),

          Text(
            'Custom Style',
            style: Theme.of(context).textTheme.titleMedium?.copyWith(
              fontWeight: FontWeight.w600,
            ),
          ),
          const SizedBox(height: 12),

          ElevatedButton(
            onPressed: () {
              message(context, 'Custom button pressed');
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: const Color(0xFF3F51B5),
              foregroundColor: Colors.white,
              minimumSize: const Size.fromHeight(50),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
            ),
            child: const Text('Custom Button'),
          ),

          const SizedBox(height: 28),

          Text(
            'Navigation',
            style: Theme.of(context).textTheme.titleMedium?.copyWith(
              fontWeight: FontWeight.w600,
            ),
          ),
          const SizedBox(height: 12),

          ListTile(
            leading: const Icon(Icons.person_outline),
            title: const Text('Profile'),
            subtitle: const Text('View profile information'),
            trailing: const Icon(Icons.chevron_right),
            onTap: () {
              Navigator.pushNamed(context, '/profile');
            },
          ),

          ListTile(
            leading: const Icon(Icons.info_outline),
            title: const Text('Details'),
            subtitle: const Text('Application information'),
            trailing: const Icon(Icons.chevron_right),
            onTap: () {
              Navigator.pushNamed(context, '/details');
            },
          ),

          ListTile(
            leading: const Icon(Icons.settings_outlined),
            title: const Text('Settings'),
            subtitle: const Text('Appearance and preferences'),
            trailing: const Icon(Icons.chevron_right),
            onTap: () {
              Navigator.pushNamed(context, '/settings');
            },
          ),

          const SizedBox(height: 80),
        ],
      ),
    );
  }
}

class AddScreen extends StatelessWidget {
  const AddScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Add'),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(24),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Icon(
                Icons.add_circle_outline,
                size: 72,
              ),
              const SizedBox(height: 20),
              Text(
                'Add Screen',
                style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                  fontWeight: FontWeight.w700,
                ),
              ),
              const SizedBox(height: 8),
              const Text(
                'This screen was opened from the floating action button.',
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 24),
              FilledButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: const Text('Back'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Profile'),
      ),
      body: ListView(
        padding: const EdgeInsets.all(24),
        children: [
          const CircleAvatar(
            radius: 48,
            child: Icon(
              Icons.person,
              size: 48,
            ),
          ),
          const SizedBox(height: 20),
          Text(
            'Student Profile',
            textAlign: TextAlign.center,
            style: Theme.of(context).textTheme.headlineSmall?.copyWith(
              fontWeight: FontWeight.w700,
            ),
          ),
          const SizedBox(height: 4),
          Text(
            'Software Engineering Student',
            textAlign: TextAlign.center,
            style: Theme.of(context).textTheme.bodyLarge,
          ),
          const SizedBox(height: 32),
          const InfoRow(
            title: 'Role',
            value: 'Student',
          ),
          const InfoRow(
            title: 'Course',
            value: 'Bachelor of Software Engineering',
          ),
          const InfoRow(
            title: 'Application',
            value: 'Flutter Button Gallery',
          ),
          const SizedBox(height: 24),
          OutlinedButton(
            onPressed: () {
              Navigator.pop(context);
            },
            child: const Text('Back'),
          ),
        ],
      ),
    );
  }
}

class DetailsScreen extends StatelessWidget {
  const DetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Details'),
      ),
      body: ListView(
        padding: const EdgeInsets.all(24),
        children: [
          const Icon(
            Icons.widgets_outlined,
            size: 70,
          ),
          const SizedBox(height: 20),
          Text(
            'Application Details',
            textAlign: TextAlign.center,
            style: Theme.of(context).textTheme.headlineSmall?.copyWith(
              fontWeight: FontWeight.w700,
            ),
          ),
          const SizedBox(height: 28),
          const InfoRow(
            title: 'Application',
            value: 'Button Gallery',
          ),
          const InfoRow(
            title: 'Framework',
            value: 'Flutter',
          ),
          const InfoRow(
            title: 'Language',
            value: 'Dart',
          ),
          const InfoRow(
            title: 'Design',
            value: 'Material 3',
          ),
          const InfoRow(
            title: 'Version',
            value: '1.0.0',
          ),
          const SizedBox(height: 24),
          FilledButton(
            onPressed: () {
              Navigator.pop(context);
            },
            child: const Text('Back'),
          ),
        ],
      ),
    );
  }
}

class SettingsScreen extends StatefulWidget {
  final bool isDark;
  final ValueChanged<bool> onThemeChanged;

  const SettingsScreen({
    super.key,
    required this.isDark,
    required this.onThemeChanged,
  });

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  late bool darkMode;
  bool notifications = true;

  @override
  void initState() {
    super.initState();
    darkMode = widget.isDark;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Settings'),
      ),
      body: ListView(
        children: [
          const SizedBox(height: 12),
          SwitchListTile(
            title: const Text('Dark Mode'),
            subtitle: const Text('Use a dark appearance'),
            value: darkMode,
            onChanged: (value) {
              setState(() {
                darkMode = value;
              });
              widget.onThemeChanged(value);
            },
          ),
          SwitchListTile(
            title: const Text('Notifications'),
            subtitle: const Text('Receive application notifications'),
            value: notifications,
            onChanged: (value) {
              setState(() {
                notifications = value;
              });
            },
          ),
          const Divider(),
          ListTile(
            leading: const Icon(Icons.info_outline),
            title: const Text('About App'),
            subtitle: const Text('Application information'),
            onTap: () {
              showAboutDialog(
                context: context,
                applicationName: 'Button Gallery',
                applicationVersion: '1.0.0',
                applicationIcon: const Icon(
                  Icons.widgets_outlined,
                ),
                children: const [
                  Text(
                    'A Flutter application demonstrating '
                        'Material buttons and navigation.',
                  ),
                ],
              );
            },
          ),
          const SizedBox(height: 20),
          Padding(
            padding: const EdgeInsets.all(20),
            child: OutlinedButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: const Text('Back'),
            ),
          ),
        ],
      ),
    );
  }
}

class InfoRow extends StatelessWidget {
  final String title;
  final String value;

  const InfoRow({
    super.key,
    required this.title,
    required this.value,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 18),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: Theme.of(context).textTheme.labelLarge,
          ),
          const SizedBox(height: 4),
          Text(
            value,
            style: Theme.of(context).textTheme.bodyLarge,
          ),
          const SizedBox(height: 8),
          const Divider(),
        ],
      ),
    );
  }
}