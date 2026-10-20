import 'package:flutter/material.dart';

import '../data/mahasiswa.dart';
import '../widgets/info_row.dart';
import '../widgets/profile_header.dart';
import 'detail_page.dart';

class ProfilPage extends StatelessWidget {
  const ProfilPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Profil Mahasiswa'),
        centerTitle: true,
        backgroundColor: Theme.of(context).colorScheme.primary,
        foregroundColor: Colors.white,
        actions: [
          PopupMenuButton<String>(
            onSelected: (value) => ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text('Menu "$value" dipilih')),
            ),
            itemBuilder: (context) => const [
              PopupMenuItem(value: 'Bagikan', child: Text('Bagikan')),
              PopupMenuItem(value: 'Tentang', child: Text('Tentang')),
            ],
          ),
        ],
      ),
      drawer: const _MenuDrawer(),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const ProfileHeader(data: mahasiswa),
            Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                children: [
                  const _IdentitasCard(data: mahasiswa),
                  const SizedBox(height: 12),
                  const _InformasiTambahanCard(data: mahasiswa),
                  const SizedBox(height: 20),
                  SizedBox(
                    width: double.infinity,
                    height: 50,
                    child: ElevatedButton.icon(
                      onPressed: () => Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (_) => const DetailPage(data: mahasiswa),
                        ),
                      ),
                      icon: const Icon(Icons.arrow_forward),
                      label: const Text('Detail'),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Theme.of(context).colorScheme.primary,
                        foregroundColor: Colors.white,
                        textStyle: Theme.of(context).textTheme.labelLarge?.copyWith(
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                        ),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(14),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

/// Kartu identitas: NIM, Program Studi, Universitas, Hobi.
class _IdentitasCard extends StatelessWidget {
  const _IdentitasCard({required this.data});

  final Mahasiswa data;

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 0,
      color: Colors.white,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
        child: Column(
          children: [
            InfoRow(icon: Icons.badge, label: 'NIM', value: data.nim),
            const Divider(height: 1),
            InfoRow(
              icon: Icons.menu_book,
              label: 'Program Studi',
              value: data.programStudi,
            ),
            const Divider(height: 1),
            InfoRow(
              icon: Icons.account_balance,
              label: 'Universitas',
              value: data.universitas,
            ),
            const Divider(height: 1),
            InfoRow(
              icon: Icons.favorite,
              label: 'Hobi / Deskripsi',
              value: data.hobi,
            ),
          ],
        ),
      ),
    );
  }
}

/// Kartu "Informasi Tambahan": gambar di kiri, teks di kanan (Row).
class _InformasiTambahanCard extends StatelessWidget {
  const _InformasiTambahanCard({required this.data});

  final Mahasiswa data;

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;

    return Card(
      elevation: 0,
      color: Colors.white,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      child: Padding(
        padding: const EdgeInsets.all(14),
        child: Row(
          children: [
            Container(
              width: 72,
              height: 72,
              decoration: BoxDecoration(
                color: colors.primaryContainer,
                borderRadius: BorderRadius.circular(12),
              ),
              child: Icon(Icons.code, size: 36, color: colors.primary),
            ),
            const SizedBox(width: 14),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Informasi Tambahan',
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 6),
                  Text(
                    'Domisili ${data.domisili}. Saat ini fokus belajar '
                    'pengembangan aplikasi mobile dengan Flutter.',
                    style: TextStyle(color: colors.onSurfaceVariant),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

/// Menu samping yang dibuka dari ikon garis tiga di AppBar.
class _MenuDrawer extends StatelessWidget {
  const _MenuDrawer();

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          UserAccountsDrawerHeader(
            decoration: BoxDecoration(
              color: Theme.of(context).colorScheme.primary,
            ),
            currentAccountPicture: CircleAvatar(
              backgroundColor: Colors.white,
              child: Text(mahasiswa.inisial),
            ),
            accountName: Text(mahasiswa.nama),
            accountEmail: Text(mahasiswa.email),
          ),
          ListTile(
            leading: const Icon(Icons.person),
            title: const Text('Profil'),
            onTap: () => Navigator.pop(context),
          ),
          ListTile(
            leading: const Icon(Icons.info_outline),
            title: const Text('Detail'),
            onTap: () {
              Navigator.pop(context);
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (_) => const DetailPage(data: mahasiswa),
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
