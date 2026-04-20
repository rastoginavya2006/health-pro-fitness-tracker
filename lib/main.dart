import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:intl/intl.dart';
import 'package:confetti/confetti.dart';
import 'package:fl_chart/fl_chart.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(
    ChangeNotifierProvider(
      create: (context) => FitnessState()..loadData(),
      child: const FitnessTrackerApp(),
    ),
  );
}

// --- APP & THEME ---
class FitnessTrackerApp extends StatelessWidget {
  const FitnessTrackerApp({super.key});

  @override
  Widget build(BuildContext context) {
    final state = context.watch<FitnessState>();
    
    return MaterialApp(
      title: 'Pro Fitness Tracker',
      debugShowCheckedModeBanner: false,
      themeMode: state.isDarkMode ? ThemeMode.dark : ThemeMode.light,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.teal, brightness: Brightness.light),
        useMaterial3: true,
        scaffoldBackgroundColor: Colors.grey[50],
        cardTheme: CardThemeData(
          elevation: 6,
          shadowColor: Colors.teal.withValues(alpha: 0.15),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(24)),
        ),
      ),
      darkTheme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.tealAccent, brightness: Brightness.dark),
        useMaterial3: true,
        scaffoldBackgroundColor: const Color(0xFF121212),
        cardTheme: CardThemeData(
          elevation: 6,
          shadowColor: Colors.black45,
          color: const Color(0xFF1E1E1E),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(24)),
        ),
      ),
      home: const DashboardScreen(),
    );
  }
}

// --- STATE MANAGEMENT ---
class FitnessState extends ChangeNotifier {
  int _waterIntake = 0;
  int _waterGoal = 2000;
  int _steps = 0;
  int _stepGoal = 8000;
  int _streakDays = 1;
  bool _isDarkMode = false;
  List<Map<String, dynamic>> _history = []; 
  bool _waterAlertShown = false;
  bool _stepAlertShown = false;

  int get waterIntake => _waterIntake;
  int get waterGoal => _waterGoal;
  int get steps => _steps;
  int get stepGoal => _stepGoal;
  int get streakDays => _streakDays;
  bool get isDarkMode => _isDarkMode;
  List<Map<String, dynamic>> get history => _history;

  double get waterProgress => _waterGoal > 0 ? (_waterIntake / _waterGoal).clamp(0.0, 1.0) : 0.0;
  double get stepProgress => _stepGoal > 0 ? (_steps / _stepGoal).clamp(0.0, 1.0) : 0.0;

  Future<void> loadData() async {
    final prefs = await SharedPreferences.getInstance();
    _waterIntake = prefs.getInt('waterIntake') ?? 0;
    _waterGoal = prefs.getInt('waterGoal') ?? 2000;
    _steps = prefs.getInt('steps') ?? 0;
    _stepGoal = prefs.getInt('stepGoal') ?? 8000;
    _streakDays = prefs.getInt('streakDays') ?? 1;
    _isDarkMode = prefs.getBool('isDarkMode') ?? false;
    
    final lastDateStr = prefs.getString('lastDate');
    final now = DateTime.now();
    
    if (lastDateStr != null) {
      final lastDate = DateTime.parse(lastDateStr);
      if (lastDate.day != now.day || lastDate.month != now.month || lastDate.year != now.year) {
        _waterIntake = 0;
        _steps = 0;
        _history = [];
        _waterAlertShown = false;
        _stepAlertShown = false;
        
        if (now.difference(lastDate).inDays == 1) {
          _streakDays++;
        } else {
          _streakDays = 1; 
        }
        saveData();
      }
    }
    notifyListeners();
  }

  Future<void> saveData() async {
    final prefs = await SharedPreferences.getInstance();
    prefs.setInt('waterIntake', _waterIntake);
    prefs.setInt('waterGoal', _waterGoal);
    prefs.setInt('steps', _steps);
    prefs.setInt('stepGoal', _stepGoal);
    prefs.setInt('streakDays', _streakDays);
    prefs.setBool('isDarkMode', _isDarkMode);
    prefs.setString('lastDate', DateTime.now().toIso8601String());
  }

  void toggleTheme() {
    HapticFeedback.lightImpact();
    _isDarkMode = !_isDarkMode;
    saveData();
    notifyListeners();
  }

  void addWater(BuildContext context, int amount, VoidCallback onGoalReached) {
    HapticFeedback.mediumImpact(); 
    _waterIntake += amount;
    _history.insert(0, {'type': 'water', 'amount': amount, 'time': DateTime.now()});
    
    if (_waterIntake >= _waterGoal && !_waterAlertShown) {
      _waterAlertShown = true;
      onGoalReached(); // Trigger Confetti!
      _showCongratulatoryDialog(context, 'Water Goal Reached! 💧');
    }
    saveData();
    notifyListeners();
  }

