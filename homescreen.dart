class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _tab = 0;
  final _tabs = const ['Favorit', 'Finansial', 'Hiburan', 'Pilihan Lain'];

  final _menus = const [
    _MenuItem('Nabung by\nSuperbank', Icons.savings_rounded, Color(0xFF7B4DEB), 'BARU'),
    _MenuItem('Pinjaman', Icons.request_quote_rounded, Color(0xFF5B2BD9), '100JT'),
    _MenuItem('Uang Elektronik', Icons.contactless_rounded, Color(0xFFF26B21), 'Rp 1'),
    _MenuItem('Angsuran Kredit', Icons.receipt_long_rounded, Color(0xFFE5457A)),
    _MenuItem('Pulsa/Paket\nData', Icons.phone_android_rounded, Color(0xFF2F6FED), 'PROMO'),
    _MenuItem('PLN', Icons.bolt_rounded, Color(0xFFF5A623), 'PROMO'),
    _MenuItem('Air PDAM', Icons.water_drop_rounded, Color(0xFF1E9BE8)),
    _MenuItem('Internet & TV\nKabel', Icons.live_tv_rounded, Color(0xFFF26B21)),
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [Color(0xFFCFC8F2), Color(0xFFE9E5F9)],
        ),
      ),
      child: SafeArea(
        bottom: false,
        child: Stack(
          children: [
            Column(
              children: [
                _topBar(),
                _balanceCard(),
                const SizedBox(height: 16),
                Expanded(child: _whiteSheet()),
              ],
            ),
            // Floating OVO STAMP
            Positioned(
              right: 8,
              bottom: 12,
              child: _stampButton(),
            ),
          ],
        ),
      ),
    );
  }

  Widget _topBar() {
    return Padding(
      padding: const EdgeInsets.fromLTRB(16, 12, 16, 16),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const Text('OVO',
              style: TextStyle(
                  fontSize: 38,
                  fontWeight: FontWeight.w300,
                  color: kPurple,
                  letterSpacing: 1)),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 12),
            decoration: BoxDecoration(
              color: const Color(0xFFB9ADEE),
              borderRadius: BorderRadius.circular(16),
            ),
            child: const Row(
              children: [
                Icon(Icons.discount_rounded, color: kPurple),
                SizedBox(width: 8),
                Text('Promo',
                    style: TextStyle(
                        color: kPurple,
                        fontWeight: FontWeight.bold,
                        fontSize: 16)),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _balanceCard() {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 16),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(18),
        gradient: const LinearGradient(
          colors: [Color(0xFF5B3FD0), Color(0xFF4B35B5)],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text('OVO Cash',
              style: TextStyle(
                  color: Colors.white, fontSize: 18, fontWeight: FontWeight.w500)),
          const SizedBox(height: 10),
          const Row(
            children: [
              Text('Total Saldo',
                  style: TextStyle(
                      color: Colors.white, fontWeight: FontWeight.bold, fontSize: 15)),
              SizedBox(width: 6),
              Icon(Icons.visibility_off_outlined, color: Colors.white, size: 16),
            ],
          ),
          const SizedBox(height: 4),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Row(
                crossAxisAlignment: CrossAxisAlignment.baseline,
                textBaseline: TextBaseline.alphabetic,
                children: [
                  Text('Rp ',
                      style: TextStyle(color: Colors.white, fontSize: 13)),
                  Text('0',
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 24,
                          fontWeight: FontWeight.bold)),
                ],
              ),
              Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 8, vertical: 6),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(24),
                ),
                child: const Row(
                  children: [
                    CircleAvatar(
                      radius: 12,
                      backgroundColor: kPurpleButton,
                      child: Text('P',
                          style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 13)),
                    ),
                    SizedBox(width: 6),
                    Text('OVO Points',
                        style: TextStyle(
                            color: kPurpleButton, fontWeight: FontWeight.bold)),
                    Icon(Icons.chevron_right, color: Colors.grey, size: 20),
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(height: 16),
          const Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              _CashAction(Icons.add_circle_outline_rounded, 'Top Up'),
              _CashAction(Icons.arrow_circle_up_rounded, 'Transfer'),
              _CashAction(Icons.account_balance_wallet_outlined, 'Tarik Tunai'),
              _CashAction(Icons.list_alt_rounded, 'History'),
            ],
          ),
        ],
      ),
    );
  }

  Widget _whiteSheet() {
    return Container(
      width: double.infinity,
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.vertical(top: Radius.circular(28)),
      ),
      child: ListView(
        padding: const EdgeInsets.fromLTRB(16, 20, 16, 24),
        children: [
          _upgradeBanner(),
          const SizedBox(height: 20),
          _tabRow(),
          const SizedBox(height: 16),
          _menuGrid(),
          const SizedBox(height: 16),
          const Divider(thickness: 6, color: Color(0xFFF3F3F3)),
          const SizedBox(height: 16),
          const Text('Kenali OVO Lebih Dekat',
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.w800)),
          const SizedBox(height: 8),
          const Text('Biar makin akrab, yuk cek tips seputar OVO di sini!',
              style: TextStyle(color: Colors.black54)),
          const SizedBox(height: 60),
        ],
      ),
    );
  }

  Widget _upgradeBanner() {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(14),
        boxShadow: const [BoxShadow(color: Colors.black12, blurRadius: 8)],
      ),
      child: Column(
        children: [
          Row(
            children: [
              Container(
                width: 56,
                height: 56,
                decoration: const BoxDecoration(
                  color: Color(0xFFFFE08A),
                  shape: BoxShape.circle,
                ),
                child: const Icon(Icons.workspace_premium_rounded,
                    color: kPurpleButton, size: 32),
              ),
              const SizedBox(width: 16),
              const Expanded(
                child: Text(
                  'Yuk, upgrade ke OVO Premier! Nikmatin akses dan benefit lengkap dari OVO!',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
                ),
              ),
            ],
          ),
          const SizedBox(height: 12),
          Align(
            alignment: Alignment.centerRight,
            child: ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                backgroundColor: kPurpleButton,
                foregroundColor: Colors.white,
                shape: const StadiumBorder(),
                padding:
                    const EdgeInsets.symmetric(horizontal: 32, vertical: 14),
              ),
              child: const Text('Upgrade',
                  style: TextStyle(fontWeight: FontWeight.bold)),
            ),
          ),
        ],
      ),
    );
  }

  Widget _tabRow() {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: List.generate(_tabs.length, (i) {
          final active = _tab == i;
          return GestureDetector(
            onTap: () => setState(() => _tab = i),
            child: Container(
              margin: const EdgeInsets.only(right: 8),
              padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 14),
              decoration: BoxDecoration(
                color: active ? const Color(0xFFF1EFF8) : Colors.transparent,
                borderRadius: BorderRadius.circular(30),
              ),
              child: Text(
                _tabs[i],
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 15,
                  color: active ? kPurple : Colors.black54,
                ),
              ),
            ),
          );
        }),
      ),
    );
  }

  Widget _menuGrid() {
    return GridView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: _menus.length,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 4,
        mainAxisSpacing: 8,
        crossAxisSpacing: 4,
        childAspectRatio: 0.78,
      ),
      itemBuilder: (_, i) => _menuTile(_menus[i]),
    );
  }

  Widget _menuTile(_MenuItem m) {
    return Column(
      children: [
        Stack(
          clipBehavior: Clip.none,
          alignment: Alignment.topCenter,
          children: [
            Container(
              margin: const EdgeInsets.only(top: 10),
              width: 66,
              height: 66,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: m.color.withOpacity(0.12),
              ),
              child: Icon(m.icon, color: m.color, size: 32),
            ),
            if (m.badge != null)
              Positioned(
                top: 0,
                child: Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
                  decoration: BoxDecoration(
                    color: const Color(0xFFE53935),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Text(m.badge!,
                      style: const TextStyle(
                          color: Colors.white,
                          fontSize: 10,
                          fontWeight: FontWeight.bold)),
                ),
              ),
          ],
        ),
        const SizedBox(height: 6),
        Text(m.label,
            textAlign: TextAlign.center,
            style: const TextStyle(fontSize: 13, fontWeight: FontWeight.w500)),
      ],
    );
  }

  Widget _stampButton() {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          width: 84,
          height: 84,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: const Color(0xFFFFF1D6),
            border: Border.all(color: Colors.grey.shade300, width: 5),
          ),
          child: const Center(
            child: Text(
              'OVO\nSTAMP',
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Color(0xFFE53935),
                fontWeight: FontWeight.w900,
                fontSize: 14,
              ),
            ),
          ),
        ),
        Transform.translate(
          offset: const Offset(0, -10),
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 6),
            decoration: BoxDecoration(
              color: const Color(0xFF2E9E4F),
              borderRadius: BorderRadius.circular(20),
            ),
            child: const Text(
              'Mulai Misi!',
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 12,
              ),
            ),
          ),
        ),
      ],
    );
  }
}