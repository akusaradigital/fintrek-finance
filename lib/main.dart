import 'package:flutter/material.dart';

void main() => runApp(const FinanceDevApp());

class FinanceDevApp extends StatelessWidget {
  const FinanceDevApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        brightness: Brightness.dark,
        scaffoldBackgroundColor: const Color(0xFF0B1020),
        colorScheme: const ColorScheme.dark(
          primary: Color(0xFF6366F1),
          secondary: Color(0xFF22C55E),
          surface: Color(0xFF121A2E),
        ),
        useMaterial3: true,
      ),
      home: const DevHome(),
    );
  }
}

class DevHome extends StatelessWidget {
  const DevHome({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 8),
              const Text(
                'Hi, Ollo!',
                style: TextStyle(fontSize: 28, fontWeight: FontWeight.w800),
              ),
              const SizedBox(height: 6),
              Text(
                'Dev mode scaffold ready',
                style: TextStyle(color: Colors.white.withOpacity(0.65)),
              ),
              const SizedBox(height: 20),
              _card(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: const [
                    Text('Quick Status', style: TextStyle(fontSize: 16, fontWeight: FontWeight.w700)),
                    SizedBox(height: 10),
                    Text('API URL connected'),
                    SizedBox(height: 4),
                    Text('Hot reload enabled'),
                    SizedBox(height: 4),
                    Text('Google Sheets backend ready'),
                  ],
                ),
              ),
              const SizedBox(height: 16),
              Row(
                children: const [
                  Expanded(child: _miniCard(title: 'Balance', value: 'Rp 0')),
                  SizedBox(width: 12),
                  Expanded(child: _miniCard(title: 'Income', value: 'Rp 0')),
                ],
              ),
              const SizedBox(height: 12),
              Row(
                children: const [
                  Expanded(child: _miniCard(title: 'Expense', value: 'Rp 0')),
                  SizedBox(width: 12),
                  Expanded(child: _miniCard(title: 'Sync', value: 'Ready')),
                ],
              ),
              const SizedBox(height: 16),
              _card(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text('Next step', style: TextStyle(fontSize: 16, fontWeight: FontWeight.w700)),
                    const SizedBox(height: 8),
                    Text(
                      'Ganti isi screen ini kapan saja.\n\nPencet r di terminal Flutter buat hot reload.',
                      style: TextStyle(color: Colors.white.withOpacity(0.78), height: 1.4),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _card({required Widget child}) => Container(
        width: double.infinity,
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: const Color(0xFF121A2E),
          borderRadius: BorderRadius.circular(20),
          border: Border.all(color: Colors.white.withOpacity(0.06)),
        ),
        child: child,
      );
}

class _miniCard extends StatelessWidget {
  const _miniCard({required this.title, required this.value});
  final String title;
  final String value;

  @override
  Widget build(BuildContext context) => Container(
        padding: const EdgeInsets.all(14),
        decoration: BoxDecoration(
          color: const Color(0xFF121A2E),
          borderRadius: BorderRadius.circular(18),
          border: Border.all(color: Colors.white.withOpacity(0.06)),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(title, style: TextStyle(color: Colors.white.withOpacity(0.7), fontSize: 12)),
            const SizedBox(height: 8),
            Text(value, style: const TextStyle(fontSize: 18, fontWeight: FontWeight.w800)),
          ],
        ),
      );
}
