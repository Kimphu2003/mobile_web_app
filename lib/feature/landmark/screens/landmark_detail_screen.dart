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

  final String paragraphText = 'Trong guồng quay hối hả của kỷ nguyên số, nơi mà mọi thứ dường như đều được đo lường bằng tốc độ và hiệu suất, con người đôi khi vô tình rơi vào trạng thái "sống vội" mà quên mất việc tận hưởng những khoảnh khắc hiện tại. Chúng ta mải mê đuổi theo những mục tiêu xa xôi, những cột mốc thành công được định nghĩa bởi xã hội, để rồi một ngày nhận ra rằng những giá trị chân thực nhất lại nằm ở những điều giản đơn nhất. Đó có thể là mùi hương nồng nàn của tách cà phê buổi sáng khi phố xá còn chưa kịp thức giấc, là âm thanh rì rào của lá cây trong một chiều lộng gió, hay đơn giản là một cuộc trò chuyện sâu sắc không bị ngắt quãng bởi tiếng thông báo từ điện thoại. Sự kết nối giữa con người và thế giới xung quanh không chỉ được xây dựng qua những đường truyền internet băng thông rộng, mà còn qua sự thấu cảm và những trải nghiệm thực tế. Việc dành thời gian để quan sát một nhành hoa dại vươn mình giữa những khối bê tông khô khốc, hay tự tay chăm chút cho một dự án cá nhân đầy tâm huyết, chính là cách để chúng ta tái tạo năng lượng và tìm lại bản ngã. Khi biết trân trọng sự tĩnh lặng và những khoảng lặng giữa các nốt nhạc của cuộc đời, ta sẽ thấy rằng hạnh phúc không phải là một đích đến cuối cùng, mà là một hành trình được dệt nên từ vô vàn những mảnh ghép bình dị nhưng lấp lánh sắc màu.';

  static const double _expandedHeight = 250;
  static const double _collapsedHeight = 80;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
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
                              width: double.infinity,
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
                              child: FittedBox(
                                fit: BoxFit.scaleDown,
                                alignment: Alignment.centerLeft,
                                child: Text(
                                  'Chào mừng bạn đến với trang 1',
                                  style: TextStyle(
                                    fontSize: size.width * 0.045,
                                  ),
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