  void addSteps(BuildContext context, int amount, VoidCallback onGoalReached) {
    HapticFeedback.mediumImpact(); 
    _steps += amount;
    _history.insert(0, {'type': 'step', 'amount': amount, 'time': DateTime.now()});
    
    if (_steps >= _stepGoal && !_stepAlertShown) {
      _stepAlertShown = true;
      onGoalReached(); // Trigger Confetti!
      _showCongratulatoryDialog(context, 'Step Goal Reached! 👟');
    }
    saveData();
    notifyListeners();
  }

  void updateGoals(int newWater, int newSteps) {
    _waterGoal = newWater;
    _stepGoal = newSteps;
    saveData();
    notifyListeners();
  }

  void _showCongratulatoryDialog(BuildContext context, String title) {
    HapticFeedback.heavyImpact(); 
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        title: Center(child: Text(title, style: const TextStyle(fontWeight: FontWeight.bold))),
        content: const Text('Incredible work! You are crushing your health goals today. Keep it up!', textAlign: TextAlign.center),
        actionsAlignment: MainAxisAlignment.center,
        actions: [
          FilledButton.tonal(
            onPressed: () => Navigator.of(context).pop(),
            child: const Text('Awesome!'),
          ),
        ],
      ),
    );
  }
}

// --- DASHBOARD UI (Stateful for Confetti) ---
class DashboardScreen extends StatefulWidget {
  const DashboardScreen({super.key});

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  late ConfettiController _confettiController;

  @override
  void initState() {
    super.initState();
    // Initialize Confetti Controller
    _confettiController = ConfettiController(duration: const Duration(seconds: 3));
  }

  @override
  void dispose() {
    _confettiController.dispose();
    super.dispose();
  }

  void _playConfetti() {
    _confettiController.play();
  }

