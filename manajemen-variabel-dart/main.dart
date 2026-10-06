// Variable dengan tipe data late
late double nilai;

void main() {
  // Variable
  String word = "Hello...";
  String name = "John";
  // menampilkan isi variable
  print(word + " " + name);

  // Variable dengan tipe data yang berbeda
  int target = 95;
  double score = 60.5;
  // menampilkan isi variable dengan tipe data yang berbeda
  print(
    name +
        " mendapatkan nilai " +
        score.toString() +
        " dari target " +
        target.toString(),
  );

  // Variable dengan tipe data yang nullable
  // String name2; // variable yang bisa null
  String? name2 = "Ambar";
  name2 = null;
  // menampilkan isi variable
  print(name2);

  // Variable dengan operator null aware
  //String name3; //variable tidak bisa menggunakan null aware operator karena tidak nullable
  String? name3;
  name3 = null;
  // jika name3 null maka akan menampilkan "Tidak ada nama"
  String note = name3 ?? "Tidak ada nama";
  print(word + " " + note);

  // Variable dengan tipe data final
  final String dataAkhir = "Sudah terisi";
  // dataAkhir = "Belum terisi"; // error karena variable final tidak bisa diubah
  final DateTime waktu = DateTime.now();
  // menampilkan isi variable final
  print(dataAkhir + " masuk pada waktu " + waktu.toString());

  // Variable dengan tipe data const
  const double nilaiTerbaru = 8.7;
  const String matakuliah = 'Aplikasi Mobile';
  // menampilkan isi variable const
  print(
    "Nilai terbaru untuk matakuliah " +
        matakuliah +
        " adalah " +
        nilaiTerbaru.toString(),
  );

  // Variable dengan tipe data late
  nilai = 7.5; // variable late harus diisi sebelum digunakan
  print(nilai);

  // Variable dengan method toUpperCase()
  String name4 = "Dela";
  print(word + " " + name4.toUpperCase());
  // Variable dengan method toLowerCase()
  String name5 = "Dhana";
  print(word + " " + name5.toLowerCase());

  // Variable dengan tipe data num
  num hasil = 80; // bisa menampung tipe data int
  print("hasil pertama adalah: $hasil");
  // Variable dengan tipe data num
  num hasil2 = 80.7; // bisa menampung tipe data double
  print("hasil kedua adalah: $hasil2");

  // Variable dengan tipe data bool
  bool aktif = true;
  if (aktif) {
    print("Akun aktif");
  } else {
    print("Akun tidak aktif");
  }
  // Variable dengan tipe data bool
  aktif = false;
  if (aktif) {
    print("Akun aktif");
  } else {
    print("Akun tidak aktif");
  }

  // Variable dengan tipe data List
  List<String> namaBarang = ["Laptop", "Mouse", "Keyboard"];
  // menampilkan isi variable List yang ditentukan
  print(namaBarang[0]);
  // menambahkan isi variable List
  namaBarang.add("Monitor");
  // menampilkan isi variable List yang ditambahkan
  print(namaBarang[3]);
  // menampilkan seluruh isi variable List
  print(namaBarang);

  // Variable dengan tipe data Set
  Set<String> namaKategori = {"Hardware", "Software", "Hardware"};
  // menampilkan seluruh isi variable Set
  print(
    namaKategori,
  ); // menampilkan hanya 2 data karena Set tidak bisa menampung data yang sama

  // Variable dengan tipe data Map
  Map<String, dynamic> dataBarang = {
    "nama": "Laptop",
    "harga": 10000000.00,
    "stok": 10,
  };
  // menampilkan seluruh isi variable Map
  print(dataBarang);
  // menampilkan isi variable Map yang ditentukan
  print(dataBarang["harga"]);

  // Variable dengan tipe data object
  Object data = "Hai";
  data = 30;
  data = 10.5;

  // memeriksa tipe data dari variable data
  if (data is String) {
    print(data.toUpperCase());
  } else {
    print("data bukan bertipe String");
  }

  // Variable dengan tipe data dynamic
  dynamic data2 = "Halo";
  print(data2);
  // print(data2.toupperCase()); // error karena data2 bukan bertipe String
}
