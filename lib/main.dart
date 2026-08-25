import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'models/app_state.dart';
import 'screens/home_screen.dart';
import 'screens/statistics_screen.dart';
import 'screens/wallet_screen.dart';
import 'screens/profile_screen.dart';
import 'screens/add_transaction_screen.dart';
import 'services/local_db_service.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final db = LocalDbService();
  await db.init();
  final state = AppState(db);
  await state.loadInitialData();

  runApp(
    ChangeNotifierProvider.value(
      value: state,
      child: const FinanceApp(),
    ),
  );
}

class FinanceApp extends StatelessWidget {
  const FinanceApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Fintrek Finance',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        brightness: Brightness.dark,
        scaffoldBackgroundColor: const Color(0xFF090D16),
        colorScheme: const ColorScheme.dark(
          primary: Color(0xFF6366F1),
          secondary: Color(0xFF22C55E),
          surface: Color(0xFF121A2E),
        ),
        useMaterial3: true,
      ),
      home: const MainNavigationScreen(),
    );
  }
}

class MainNavigationScreen extends StatefulWidget {
  const MainNavigationScreen({super.key});

  @override
  State<MainNavigationScreen> createState() => _MainNavigationScreenState();
}

class _MainNavigationScreenState extends State<MainNavigationScreen> {
  int _currentIndex = 0;

  final List<Widget> _screens = const [
    HomeScreen(),
    StatisticsScreen(),
    SizedBox(), // Placeholder for center button
    WalletScreen(),
    ProfileScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _screens[_currentIndex],
      floatingActionButton: FloatingActionButton(
        backgroundColor: const Color(0xFF6366F1),
        shape: const CircleBorder(),
        onPressed: () {
          showModalBottomSheet(
            context: context,
            isScrollControlled: true,
            backgroundColor: const Color(0xFF121A2E),
            shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.vertical(top: Radius.circular(24)),
            ),
            builder: (_) => const AddTransactionScreen(),
          );
        },
        child: const Icon(Icons.add, size: 30, color: Colors.white),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex == 2 ? 0 : _currentIndex,
        onTap: (index) {
          if (index != 2) {
            setState(() => _currentIndex = index);
          }
        },
        type: BottomNavigationBarType.fixed,
        backgroundColor: const Color(0xFF0D1322),
        selectedItemColor: const Color(0xFF6366F1),
        unselectedItemColor: Colors.grey,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home_filled), label: 'Home'),
          BottomNavigationBarItem(icon: Icon(Icons.bar_chart_rounded), label: 'Statistics'),
          BottomNavigationBarItem(icon: SizedBox(height: 24), label: ''),
          BottomNavigationBarItem(icon: Icon(Icons.account_balance_wallet_rounded), label: 'Wallet'),
          BottomNavigationBarItem(icon: Icon(Icons.person_rounded), label: 'Profile'),
        ],
      ),
    );
  }
}
