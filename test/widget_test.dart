import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:profil_mahasiswa/data/mahasiswa.dart';
import 'package:profil_mahasiswa/main.dart';

void main() {
  testWidgets('Halaman profil menampilkan identitas mahasiswa', (tester) async {
    await tester.pumpWidget(const ProfilMahasiswaApp());

    expect(find.text('Profil Mahasiswa'), findsOneWidget);
    expect(find.text(mahasiswa.nama), findsOneWidget);
    expect(find.text(mahasiswa.nim), findsOneWidget);
    expect(find.text('Informasi Tambahan'), findsOneWidget);
  });

  testWidgets('Tombol Detail membuka halaman detail', (tester) async {
    await tester.pumpWidget(const ProfilMahasiswaApp());

    await tester.ensureVisible(find.byType(ElevatedButton));
    await tester.tap(find.byType(ElevatedButton));
    await tester.pumpAndSettle();

    expect(find.text('Detail Mahasiswa'), findsOneWidget);
    expect(find.text('Flutter'), findsOneWidget);
  });
}
