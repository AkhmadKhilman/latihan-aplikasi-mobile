enum BookStatus { available, notAvailable }

class Book {
  String title;
  BookStatus status;

  Book(this.title, this.status);
}

class Member {
  String name;
  List<Book> borrowedBooks;

  Member(this.name, this.borrowedBooks);
}

class Scenario {
  Member member;
  List<Book> dataBooks;
  int returnDays;

  Scenario(this.member, this.dataBooks, this.returnDays);
}

class UnikScenario {
  Member firstMember;
  List<Book> firstBooks;
  Member secondMember;
  List<Book> secondBooks;
  int returnDays;

  UnikScenario(
    this.firstMember,
    this.firstBooks,
    this.secondMember,
    this.secondBooks,
    this.returnDays,
  );
}

// BR-01 Buku yang dipinjam maksimal 3 buku per anggota.
// Memeriksa jumlah buku yang ingin dipinjam.
bool canBorrow(int numberOfBooks) {
  return numberOfBooks <= 3;
}

// BR-02 buku yang sedang dipinjam tidak bisa dipinjamkan lagi.
// Memeriksa buku yang tersedia.
bool isBookAvailable(Book book) {
  return book.status == BookStatus.available;
}

// Memeriksa setiap buku yang ingin dipinjam
bool areBooksAvailable(List<Book> books) {
  for (Book book in books) {
    if (!isBookAvailable(book)) {
      return false;
    }
  }
  return true;
}

// BR-03 Peminjaman buku memiliki batas waktu pengembalian, yaitu 3 hari untuk 1 buku, 5 hari untuk 2 buku, dan 7 hari untuk 3 buku.
// Menentukan batas waktu pengembalian buku berdasarkan jumlah buku yang dipinjam.
int getDueDays(List<Book> books) {
  return switch (books.length) {
    1 => 3,
    2 => 5,
    _ => 7,
  };
}

// BR-04 Denda keterlambatan pengembalian buku adalah Rp 1.000 per hari keterlambatan.
// Menghitung total hari keterlambatan pengembalian buku
int getLateDays(int dueDay, int returnDay) {
  int lateDays = returnDay - dueDay;
  return lateDays <= 0 ? 0 : lateDays;
}

// Menghitung denda keterlambatan pengembalian buku
int getFine(int lateDays) {
  const int finePerDay = 1000;
  return lateDays * finePerDay;
}

// Fungsi meminjam buku
bool borrowBooks(Member member, List<Book> books) {
  if (!canBorrow(books.length)) {
    return false;
  }

  if (!areBooksAvailable(books)) {
    return false;
  }

  member.borrowedBooks.addAll(books);
  for (Book book in books) {
    book.status = BookStatus.notAvailable;
  }

  return true;
}

// Fungsi Mengembalikan buku
void returnBooks(Member member, List<Book> books) {
  member.borrowedBooks.remove(books);
  for (Book book in books) {
    book.status = BookStatus.available;
  }
}

// Fungsi menjalankan skenario utama
void runScenario(Scenario scenario) {
  Member member = scenario.member;
  List<Book> books = scenario.dataBooks;
  int dueDays = getDueDays(scenario.dataBooks);
  int lateDays = getLateDays(dueDays, scenario.returnDays);
  int totalFine = getFine(lateDays);

  // Proses meminjam buku
  if (!borrowBooks(member, books)) {
    return print(
      '\n Nama: ${member.name} \n Peminjaman buku ditolak, periksa kembali total buku dan ketersediaan buku yang akan dipinjam.',
    );
  }

  print(
    '\n Nama: ${member.name} \n Peminjaman buku berhasil dengan total ${books.length} buku. \n Batas pengembalian buku adalah ${dueDays} Hari.',
  );

  // Proses Mengembalikan buku
  if (lateDays <= 0) {
    returnBooks(member, books);
    return print(
      ' Pengembalian buku ${member.name} berhasil dengan tepat waktu.',
    );
  } else {
    returnBooks(member, books);
    return print(
      ' Pengembalian buku ${member.name} mengalami keterlambatan selama ${lateDays} hari yang dikenai denda sebesar: Rp${totalFine}',
    );
  }
}