  @override
  Widget build(BuildContext context) {
    final state = context.watch<FitnessState>();
    final theme = Theme.of(context);

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: const Text('Health Pro', style: TextStyle(fontWeight: FontWeight.w800, fontSize: 26)),
        actions: [
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
            decoration: BoxDecoration(
              color: Colors.orangeAccent.withValues(alpha: 0.2),
              borderRadius: BorderRadius.circular(20),
            ),
            child: Row(
              children: [
                const Icon(Icons.local_fire_department, color: Colors.orange, size: 20),
                const SizedBox(width: 4),
                Text('${state.streakDays} Days', style: const TextStyle(fontWeight: FontWeight.bold, color: Colors.orange)),
              ],
            ),
          ),
          IconButton(
            icon: Icon(state.isDarkMode ? Icons.light_mode : Icons.dark_mode),
            onPressed: state.toggleTheme,
          ),
          IconButton(
            icon: const Icon(Icons.settings_outlined),
            onPressed: () => _openSettings(context, state),
          ),
        ],
      ),
      body: Stack(
        children: [
          SafeArea(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: SingleChildScrollView(
                physics: const BouncingScrollPhysics(),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    const SizedBox(height: 10),
                    
                    // --- 1. Rings Row ---
                    Row(
                      children: [
                        Expanded(
                          child: Card(
                            child: Padding(
                              padding: const EdgeInsets.all(20.0),
                              child: _buildGradientRing(
                                label: 'Hydration',
                                progress: state.waterProgress,
                                valueText: '${state.waterIntake} ml',
                                colors: [Colors.blue, Colors.cyanAccent],
                                icon: Icons.water_drop,
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(width: 16),
                        Expanded(
                          child: Card(
                            child: Padding(
                              padding: const EdgeInsets.all(20.0),
                              child: _buildGradientRing(
                                label: 'Activity',
                                progress: state.stepProgress,
                                valueText: '${state.steps}',
                                colors: [Colors.purple, Colors.pinkAccent],
                                icon: Icons.directions_run,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 24),

                    // --- 2. Analytics Chart 📊 ---
                    Text('Analytics', style: theme.textTheme.titleLarge?.copyWith(fontWeight: FontWeight.bold)),
                    const SizedBox(height: 12),
                    Card(
                      child: Padding(
                        padding: const EdgeInsets.all(20.0),
                        child: SizedBox(
                          height: 180,
                          child: _buildActivityChart(state, theme),
                        ),
                      ),
                    ),
                    const SizedBox(height: 24),
                    
                    // --- 3. Log History ---
                    Text('Today\'s Log', style: theme.textTheme.titleLarge?.copyWith(fontWeight: FontWeight.bold)),
                    const SizedBox(height: 12),
                    
                    state.history.isEmpty
                        ? Center(
                            child: Padding(
                              padding: const EdgeInsets.all(24.0),
                              child: Text('No activity yet.\nLet\'s get moving!', textAlign: TextAlign.center, style: TextStyle(color: theme.colorScheme.onSurface.withValues(alpha: 0.5))),
                            ),
                          )
                        : ListView.builder(
                            physics: const NeverScrollableScrollPhysics(), // Scroll handled by SingleChildScrollView
                            shrinkWrap: true,
                            itemCount: state.history.length > 5 ? 5 : state.history.length, // Show latest 5
                            itemBuilder: (context, index) {
                              final item = state.history[index];
                              final isWater = item['type'] == 'water';
                              return Card(
                                elevation: 0,
                                color: theme.colorScheme.surfaceContainerHighest.withValues(alpha: 0.4),
                                margin: const EdgeInsets.only(bottom: 8),
                                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
                                child: ListTile(
                                  leading: Container(
                                    padding: const EdgeInsets.all(10),
                                    decoration: BoxDecoration(
                                      color: isWater ? Colors.blue.withValues(alpha: 0.2) : Colors.purple.withValues(alpha: 0.2),
                                      shape: BoxShape.circle,
                                    ),
                                    child: Icon(
                                      isWater ? Icons.water_drop : Icons.directions_walk,
                                      color: isWater ? Colors.blue : Colors.purple,
                                    ),
                                  ),
                                  title: Text(
                                    isWater ? '+${item['amount']} ml Water' : '+${item['amount']} Steps',
                                    style: const TextStyle(fontWeight: FontWeight.w600),
                                  ),
                                  trailing: Text(
                                    DateFormat('h:mm a').format(item['time'] as DateTime),
                                    style: TextStyle(color: theme.colorScheme.onSurfaceVariant),
                                  ),
                                ),
                              );
                            },
                          ),
                    const SizedBox(height: 100), // Padding for bottom buttons
                  ],
                ),
              ),
            ),
          ),
          
          // Confetti Animation Overlay 🎉
          Align(
            alignment: Alignment.topCenter,
            child: ConfettiWidget(
              confettiController: _confettiController,
              blastDirectionality: BlastDirectionality.explosive,
              shouldLoop: false,
              colors: const [Colors.green, Colors.blue, Colors.pink, Colors.orange, Colors.purple],
            ),
          ),
          
          // Fixed Bottom Action Buttons
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              padding: const EdgeInsets.all(16.0),
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.bottomCenter,
                  end: Alignment.topCenter,
                  colors: [theme.scaffoldBackgroundColor, theme.scaffoldBackgroundColor.withValues(alpha: 0.0)],
                )
              ),
              child: Row(
                children: [
                  Expanded(
                    child: FilledButton.icon(
                      style: FilledButton.styleFrom(
                        backgroundColor: Colors.blue,
                        padding: const EdgeInsets.symmetric(vertical: 16),
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
                      ),
                      onPressed: () => state.addWater(context, 250, _playConfetti),
                      icon: const Icon(Icons.add),
                      label: const Text('Drink Water'),
                    ),
                  ),
                  const SizedBox(width: 16),
                  Expanded(
                    child: FilledButton.icon(
                      style: FilledButton.styleFrom(
                        backgroundColor: Colors.purple,
                        padding: const EdgeInsets.symmetric(vertical: 16),
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
                      ),
                      onPressed: () => state.addSteps(context, 500, _playConfetti),
                      icon: const Icon(Icons.add),
                      label: const Text('Add Steps'),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  // --- CHART WIDGET ---
  Widget _buildActivityChart(FitnessState state, ThemeData theme) {
    if (state.history.isEmpty) {
      return Center(child: Text('Log activity to see your chart!', style: TextStyle(color: theme.hintColor)));
    }

    // Get the last 5 logs for the chart
    final recentHistory = state.history.take(6).toList().reversed.toList();
    
    return BarChart(
      BarChartData(
        alignment: BarChartAlignment.spaceAround,
        maxY: 1000,
        barTouchData: BarTouchData(enabled: false),
        titlesData: FlTitlesData(
          show: true,
          bottomTitles: AxisTitles(
            sideTitles: SideTitles(
              showTitles: true,
              getTitlesWidget: (value, meta) {
                if (value.toInt() >= recentHistory.length) return const SizedBox.shrink();
                final item = recentHistory[value.toInt()];
                return Padding(
                  padding: const EdgeInsets.only(top: 8.0),
                  child: Icon(
                    item['type'] == 'water' ? Icons.water_drop : Icons.directions_walk,
                    color: item['type'] == 'water' ? Colors.blue : Colors.purple,
                    size: 16,
                  ),
                );
              },
            ),
          ),
          leftTitles: AxisTitles(sideTitles: SideTitles(showTitles: false)),
          topTitles: AxisTitles(sideTitles: SideTitles(showTitles: false)),
          rightTitles: AxisTitles(sideTitles: SideTitles(showTitles: false)),
        ),
        gridData: FlGridData(show: false),
        borderData: FlBorderData(show: false),
        barGroups: recentHistory.asMap().entries.map((entry) {
          final index = entry.key;
          final item = entry.value;
          final isWater = item['type'] == 'water';
          final val = (item['amount'] as int).toDouble();
          
          return BarChartGroupData(
            x: index,
            barRods: [
              BarChartRodData(
                toY: val > 1000 ? 1000 : val, // Cap visual height
                color: isWater ? Colors.blue : Colors.purple,
                width: 16,
                borderRadius: BorderRadius.circular(4),
                backDrawRodData: BackgroundBarChartRodData(
                  show: true,
                  toY: 1000,
                  color: theme.colorScheme.surfaceContainerHighest.withValues(alpha: 0.5),
                ),
              ),
            ],
          );
        }).toList(),
      ),
    );
  }

  Widget _buildGradientRing({
    required String label,
    required double progress,
    required String valueText,
    required List<Color> colors,
    required IconData icon,
  }) {
    return Column(
      children: [
        SizedBox(
          height: 110,
          width: 110,
          child: Stack(
            fit: StackFit.expand,
            children: [
              TweenAnimationBuilder<double>(
                tween: Tween<double>(begin: 0.0, end: progress),
                duration: const Duration(milliseconds: 1200),
                curve: Curves.easeOutCirc, 
                builder: (context, value, _) => CircularProgressIndicator(
                  value: value,
                  strokeWidth: 10,
                  backgroundColor: colors.first.withValues(alpha: 0.1),
                  valueColor: AlwaysStoppedAnimation<Color>(colors.last),
                  strokeCap: StrokeCap.round, 
                ),
              ),
              Center(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Icon(icon, color: colors.last, size: 26),
                    const SizedBox(height: 4),
                    Text('${(progress * 100).toInt()}%', style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 18)),
                  ],
                ),
              )
            ],
          ),
        ),
        const SizedBox(height: 16),
        Text(valueText, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 18)),
        Text(label, style: const TextStyle(color: Colors.grey, fontSize: 12)),
      ],
    );
  }

  void _openSettings(BuildContext context, FitnessState state) {
    HapticFeedback.selectionClick();
    final waterController = TextEditingController(text: state.waterGoal.toString());
    final stepController = TextEditingController(text: state.stepGoal.toString());

    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      shape: const RoundedRectangleBorder(borderRadius: BorderRadius.vertical(top: Radius.circular(32))),
      builder: (context) => Padding(
        padding: EdgeInsets.only(
          bottom: MediaQuery.of(context).viewInsets.bottom + 24,
          left: 24, right: 24, top: 32,
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const Text('Set Your Goals 🎯', style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
            const SizedBox(height: 24),
            TextField(
              controller: waterController,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                labelText: 'Daily Water Goal (ml)',
                filled: true,
                border: OutlineInputBorder(borderRadius: BorderRadius.circular(16), borderSide: BorderSide.none),
                prefixIcon: const Icon(Icons.water_drop, color: Colors.blue),
              ),
            ),
            const SizedBox(height: 16),
            TextField(
              controller: stepController,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                labelText: 'Daily Step Goal',
                filled: true,
                border: OutlineInputBorder(borderRadius: BorderRadius.circular(16), borderSide: BorderSide.none),
                prefixIcon: const Icon(Icons.directions_run, color: Colors.purple),
              ),
            ),
            const SizedBox(height: 32),
            FilledButton(
              style: FilledButton.styleFrom(
                padding: const EdgeInsets.symmetric(vertical: 18),
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16))
              ),
              onPressed: () {
                HapticFeedback.lightImpact();
                final newWater = int.tryParse(waterController.text) ?? state.waterGoal;
                final newSteps = int.tryParse(stepController.text) ?? state.stepGoal;
                state.updateGoals(newWater, newSteps);
                Navigator.pop(context);
              },
              child: const Text('Save My Goals', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
            ),
          ],
        ),
      ),
    );
  }
}