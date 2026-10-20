/// Data profil mahasiswa yang ditampilkan di aplikasi.
///
/// Ubah nilai di bagian bawah file ini untuk menyesuaikan profil.
class Mahasiswa {
  const Mahasiswa({
    required this.nama,
    required this.inisial,
    required this.nim,
    required this.programStudi,
    required this.universitas,
    required this.hobi,
    required this.email,
    required this.domisili,
    required this.keahlian,
  });

  final String nama;

  /// Huruf yang tampil di foto profil.
  final String inisial;
  final String nim;
  final String programStudi;
  final String universitas;
  final String hobi;
  final String email;
  final String domisili;
  final List<String> keahlian;
}

const mahasiswa = Mahasiswa(
  nama: 'Ahmad Mofidur Robbiyal Aqla',
  inisial: 'AR',
  nim: '2495114006',
  programStudi: 'Teknik Informatika',
  universitas: "Universitas Hasyim Asy'ari",
  hobi: 'Ngoding dan membangun aplikasi web maupun mobile.',
  email: 'requime@gmail.com',
  domisili: 'Madura, Jawa Timur',
  keahlian: ['Flutter', 'Dart', 'Laravel', 'Kotlin', 'UI Design'],
);
