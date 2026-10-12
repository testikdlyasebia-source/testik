
import 'package:flutter/material.dart';

void main() {
  runApp(const MusicApp());
}

const Color backgroundColor = Color(0xFF0D0D14);
const Color cardColor = Color(0xFF191925);
const Color accentColor = Color(0xFFB69CFF);

class MusicApp extends StatelessWidget {
  const MusicApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Vibe Music',
      theme: ThemeData(
        brightness: Brightness.dark,
        scaffoldBackgroundColor: backgroundColor,
        colorScheme: ColorScheme.fromSeed(
          seedColor: accentColor,
          brightness: Brightness.dark,
        ),
        useMaterial3: true,
      ),
      home: const HomeScreen(),
    );
  }
}

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int selectedIndex = 0;
  bool isPlaying = false;
  bool isFavorite = false;

  final List<Map<String, String>> albums = [
    {
      'title': 'Midnight City',
      'artist': 'M83',
      'image':
          'https://images.unsplash.com/photo-1470225620780-dba8ba36b745?w=600',
    },
    {
      'title': 'After Hours',
      'artist': 'The Weeknd',
      'image':
          'https://images.unsplash.com/photo-1519608487953-e999c86e7455?w=600',
    },
    {
      'title': 'Dreamscape',
      'artist': 'Luna',
      'image':
          'https://images.unsplash.com/photo-1519681393784-d120267933ba?w=600',
    },
  ];

  final List<Map<String, dynamic>> playlists = [
    {
      'title': 'Night Drive',
      'subtitle': 'Для ночных поездок',
      'icon': Icons.nightlight_round,
      'color': Color(0xFF7557D9),
    },
    {
      'title': 'Deep Focus',
      'subtitle': 'Концентрация и работа',
      'icon': Icons.headphones_rounded,
      'color': Color(0xFF267D82),
    },
    {
      'title': 'Dark Energy',
      'subtitle': 'Твоя тёмная сторона',
      'icon': Icons.bolt_rounded,
      'color': Color(0xFFB34C72),
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: IndexedStack(
          index: selectedIndex,
          children: [
            buildHome(),
            buildSimplePage(
              Icons.explore_rounded,
              'Исследовать',
              'Найди музыку под своё настроение.',
            ),
            buildSimplePage(
              Icons.library_music_rounded,
              'Моя библиотека',
              'Твои любимые треки будут здесь.',
            ),
          ],
        ),
      ),
      bottomNavigationBar: Container(
        decoration: const BoxDecoration(
          color: Color(0xFF14141E),
          border: Border(
            top: BorderSide(color: Colors.white10),
          ),
        ),
        child: NavigationBar(
          backgroundColor: const Color(0xFF14141E),
          indicatorColor: accentColor.withValues(alpha: 0.16),
          selectedIndex: selectedIndex,
          onDestinationSelected: (index) {
            setState(() => selectedIndex = index);
          },
          destinations: const [
            NavigationDestination(
              icon: Icon(Icons.home_outlined),
              selectedIcon: Icon(Icons.home_rounded),
              label: 'Главная',
            ),
            NavigationDestination(
              icon: Icon(Icons.explore_outlined),
              selectedIcon: Icon(Icons.explore_rounded),
              label: 'Поиск',
            ),
            NavigationDestination(
              icon: Icon(Icons.library_music_outlined),
              selectedIcon: Icon(Icons.library_music_rounded),
              label: 'Библиотека',
            ),
          ],
        ),
      ),
    );
  }

  Widget buildHome() {
    return CustomScrollView(
      slivers: [
        SliverPadding(
          padding: const EdgeInsets.fromLTRB(22, 20, 22, 30),
          sliver: SliverList(
            delegate: SliverChildListDelegate([
              Row(
                children: [
                  Container(
                    width: 46,
                    height: 46,
                    decoration: BoxDecoration(
                      gradient: const LinearGradient(
                        colors: [accentColor, Color(0xFF7453DD)],
                      ),
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: const Icon(
                      Icons.graphic_eq_rounded,
                      color: Colors.white,
                      size: 28,
                    ),
                  ),
                  const SizedBox(width: 12),
                  const Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'VIBE',
                        style: TextStyle(
                          fontSize: 21,
                          fontWeight: FontWeight.w900,
                          letterSpacing: 3,
                        ),
                      ),
                      Text(
                        'MUSIC EXPERIENCE',
                        style: TextStyle(
                          fontSize: 9,
                          color: Colors.white54,
                          letterSpacing: 1.5,
                        ),
                      ),
                    ],
                  ),
                  const Spacer(),
                  IconButton(
                    onPressed: () {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          content: Text('Уведомлений пока нет'),
                        ),
                      );
                    },
                    icon: const Icon(Icons.notifications_none_rounded),
                  ),
                  CircleAvatar(
                    radius: 21,
                    backgroundColor: accentColor.withValues(alpha: 0.2),
                    child: const Icon(
                      Icons.person_rounded,
                      color: accentColor,
                    ),
                  ),
                ],
              ),

              const SizedBox(height: 35),

              const Text(
                'ТВОЙ МИР. ТВОЙ РИТМ.',
                style: TextStyle(
                  color: accentColor,
                  fontSize: 11,
                  letterSpacing: 2,
                  fontWeight: FontWeight.bold,
                ),
              ),

              const SizedBox(height: 10),

              const Text(
                'Почувствуй\nкаждый бит.',
                style: TextStyle(
                  fontSize: 39,
                  height: 1.12,
                  fontWeight: FontWeight.w800,
                  letterSpacing: -1.5,
                ),
              ),

              const SizedBox(height: 24),

              Container(
                height: 205,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(26),
                  gradient: const LinearGradient(
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                    colors: [
                      Color(0xFF443079),
                      Color(0xFF252044),
                      Color(0xFF171724),
                    ],
                  ),
                ),
                child: Stack(
                  children: [
                    Positioned(
                      right: -25,
                      top: -30,
                      child: Icon(
                        Icons.album_rounded,
                        size: 210,
                        color: Colors.white.withValues(alpha: 0.07),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(23),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 11,
                              vertical: 6,
                            ),
                            decoration: BoxDecoration(
                              color: Colors.white12,
                              borderRadius: BorderRadius.circular(20),
                            ),
                            child: const Text(
                              '✦  ПЛЕЙЛИСТ НЕДЕЛИ',
                              style: TextStyle(
                                fontSize: 9,
                                letterSpacing: 1,
                              ),
                            ),
                          ),
                          const Spacer(),
                          const Text(
                            'Lost in the\nNight',
                            style: TextStyle(
                              fontSize: 29,
                              height: 1.1,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const SizedBox(height: 7),
                          const Text(
                            '12 треков  •  48 минут',
                            style: TextStyle(
                              color: Colors.white60,
                              fontSize: 12,
                            ),
                          ),
                          const SizedBox(height: 14),
                          SizedBox(
                            height: 38,
                            child: ElevatedButton.icon(
                              onPressed: () {
                                setState(() => isPlaying = !isPlaying);
                              },
                              style: ElevatedButton.styleFrom(
                                backgroundColor: accentColor,
                                foregroundColor: backgroundColor,
                                padding: const EdgeInsets.symmetric(
                                  horizontal: 17,
                                ),
                              ),
                              icon: Icon(
                                isPlaying
                                    ? Icons.pause_rounded
                                    : Icons.play_arrow_rounded,
                              ),
                              label: Text(
                                isPlaying ? 'Пауза' : 'Слушать',
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 32),

              sectionTitle('Популярные альбомы', 'Все'),
              const SizedBox(height: 17),

              SizedBox(
                height: 218,
                child: ListView.separated(
                  scrollDirection: Axis.horizontal,
                  itemCount: albums.length,
                  separatorBuilder: (_, _) => const SizedBox(width: 15),
                  itemBuilder: (context, index) {
                    final album = albums[index];

                    return SizedBox(
                      width: 145,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          ClipRRect(
                            borderRadius: BorderRadius.circular(19),
                            child: Image.network(
                              album['image']!,
                              height: 145,
                              width: 145,
                              fit: BoxFit.cover,
                              errorBuilder: (_, _, _) => Container(
                                height: 145,
                                width: 145,
                                color: cardColor,
                                child: const Icon(
                                  Icons.music_note_rounded,
                                  size: 45,
                                  color: accentColor,
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(height: 10),
                          Text(
                            album['title']!,
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            style: const TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 14,
                            ),
                          ),
                          const SizedBox(height: 3),
                          Text(
                            album['artist']!,
                            style: const TextStyle(
                              color: Colors.white54,
                              fontSize: 12,
                            ),
                          ),
                        ],
                      ),
                    );
                  },
                ),
              ),

              const SizedBox(height: 25),

              sectionTitle('Твоё настроение', 'Подборки'),
              const SizedBox(height: 15),

              ...playlists.map((playlist) {
                return Container(
                  margin: const EdgeInsets.only(bottom: 11),
                  decoration: BoxDecoration(
                    color: cardColor,
                    borderRadius: BorderRadius.circular(18),
                  ),
                  child: ListTile(
                    contentPadding: const EdgeInsets.symmetric(
                      horizontal: 14,
                      vertical: 5,
                    ),
                    leading: Container(
                      height: 48,
                      width: 48,
                      decoration: BoxDecoration(
                        color: (playlist['color'] as Color)
                            .withValues(alpha: 0.2),
                        borderRadius: BorderRadius.circular(14),
                      ),
                      child: Icon(
                        playlist['icon'] as IconData,
                        color: playlist['color'] as Color,
                      ),
                    ),
                    title: Text(
                      playlist['title'] as String,
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 14,
                      ),
                    ),
                    subtitle: Text(
                      playlist['subtitle'] as String,
                      style: const TextStyle(
                        color: Colors.white54,
                        fontSize: 12,
                      ),
                    ),
                    trailing: IconButton(
                      onPressed: () {
                        setState(() => isPlaying = !isPlaying);
                      },
                      icon: const Icon(
                        Icons.play_circle_fill_rounded,
                        size: 34,
                        color: accentColor,
                      ),
                    ),
                  ),
                );
              }),

              const SizedBox(height: 100),
            ]),
          ),
        ),
      ],
    );
  }

  Widget sectionTitle(String title, String action) {
    return Row(
      children: [
        Expanded(
          child: Text(
            title,
            style: const TextStyle(
              fontSize: 19,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        Text(
          action,
          style: const TextStyle(
            color: accentColor,
            fontSize: 12,
          ),
        ),
      ],
    );
  }

  Widget buildSimplePage(
    IconData icon,
    String title,
    String description,
  ) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(30),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(icon, size: 65, color: accentColor),
            const SizedBox(height: 20),
            Text(
              title,
              style: const TextStyle(
                fontSize: 28,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 10),
            Text(
              description,
              textAlign: TextAlign.center,
              style: const TextStyle(
                color: Colors.white54,
                fontSize: 15,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