// fungsi menjalankan skenario unik
void runUnikScenario(UnikScenario scenario) {
  Member member1 = scenario.firstMember;
  List<Book> books1 = scenario.firstBooks;

  Member member2 = scenario.secondMember;
  List<Book> books2 = scenario.secondBooks;

  int dueDays = getDueDays(scenario.firstBooks);
  int lateDays = getLateDays(dueDays, scenario.returnDays);
  int totalFine = getFine(lateDays);

  // Proses meminjam buku
  if (!borrowBooks(member1, books1)) {
    return print(
      '\n Nama: ${member1.name} \n Peminjaman buku ditolak, periksa kembali total buku dan ketersediaan buku yang akan dipinjam.',
    );
  }

  print(
    '\n Nama: ${member1.name} \n Peminjaman buku berhasil dengan total ${books1.length} buku. \n Batas pengembalian buku adalah ${dueDays} Hari.',
  );

  if (!borrowBooks(member2, books2)) {
    print(
      '\n Nama: ${member2.name} \n Peminjaman buku ditolak, periksa kembali total buku dan ketersediaan buku yang akan dipinjam.',
    );
  }

  if (lateDays <= 0) {
    returnBooks(member1, books1);
    return print(
      ' \n Pengembalian buku ${member1.name} berhasil dengan tepat waktu.',
    );
  } else {
    returnBooks(member1, books1);
    return print(
      ' \n Pengembalian buku ${member1.name} mengalami keterlambatan selama ${lateDays} hari yang dikenai denda sebesar: Rp${totalFine}',
    );
  }
}

void main() {
  List<Book> books = [
    Book('Dasar Pemrograman', BookStatus.available),
    Book('Algoritma dan Logika Pemrograman', BookStatus.available),
    Book('Pemrograman Berorientasi Objek', BookStatus.available),
    Book('Basis Data', BookStatus.available),
    Book('Jaringan Komputer', BookStatus.available),
  ];

  List<Member> members = [
    Member('Danu', []),
    Member('Cahyo', []),
    Member('Kurniawan', []),
    Member('Tirta', []),
    Member('Diana', []),
    Member('Putri', []),
  ];

  List<Scenario> scenarios = [
    Scenario(members[0], [books[0], books[1]], 4),
    Scenario(members[1], [books[0], books[1], books[2]], 14),
    Scenario(members[2], [books[0], books[1], books[2], books[3]], 0),
    Scenario(members[3], [books[2]], 7),
  ];

  List<UnikScenario> unikScenario = [
    UnikScenario(members[4], [books[3], books[4]], members[5], [books[4]], 6),
    UnikScenario(
      members[0],
      [books[0], books[3], books[4]],
      members[2],
      [books[2], books[4]],
      5,
    ),
  ];

  // SKENARIO-01
  // Nama : Danu
  // Pinjaman 2 buku dengan batas pengelablian 5 hari
  // Dikembalikan dihari ke-4
  // Ekspetasi pengembalian tepat waktu

  // SKENARIO-02
  // Nama : Cahyo
  // Pinjaman 3 buku dengan batas pengelablian 7 hari
  // Dikembalikan dihari ke-14
  // Ekspetasi pengembalian Terlambat 7 hari dikenai denda Rp7.000

  // SKENARIO-03
  // Nama : Kurniawan
  // Pinjaman 4 buku dengan batas pengelablian 7 hari
  // Dikembalikan dihari ke-0
  // Ekspetasi peminjaman ditolak

  // SKENARIO-04
  // Nama : Tirta
  // Pinjaman 1 buku dengan batas pengelablian 3 hari
  // Dikembalikan dihari ke-7
  // Ekspetasi pengembalian terlambat 4 hari dikenai denda Rp4.000

  // SKENARIO-05
  // Nama : Diana
  // Pinjaman 2 buku dengan batas pengelablian 5 hari
  // Nama : Putri
  // Meminjam 1 buku yang sama dengan Diana
  // Dikembalikan dihari ke-6
  // Ekspetasi Putri ditolak Peminjamannya
  // Ekspetasi Diana pengembalian terlambat 1 hari dikenai denda Rp1.000

  // SKENARIO-06
  // Nama : Danu
  // Pinjaman 3 buku dengan batas pengelablian 7 hari
  // Nama : Kurniawan
  // Meminjam 2 buku yang salah satunya sama dengan Danu
  // Dikembalikan dihari ke-7
  // Ekspetasi Kurniawan ditolak Peminjamannya
  // Ekspetasi Danu pengembalian tepat waktu

  int lengthScenario = scenarios.length;
  for (int i = 0; i < lengthScenario; i++) {
    runScenario(scenarios[i]);
  }

  int lengthUnikScenario = unikScenario.length;
  for (int o = 0; o < lengthUnikScenario; o++) {
    runUnikScenario(unikScenario[o]);
  }
}
