import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CustomAppBar extends StatefulWidget implements PreferredSizeWidget {
  const CustomAppBar({super.key});

  @override
  Size get preferredSize => const Size.fromHeight(65.0);

  @override
  _CustomAppBarState createState() => _CustomAppBarState();
}

class _CustomAppBarState extends State<CustomAppBar> {
  final LayerLink _layerLink = LayerLink();
  OverlayEntry? _overlayEntry;

  void _showSearchOverlay() {
    _overlayEntry = OverlayEntry(
      builder: (context) => Positioned(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: Material(
          color: Colors.white,
          child: Column(
            children: [
              SafeArea(
                child: Row(
                  children: [
                    IconButton(
                      icon: const Icon(Icons.arrow_back),
                      onPressed: _hideSearchOverlay,
                    ),
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 30,
                        ),
                        child: TextFormField(
                          autofocus: true,
                          decoration: const InputDecoration(
                              hintText: 'جستجو در همه کالاها',
                              hintStyle: TextStyle(
                                  color: Color(0xFF62666d), fontSize: 20),
                              border: InputBorder.none,
                              contentPadding:
                                  EdgeInsets.symmetric(horizontal: 16.0),
                              enabledBorder: UnderlineInputBorder(
                                borderSide: BorderSide(color: Colors.blue),
                              )),
                          onChanged: (value) {
                            // آپدیت نتایج جستجو
                          },
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Expanded(
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                  child: Column(
                    children: [
                      const Row(
                        children: [
                          Icon(
                            Icons.history,
                            color: Color(0xFF62666d),
                          ),
                          SizedBox(
                            width: 15,
                          ),
                          Text(
                            'تاریخچه جستجو شما',
                            style: TextStyle(
                                color: Color(0xFF62666d), fontSize: 20),
                          ),
                          SizedBox(
                            width: 100,
                          ),
                          Icon(
                            Icons.delete_outline,
                            color: Color(0xFF62666d),
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          Container(
                            width: 100,
                            padding: const EdgeInsets.all(8),
                            decoration: BoxDecoration(
                              border: Border.all(),
                              borderRadius: BorderRadius.circular(20.0),
                            ),
                            child: const Text('sara'),
                          ),
                        ],
                      ),
                      const Divider(),
                      const Row(
                        children: [
                          Icon(
                            Icons.topic,
                            color: Color(0xFF62666d),
                          ),
                          SizedBox(
                            width: 15,
                          ),
                          Text(
                            'جستجوهای پرطرفدار',
                            style: TextStyle(
                                color: Color(0xFF62666d), fontSize: 20),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );

    Overlay.of(context).insert(_overlayEntry!);
  }

  void _hideSearchOverlay() {
    _overlayEntry?.remove();
    _overlayEntry = null;
  }

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.white,
      elevation: 10,
      shadowColor: Colors.grey,
      title: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8.0),
          color: const Color(0xFFF0F0F1),
        ),
        child: Container(
          decoration: BoxDecoration(
              color: const Color(0xffA1A3A8).withOpacity(0.25),
              borderRadius: BorderRadius.circular(8)),
          child: TextFormField(
            onTap: _showSearchOverlay,
            readOnly: true,
            decoration: InputDecoration(
              floatingLabelBehavior: FloatingLabelBehavior.always,
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8.0),
                borderSide: BorderSide.none,
              ),
              prefixIcon: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const Icon(Icons.search_rounded,
                        color: Color(0xFF424750), size: 30),
                    const SizedBox(width: 12),
                    const Text(
                      "جستجو در",
                      style: TextStyle(color: Color(0xFF62666d)),
                    ),
                    const SizedBox(width: 6),
                    SvgPicture.asset(
                      'assets/svg/logo.svg',
                      width: 80,
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
