import 'package:flutter/material.dart';

import '../data/mahasiswa.dart';

/// Halaman detail yang dibuka dari tombol "Detail".
class DetailPage extends StatelessWidget {
  const DetailPage({super.key, required this.data});

  final Mahasiswa data;

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Detail Mahasiswa'),
        backgroundColor: colors.primary,
        foregroundColor: Colors.white,
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          const _SectionTitle('Kontak'),
          Card(
            elevation: 0,
            color: Colors.white,
            child: Column(
              children: [
                ListTile(
                  leading: Icon(Icons.email, color: colors.primary),
                  title: const Text('Email'),
                  subtitle: Text(data.email),
                ),
                ListTile(
                  leading: Icon(Icons.location_on, color: colors.primary),
                  title: const Text('Domisili'),
                  subtitle: Text(data.domisili),
                ),
              ],
            ),
          ),
          const SizedBox(height: 16),
          const _SectionTitle('Keahlian'),
          Wrap(
            spacing: 8,
            runSpacing: 8,
            children: [
              for (final skill in data.keahlian)
                Chip(
                  avatar: Icon(Icons.check_circle, size: 18, color: colors.primary),
                  label: Text(skill),
                ),
            ],
          ),
        ],
      ),
    );
  }
}

class _SectionTitle extends StatelessWidget {
  const _SectionTitle(this.text);

  final String text;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 4, bottom: 8),
      child: Text(
        text,
        style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
      ),
    );
  }
}
