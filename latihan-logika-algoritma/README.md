```dart
// LATIHAN SOAL 1 : KASIR DENGAN DISKON
// KODE-01
double getTotalBayar(int purchase, bool member) {
  // MInimal belanja Rp100.000
  const int MIN_PURCHASE = 100000;
  // Diskon belanja 10%
  const int SHOPPING_DISCOUNT = 10;
  // Diskon member 5%
  const int MEMBER_DISCOUNT = 5;
  // Maksimal potongan Rp25.000
  const int MAX_CASHBACK = 25000;

  int discount = 0;
  // BR-01 Mendapat diskon 10% jika belanja lebih dari Rp100.000
  if (purchase >= MIN_PURCHASE) {
    discount = SHOPPING_DISCOUNT;
    // BR-02 Mendapatkan diskon tambahan 5% jika memenuhi syarat pertama dan sudah terdaftar member
    if (member) {
      discount += MEMBER_DISCOUNT;
    }
  }

  double total_cashback = discount / 100 * purchase;

  // BR-03 Maksimal potongan diskon sebesar Rp25.000
  if (total_cashback >= MAX_CASHBACK) {
    total_cashback = 25000;
  }

  return purchase - total_cashback;
}

void main() {
  double result = 0;
  // Skenario 1
  // Total Belanjaan Rp80.000
  const int TOTAL_PURCHASE_1 = 80000;
  // Status belum member
  const bool MEMBER_STATUS_1 = false;
  // Hasil Ekspetasi Rp80.000
  const int EXPECTED_TOTAL_PURCHASE_1 = 80000;
  result = getTotalBayar(TOTAL_PURCHASE_1, MEMBER_STATUS_1);
  if (result == EXPECTED_TOTAL_PURCHASE_1) {
    print("\nSkenario pertama SUKSES!!! dengan hasil Rp$result \n");
  } else {
    print(
      "\nSkenario pertama masih belum berjalan semestinya, cek kembali data atau fungsi yang berjalan!!! \n",
    );
  }

  // Skenario 2
  // Total Belanjaan Rp150.000
  const int TOTAL_PURCHASE_2 = 150000;
  // Status belum member
  const bool MEMBER_STATUS_2 = false;
  // Hasil Ekspetasi Rp135.000
  const int EXPECTED_TOTAL_PURCHASE_2 = 135000;

  result = getTotalBayar(TOTAL_PURCHASE_2, MEMBER_STATUS_2);
  if (result == EXPECTED_TOTAL_PURCHASE_2) {
    print("Skenario kedua SUKSES!!! dengan hasil Rp$result \n");
  } else {
    print(
      "Skenario kedua masih belum berjalan semestinya, cek kembali data atau fungsi yang berjalan!!! \n",
    );
  }

  // Skenario 3
  // Total Belanjaan Rp150.000
  const int TOTAL_PURCHASE_3 = 150000;
  // Status belum member
  const bool MEMBER_STATUS_3 = true;
  // Hasil Ekspetasi Rp127.500
  const int EXPECTED_TOTAL_PURCHASE_3 = 127500;
  result = getTotalBayar(TOTAL_PURCHASE_3, MEMBER_STATUS_3);
  if (result == EXPECTED_TOTAL_PURCHASE_3) {
    print("Skenario ketiga SUKSES!!! dengan hasil Rp$result \n");
  } else {
    print(
      "Skenario ketiga masih belum berjalan semestinya, cek kembali data atau fungsi yang berjalan!!! \n",
    );
  }

  // Skenario 4
  // Total Belanjaan Rp300.000
  const int TOTAL_PURCHASE_4 = 300000;
  // Status belum member
  const bool MEMBER_STATUS_4 = true;
  // Hasil Ekspetasi Rp275.000
  const int EXPECTED_TOTAL_PURCHASE_4 = 275000;
  result = getTotalBayar(TOTAL_PURCHASE_4, MEMBER_STATUS_4);
  if (result == EXPECTED_TOTAL_PURCHASE_4) {
    print("Skenario keempat SUKSES!!! dengan hasil Rp$result \n");
  } else {
    print(
      "Skenario keempat masih belum berjalan semestinya, cek kembali data atau fungsi yang berjalan!!! \n",
    );
  }
}

//KODE-02
// Memperbaiki kode menjadi lebih clean, diantaranya:
// 1. Menghilangkan komentar berlebih pada program yang dirasa tidak perlu
// 2. menyelaraskan tipe data yang ada di dalam fungsi getTotalPurchase
// 3. Menggunakan perulangan untuk memberikan pernyataan bahwa fungsi berjalan dengan benar
// 4. Mengganti variabel total_cashback menjadi totalDiscount agar penulisan dan maksud dari variabel lebih jelas
// 5. Mengganti pengisian value pada pengecekan maksimal diskon dengan variable const

double getTotalPurchase(double purchase, bool member) {
  const double MIN_PURCHASE = 100000;
  const double SHOPPING_DISCOUNT = 10;
  const double MEMBER_DISCOUNT = 5;
  const double MAX_DISCOUNT = 25000;

  double discount = 0;

  // BR-01 Mendapat diskon 10% jika belanja lebih dari Rp100.000
  if (purchase >= MIN_PURCHASE) {
    discount = SHOPPING_DISCOUNT;
    // BR-02 Mendapatkan diskon tambahan 5% jika memenuhi syarat pertama dan sudah terdaftar member
    if (member) {
      discount += MEMBER_DISCOUNT;
    }
  }

  double totalDiscount = discount / 100 * purchase;

  // BR-03 Maksimal potongan diskon sebesar Rp25.000
  if (totalDiscount >= MAX_DISCOUNT) {
    totalDiscount = MAX_DISCOUNT;
  }
  return purchase - totalDiscount;
}

void main() {
  const int MAX_SCENARIO = 4;
  double result = 0;
  // Data skenario 1-4 dari total belanja, status member, dan ekspetasi total bayar
  List<double> totalPurchase = [80000, 150000, 150000, 300000];
  List<bool> memberStatus = [false, false, true, true];
  List<double> expectedTotalPurchase = [80000, 135000, 127500, 275000];
  for (int i = 0; i < MAX_SCENARIO; i++) {
    result = getTotalPurchase(totalPurchase[i], memberStatus[i]);
    if (result == expectedTotalPurchase[i]) {
      print(
        "\n Skenario-${i + 1} \n dengan total belanja: ${totalPurchase[i]}, \n status member: ${memberStatus[i]}, \n dengan ekspetasi total yang dibayar: ${expectedTotalPurchase[i]} \n Sesuai dengan hasil: $result.",

      );
    }
  }
}

// KODE-03
// Memperbaiki kode menjadi lebih clean dan lebih jelas dibaca, diantaranya:
// 1. Mengganti nama fungsi dari getTotalPurchase menjadi getTotalPayment agar lebih jelas tujuan fungsinya
// 2. Penentuan value dari variabel MAX_SCENARIO menjadi fleksibel dan sesuai dengan data
// 3. Menambahkan kondisi gagal (else) pada percabangan yang ada di dalam perulangan
double getTotalPayment(double purchase, bool member) {
  const double MIN_PURCHASE = 100000;
  const double SHOPPING_DISCOUNT = 10;
  const double MEMBER_DISCOUNT = 5;
  const double MAX_DISCOUNT = 25000;

  double discount = 0;

  // BR-01 Mendapat diskon 10% jika belanja lebih dari Rp100.000
  if (purchase >= MIN_PURCHASE) {
    discount = SHOPPING_DISCOUNT;
    // BR-02 Mendapatkan diskon tambahan 5% jika memenuhi syarat pertama dan sudah terdaftar member
    if (member) {
      discount += MEMBER_DISCOUNT;
    }
  }

  double totalDiscount = discount / 100 * purchase;

  // BR-03 Maksimal potongan diskon sebesar Rp25.000
  if (totalDiscount >= MAX_DISCOUNT) {
    totalDiscount = MAX_DISCOUNT;
  }

  return purchase - totalDiscount;
}

void main() {
  double result = 0;

  // Data skenario 1-4 dari total belanja, status member, dan ekspetasi total bayar
  List<double> totalPurchase = [80000, 150000, 150000, 300000];
  List<bool> memberStatus = [false, false, true, true];
  List<double> expectedTotalPurchase = [80000, 135000, 127500, 275000];

  final int MAX_SCENARIO = memberStatus.length;
  for (int i = 0; i < MAX_SCENARIO; i++) {
    result = getTotalPayment(totalPurchase[i], memberStatus[i]);
    if (result == expectedTotalPurchase[i]) {
      print(
        "\n Skenario-${i + 1} \n dengan total belanja: ${totalPurchase[i]}, \n status member: ${memberStatus[i]}, \n dengan ekspetasi total yang dibayar: ${expectedTotalPurchase[i]} \n Sesuai dengan hasil: $result.",
      );
    } else {
      print("Ada fungsi yang gagal");
    }
  }
}

//KODE-04
// Memperbaiki beberapa hal agar lebih clean dan mudah dipahami, diantaranya:
// 1. Mengubah hasil fungsi getTotalPayment yang tadinya mengembalikan tipe data double menjadi integer
// 2. Mengubah variable result menjadi resutlTotalPayment agar lebih jelas maksudnya
// 3. Mengubah deklarasi data dari menggunakan List menjadi List dan Map dengan tipe data String dan Dynamic

int getTotalPayment(int purchase, bool member) {
  const int MIN_PURCHASE = 100000;
  const int SHOPPING_DISCOUNT = 10;
  const int MEMBER_DISCOUNT = 5;
  const int MAX_DISCOUNT = 25000;

  int discount = 0;

  // BR-01 Mendapat diskon 10% jika belanja lebih dari Rp100.000
  if (purchase >= MIN_PURCHASE) {
    discount = SHOPPING_DISCOUNT;
    // BR-02 Mendapatkan diskon tambahan 5% jika memenuhi syarat pertama dan sudah terdaftar member
    if (member) {
      discount += MEMBER_DISCOUNT;
    }
  }

  double persentaseDiscount = purchase * discount / 100;
  int totalDiscount = persentaseDiscount.toInt();

  // BR-03 Maksimal potongan diskon sebesar Rp25.000
  if (totalDiscount >= MAX_DISCOUNT) {
    totalDiscount = MAX_DISCOUNT;
  }

  return purchase - totalDiscount;
}

void main() {
  int resultTotalPayment = 0;

  // Data skenario 1-4 dari total belanja, status member, dan ekspetasi total bayar
  List<Map<String, dynamic>> dataScenario = [
    {'belanja': 80000, 'member': false, 'payment': 80000},
    {'belanja': 150000, 'member': false, 'payment': 135000},
    {'belanja': 150000, 'member': true, 'payment': 127500},
    {'belanja': 300000, 'member': true, 'payment': 275000},
  ];

  final int MAX_SCENARIO = dataScenario.length;
  for (int i = 0; i < MAX_SCENARIO; i++) {
    resultTotalPayment = getTotalPayment(
      dataScenario[i]['belanja'],
      dataScenario[i]['member'],
    );
    if (resultTotalPayment == dataScenario[i]['payment']) {
      print(
        "\n Skenario-${i + 1} \n dengan total belanja: ${dataScenario[i]['belanja']}, \n status member: ${dataScenario[i]['member']}, \n dengan ekspetasi total yang dibayar: ${dataScenario[i]['payment']} \n Sesuai dengan hasil: $resultTotalPayment.",
      );
    } else {
      print(
        "Skenario gagal, cek data skenario atau fungsi mengambil total pembayaran.",
      );
    }
  }
}

// KODE-05
// Mengubah 2 penamaan variabel agar lebih jelas maksud varibelnya. diantarnya:
// 1. variabel persentaseDiscount menjadi discountPercentage
// 2. variabel MAX_SCENARIO menjadi variabel lengthScenario

// PERBAIKAN TAMBAHAN
// 1. Pembulatan hasil presentasi masih menggunakan .toInt() yang menghilangkan angka dibelakang (,) koma
// 2. Penggunaan variabel dynamic yang berisi integer dan boolean masih ambigu

int getTotalPayment(int purchase, bool member) {
  const int MIN_PURCHASE = 100000;
  const int SHOPPING_DISCOUNT = 10;
  const int MEMBER_DISCOUNT = 5;
  const int MAX_DISCOUNT = 25000;

  int discount = 0;

  // BR-01 Mendapat diskon 10% jika belanja lebih dari Rp100.000
  if (purchase >= MIN_PURCHASE) {
    discount = SHOPPING_DISCOUNT;
    // BR-02 Mendapatkan diskon tambahan 5% jika memenuhi syarat pertama dan sudah terdaftar member
    if (member) {
      discount += MEMBER_DISCOUNT;
    }
  }

  double discountPercentage = purchase * discount / 100;
  int totalDiscount = discountPercentage .toInt()

  // BR-03 Maksimal potongan diskon sebesar Rp25.000
  if (totalDiscount >= MAX_DISCOUNT) {
    totalDiscount = MAX_DISCOUNT;
  }

  return purchase - totalDiscount;
}

void main() {
  int resultTotalPayment = 0;

  // Data skenario 1-4 dari total belanja, status member, dan ekspetasi total bayar
  List<Map<String, dynamic>> dataScenario = [
    {'belanja': 80000, 'member': false, 'payment': 80000},
    {'belanja': 150000, 'member': false, 'payment': 135000},
    {'belanja': 150000, 'member': true, 'payment': 127500},
    {'belanja': 300000, 'member': true, 'payment': 275000},
  ];

  final int lengthScenario = dataScenario.length;
  for (int i = 0; i < lengthScenario; i++) {
    resultTotalPayment = getTotalPayment(
      dataScenario[i]['belanja'],
      dataScenario[i]['member'],
    );
    if (resultTotalPayment == dataScenario[i]['payment']) {
      print(
        "\n Skenario-${i + 1} \n dengan total belanja: ${dataScenario[i]['belanja']}, \n status member: ${dataScenario[i]['member']}, \n dengan ekspetasi total yang dibayar: ${dataScenario[i]['payment']} \n Sesuai dengan hasil: $resultTotalPayment.",
      );
    } else {
      print(
        "Skenario gagal, cek data skenario atau fungsi mengambil total pembayaran.",
      );
    }
  }
}

```
