// lebih clean dan jelas
// Reutrn langsung mengembalikan data pada function jika sudah ditemukan tanpa memperhatikan kondisi lainnya
String checkScoreKursus(double score) {
  if (score >= 85) {
    return "Sangat Baik";
  }

  if (score >= 70) {
    return "Baik";
  }

  if (score >= 60) {
    return "Cukup";
  }

  return "Kurang";
}

// Tanpa Else
// String checkScoreKursus(double score) {
//   if (score >= 85) {
//     return "Sangat Baik";
//   } else if (score >= 70) {
//     return "Baik";
//   } else if (score >= 60) {
//     return "Cukup";
//   }

//   return "Kurang";
// }

// Normal
// String checkScoreKursus(double score) {
//   if (score >= 85) {
//     return "Sangat Baik";
//   } else if (score >= 70) {
//     return "Baik";
//   } else if (score >= 60) {
//     return "Cukup";
//   } else {
//     return "Kurang";
//   }
// }

int getDiskon(double harga, bool member) {
  int diskon = 0;

  if (harga > 10000) {
    diskon = 100;
  } else if (harga > 5000) {
    diskon = 50;
  }

  if (member) {
    diskon += 10;
  }

  return diskon;
}

// Function error karena memeriksa kondisi yang sudah ditemukan, jadi isi variablenya tertimpa dan tidak sesuai dengan fungsi seharusnya
// int getDiskon(double harga, bool member) {
//   int diskon = 0;

//   if (harga > 10000) {
//     diskon = 100;
//   }

//   if (harga > 5000) {
//     diskon = 50;
//   }

//   if (member) {
//     diskon += 10;
//   }

//   return diskon;
// }

String getStatus(int umur) {
  // Normal percabangan
  // if (umur >= 17) {
  //   return "Dewasa";
  // }

  // return "Anak-anak";

  // Lebih ringkas namun khusus jika hanya ada 2 kondisi
  return umur >= 17 ? "dewasa" : "anak-anak";
}

// Penggunaan percabangan switch normal dan Switch expression
void cetakStatusKuliah(String hari) {
  // switch (hari) {
  //   case "Sabtu":
  //     print("Jam ganti");
  //   case "minggu":
  //     print("Hari libur");
  //   default:
  //     print("Masuk kuliah");
  // }

  String status = switch (hari) {
    "Sabtu" => "Jam ganti",
    "Minggu" => "Hari libur",
    _ => "Masuk Kuliah",
  };

  print(status);
}

void cetakStatusGrade(String grade) {
  String keterangan = switch (grade) {
    "A" => "Sangat Baik",
    "B" => "Baik",
    "C" => "Cukup",
    _ => "Perlu perbaikan",
  };
  print(keterangan);
}

void cetakPertemuan(int total) {
  for (int i = 1; i <= total; i++) {
    // print("Hasil ke-$i");

    if (i % 2 == 0) {
      print("Hasil ke-$i");
    }
  }
}

void contohForin() {
  List<int> pengeluaran = [10000, 40000, 5000];

  print(pengeluaran);

  int totalPengeluaran = 0;

  for (final belanja in pengeluaran) {
    totalPengeluaran += belanja;
  }

  print("Total Pengeluaran = $totalPengeluaran");
}

void contohWhile() {
  const int TOTAL_PERCOBAAN = 3;
  const String DEFAULT_PASSWORD = "11241";

  List<String> password = ["1234", "3456", "1124"];
  int percobaan = 0;
  bool berhasil = false;

  while (!berhasil && percobaan < TOTAL_PERCOBAAN) {
    String getPassword = password[percobaan];
    percobaan++;
    if (getPassword == DEFAULT_PASSWORD) {
      berhasil = true;
    }
  }

  print("Status: $berhasil, dengan percobaan: $percobaan");
}

void cetakNilai() {
  List<int> nilai = [75, 0, 50, 90, 30, 100];

  for (final n in nilai) {
    if (n == 0) {
      continue;
    }
    if (n < 50) {
      print("Nilai ditemukan dibawah 50: $n");
      break;
    }
    print("Nilai aman: $n");
  }
}

void main() {
  print(checkScoreKursus(59.4));

  print(getDiskon(10001, true));

  print(getStatus(18));

  cetakStatusKuliah("Senin");

  cetakStatusGrade("B");

  cetakPertemuan(4);

  contohForin();

  contohWhile();

  cetakNilai();
}
