/* LATIHAN SOAL 1 : KASIR DENGAN DISKON */
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
  int totalDiscount = discountPercentage
      .toInt(); /* PERLU DIPERBAIKI PEMBULATAN UANGNYA */

  // BR-03 Maksimal potongan diskon sebesar Rp25.000
  if (totalDiscount >= MAX_DISCOUNT) {
    totalDiscount = MAX_DISCOUNT;
  }

  return purchase - totalDiscount;
}

/* LATIHAN SOAL 2 : TARIF PARKIR */

void main() {
  /* HASIL LATIHAN SOAL 1 : KASIR DENGAN DISKON */
  int resultTotalPayment = 0;

  // Data skenario 1-4 dari total belanja, status member, dan ekspetasi total bayar
  List<Map<String, dynamic>> dataScenario = [
    /* PERLU DIPERBAIKI TYPE DATA DYNAMIC NYA */
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
  /* HASIL LATIHAN SOAL 1 : KASIR DENGAN DISKON */

  /* HASIL LATIHAN SOAL 2 : TARIF PARKIR */

  /* HASIL LATIHAN SOAL 2 : TARIF PARKIR */
}
