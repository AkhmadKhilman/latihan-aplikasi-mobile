class Game {
  // Contoh varibael static
  // variabel ini bisa langsung dipanggil bersama dengan class dan valusenya sudah jelas
  static String word = "WELCOME TO...";

  // Contoh variabel tidak static
  String console;

  Game(this.console);

  void greetings() {
    print("$word $console. Enjoy yout game...");
  }
}

void main() {
  // Menampilkan kata pembuka
  print(Game.word);

  // Mendeklarasikan setiap isi dari variable console didalam class Game
  Game console1 = Game("Playstation 2");
  Game console2 = Game("Playstation Portable");
  Game console3 = Game("Sega Saturn");

  // Memanggil fungsi gretings() yang menampilkan kata pembuka dan nama konsol yang sudah di deklarasikan isinya di dalam main.
  console1.greetings();
  console2.greetings();
  console3.greetings();

  // kata pembuka di ganti apa yang akan terjadi
  Game.word = "Selamat datang kembali di...";

  // Semanya akan berganti begitu deklarasi isi terbaru dari variabel static
  console1.greetings();
  console2.greetings();
  console3.greetings();
}
