import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../core/router/route_names.dart';

class LandmarkDetailScreen extends StatefulWidget {
  const LandmarkDetailScreen({super.key});

  @override
  State<LandmarkDetailScreen> createState() => _LandmarkDetailScreenState();
}

class _LandmarkDetailScreenState extends State<LandmarkDetailScreen> {
  final ScrollController _controller = ScrollController();

  final String paragraphText =
      'Khi ánh hoàng hôn buông xuống, thành phố bắt đầu khoác lên mình lớp áo rực rỡ của những ánh đèn neon, nhưng đâu đó giữa những khối bê tông cốt thép, một nhành hoa dại vẫn kiên cường vươn mình qua kẽ nứt của vỉa hè. Nó nhắc nhở chúng ta rằng, dù cuộc sống có hối hả và đầy áp lực đến đâu, sức sống mãnh liệt của tự nhiên vẫn luôn tồn tại âm thầm. Đôi khi, việc dừng lại một nhịp để quan sát những điều nhỏ bé ấy không phải là lãng phí thời gian, mà là cách để chúng ta tìm thấy sự cân bằng trong tâm hồn, giúp bản thân nhận ra vẻ đẹp hiện hữu ngay trong những góc khuất bình dị nhất của cuộc đời.';

  static const double _expandedHeight = 250;
  static const double _collapsedHeight = 80;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          ///  MAIN SCROLL
          CustomScrollView(
            controller: _controller,
            slivers: [
              /// ── HEADER (IMAGE + FLOATING TEXT) ─────────────
              SliverAppBar(
                expandedHeight: _expandedHeight,
                pinned: true,
                backgroundColor: Colors.white,
                elevation: 0,

                flexibleSpace: LayoutBuilder(
                  builder: (context, constraints) {
                    final currentHeight = constraints.biggest.height;

                    /// tính progress theo chiều cao thực tế
                    final progress = ((currentHeight - _collapsedHeight) /
                            (_expandedHeight - _collapsedHeight))
                        .clamp(0.0, 1.0);

                    final isVisible = progress > 0.8;

                    return Stack(
                      fit: StackFit.expand,
                      children: [
                        /// 🔹 IMAGE
                        Image.asset(
                          'assets/images/pic1.png',
                          fit: BoxFit.cover,
                        ),

                        /// OVERLAY GRADIENT
                        Container(
                          decoration: BoxDecoration(
                            gradient: LinearGradient(
                              begin: Alignment.bottomCenter,
                              end: Alignment.center,
                              colors: [
                                Colors.black.withValues(alpha: 0.5),
                                Colors.transparent,
                              ],
                            ),
                          ),
                        ),

                        /// FLOATING TEXT
                        Positioned(
                          left: 16,
                          right: 16,
                          bottom: 16,
                          child: AnimatedOpacity(
                            duration: const Duration(milliseconds: 100),
                            opacity: isVisible ? 1 : 0,
                            child: Container(
                              padding: const EdgeInsets.all(16),
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(12),
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.black.withValues(alpha: 0.1),
                                    blurRadius: 8,
                                    // offset: const Offset(0, 2),
                                  ),
                                ],
                              ),
                              child: const Text(
                                'Chào mừng bạn đến với trang 1',
                                style: TextStyle(
                                  fontSize: 15,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    );
                  },
                ),
              ),

              /// ── CONTENT ─────────────────────────────
              SliverToBoxAdapter(
                child: Container(
                  color: Colors.white,
                  padding: const EdgeInsets.fromLTRB(16, 16, 16, 100),
                  child: Text(
                    paragraphText,
                    style: const TextStyle(fontSize: 14, height: 1.6),
                  ),
                ),
              ),
            ],
          ),

          /// BOTTOM BUTTONS
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
              decoration: BoxDecoration(
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withValues(alpha: 0.08),
                    blurRadius: 6,
                    offset: const Offset(0, -2),
                  ),
                ],
              ),
              child: Row(
                children: [
                  Expanded(
                    child: ElevatedButton.icon(
                      onPressed: () {},
                      icon: const Icon(Icons.download, color: Colors.white),
                      label: const Text(
                        'Tải về',
                        style: TextStyle(color: Colors.white),
                      ),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.red[800],
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                        padding: const EdgeInsets.symmetric(vertical: 12),
                      ),
                    ),
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: ElevatedButton.icon(
                      onPressed: () => context.push(Routes.locationList),
                      icon: const Icon(
                        Icons.play_circle_outline,
                        color: Colors.white,
                      ),
                      label: const Text(
                        'Bắt đầu tour',
                        style: TextStyle(color: Colors.white),
                      ),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.red[800],
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                        padding: const EdgeInsets.symmetric(vertical: 12),
                      ),
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
}
