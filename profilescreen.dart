import 'package:flutter/material.dart';
import 'package:ovo_slicing/ovo.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  bool _fingerprint = false;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      bottom: false,
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          const Padding(
            padding: EdgeInsets.fromLTRB(16, 40, 16, 20),
            child: Text('Profile',
                style: TextStyle(fontSize: 32, fontWeight: FontWeight.w800)),
          ),
          _profileCard(),
          const SizedBox(height: 14),
          _loyaltyButton(),
          const SizedBox(height: 24),

          _sectionTitle('Akun'),
          _row(
            leading: const Icon(Icons.workspace_premium_outlined,
                color: Color(0xFFF5A623), size: 28),
            title: 'OVO Club',
            trailing: _upgradePill(),
          ),
          _row(
            leading: _blackCircle(const Text('P',
                style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 16))),
            title: 'OVO Points',
            trailing: _chevron(),
          ),
          _row(
            leading: _blackCircle(
                const Icon(Icons.star_rounded, color: Colors.white, size: 18)),
            title: 'OVO Stamp',
          ),
          _row(
            leading: const Icon(Icons.link_rounded, size: 28),
            title: 'Aplikasi Terhubung',
            newBadge: true,
            trailing: _chevron(),
          ),
          _sectionDivider(),

          _sectionTitle('Bantuan'),
          _row(
            leading: _blackCircle(const Icon(Icons.question_mark_rounded,
                color: Colors.white, size: 18)),
            title: 'Pusat Bantuan',
            trailing: _chevron(),
          ),
          _sectionDivider(),

          _sectionTitle('Keamanan'),
          _row(
            leading: const Icon(Icons.lock_rounded, size: 28),
            title: 'Ubah Security Code',
            trailing: _chevron(),
          ),
          _row(
            leading: const Icon(Icons.fingerprint_rounded, size: 30),
            title: 'Fingerprint',
            trailing: Switch(
              value: _fingerprint,
              activeColor: kPurpleButton,
              onChanged: (v) => setState(() => _fingerprint = v),
            ),
          ),
          _sectionDivider(),

          _sectionTitle('Tentang'),
          _row(
            leading: const Icon(Icons.workspace_premium_rounded, size: 28),
            title: 'Keuntungan Pakai OVO',
            trailing: _chevron(),
          ),
          _row(
            leading: const Icon(Icons.lightbulb_rounded, size: 28),
            title: 'Panduan OVO',
            trailing: _chevron(),
          ),
          _row(
            leading: const Icon(Icons.list_alt_rounded, size: 28),
            title: 'Syarat dan Ketentuan',
            trailing: _chevron(),
          ),
          _row(
            leading: const Icon(Icons.verified_user_rounded, size: 28),
            title: 'Kebijakan Privasi',
            trailing: _chevron(),
          ),

          Container(
            color: const Color(0xFFF3F3F3),
            padding: const EdgeInsets.fromLTRB(16, 16, 16, 24),
            margin: const EdgeInsets.only(top: 4),
            child: Column(
              children: [
                const Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('Version 3.170.0 (600)',
                        style: TextStyle(color: Colors.black54)),
                    Text('#pakeOVOaja',
                        style: TextStyle(color: Colors.black54)),
                  ],
                ),
                const SizedBox(height: 16),
                SizedBox(
                  width: double.infinity,
                  height: 56,
                  child: ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      backgroundColor: kPurpleButton,
                      foregroundColor: Colors.white,
                      shape: const StadiumBorder(),
                    ),
                    child: const Text('Sign Out',
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.bold)),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _profileCard() {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 16),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey.shade300),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Row(
        children: [
          const CircleAvatar(
            radius: 31,
            backgroundColor: kPurpleLight,
            child: Icon(Icons.person_rounded, color: kPurpleButton, size: 34),
          ),
          const SizedBox(width: 16),
          const Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Azra Yasmin',
                    style:
                        TextStyle(fontSize: 18, fontWeight: FontWeight.w700)),
                SizedBox(height: 4),
                Text('082228140295', style: TextStyle(fontSize: 15)),
              ],
            ),
          ),
          TextButton(
            onPressed: () {},
            child: const Text('Ubah',
                style: TextStyle(
                    color: Color(0xFF1565C0), fontWeight: FontWeight.bold)),
          ),
        ],
      ),
    );
  }

  Widget _loyaltyButton() {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 16),
      height: 70,
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey.shade300),
        borderRadius: BorderRadius.circular(20),
      ),
      child: const Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(Icons.view_week_rounded, size: 36),
          SizedBox(width: 12),
          Text('Loyalty Code',
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.w800)),
        ],
      ),
    );
  }

  Widget _sectionTitle(String t) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(16, 8, 16, 8),
      child: Text(t,
          style: const TextStyle(fontSize: 22, fontWeight: FontWeight.w800)),
    );
  }

  Widget _sectionDivider() {
    return Container(
      height: 14,
      margin: const EdgeInsets.symmetric(vertical: 8),
      color: const Color(0xFFF3F3F3),
    );
  }

  Widget _row({
    required Widget leading,
    required String title,
    Widget? trailing,
    bool newBadge = false,
  }) {
    return InkWell(
      onTap: () {},
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 16),
        padding: const EdgeInsets.symmetric(vertical: 16),
        decoration: BoxDecoration(
          border: Border(bottom: BorderSide(color: Colors.grey.shade200)),
        ),
        child: Row(
          children: [
            SizedBox(width: 32, child: Center(child: leading)),
            const SizedBox(width: 24),
            Text(title,
                style:
                    const TextStyle(fontSize: 17, fontWeight: FontWeight.w700)),
            if (newBadge)
              Container(
                margin: const EdgeInsets.only(left: 6, bottom: 12),
                padding:
                    const EdgeInsets.symmetric(horizontal: 4, vertical: 1),
                decoration: BoxDecoration(
                  color: const Color(0xFFE53935),
                  borderRadius: BorderRadius.circular(4),
                ),
                child: const Text('NEW',
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 8,
                        fontWeight: FontWeight.bold)),
              ),
            const Spacer(),
            if (trailing != null) trailing,
          ],
        ),
      ),
    );
  }

  Widget _blackCircle(Widget child) {
    return Container(
      width: 30,
      height: 30,
      decoration: const BoxDecoration(color: Colors.black, shape: BoxShape.circle),
      child: Center(child: child),
    );
  }

  Widget _chevron() =>
      const Icon(Icons.chevron_right_rounded, size: 28, color: Colors.black87);

  Widget _upgradePill() {
    return ElevatedButton(
      onPressed: () {},
      style: ElevatedButton.styleFrom(
        backgroundColor: kPurpleButton,
        foregroundColor: Colors.white,
        shape: const StadiumBorder(),
        padding: const EdgeInsets.symmetric(horizontal: 28, vertical: 14),
      ),
      child: const Text('Upgrade', style: TextStyle(fontWeight: FontWeight.bold)),
    );
  }
}