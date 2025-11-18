**TUGAS 7**

1. **Widget Tree dan Hubungan Parent-Child**
    Widget tree adalah struktur hierarki yang menggambarkan bagaimana widget-widget tersusun dalam sebuah aplikasi Flutter. Setiap widget bisa memiliki satu atau lebih widget anak (child), dan semuanya berada di bawah satu widget utama (root widget). Hubungan parent-child di Flutter seperti pohon keluarga: widget parent bagaikan tengkorak, ia menentukan struktur dan tata letak anak-anaknya. Sementara itu, widget child menampilkan elemen yang lebih spesifik di dalam parent. Misalnya, Scaffold adalah parent dari AppBar dan Body, dan di dalam Body bisa ada Column yang menjadi parent dari berbagai Text, Row, atau GridView.

2. **Widget yang Digunakan dan Fungsinya**
    Dalam proyek ini, saya menggunakan beberapa widget utama yaitu MaterialApp, Scaffold, AppBar, Text, Row, Column, Padding, SizedBox, Card, GridView.count, Icon, dan SnackBar. Berikut penjelasan singkatnya:

    1. MaterialApp digunakan sebagai root aplikasi.
    2. Scaffold menyediakan struktur dasar halaman seperti AppBar dan Body.
    3. AppBar menampilkan judul aplikasi di bagian pojok atas.
    4. Row dan Column mengatur tata letak secara horizontal dan vertikal.
    5. Text digunakan untuk menampilkan teks seperti nama, NPM, dan kelas.
    6. Card digunakan untuk menampilkan informasi dengan tampilan kotak yang rapi.
    7. GridView.count digunakan untuk membuat tiga tombol dalam bentuk grid.
    8. Icon menampilkan ikon di setiap tombol.
    9. SnackBar digunakan untuk menampilkan pesan ketika tombol ditekan.

3. **Fungsi MaterialApp dan Alasan Menjadi Root**
    MaterialApp adalah widget utama yang jadi “pembungkus” seluruh aplikasi Flutter. Bisa dibilang ini fondasi dari aplikasi yang menggunakan gaya Material Design (seperti aplikasi Android modern). Di dalam MaterialApp, kita bisa ngatur tema warna, judul aplikasi, sistem navigasi antar halaman, dan banyak pengaturan dasar lainnya. Biasanya MaterialApp ditempatkan di bagian paling atas (root) karena semua widget lain seperti tombol, AppBar, atau SnackBar butuh struktur dari MaterialApp supaya bisa jalan dengan benar. Kalau tidak ada MaterialApp, banyak fitur bawaan Flutter tidak akan bisa digunakan dengan semestinya.

4. **Perbedaan StatelessWidget dan StatefulWidget**
    StatelessWidget adalah widget yang tampilannya tidak akan berubah selama aplikasi berjalan. Jadi cocok buat hal-hal yang sifatnya tetap, misalnya teks, ikon, atau tombol yang cuma menampilkan pesan. Sedangkan StatefulWidget adalah widget yang bisa berubah tampilannya karena punya state (keadaan) yang bisa di-update, contohnya form input, animasi, atau counter yang bisa naik-turun. Di proyek ini, saya menggunakan StatelessWidget karena semua elemen tampilannya statis dan tidak ada data yang perlu diubah dengan setState().

5. **BuildContext dan Pentingnya di Flutter**
    BuildContext adalah objek yang merepresentasikan lokasi suatu widget dalam widget tree. Ia digunakan untuk mengakses informasi tentang widget lain di atasnya, seperti tema, ukuran layar, atau bahkan untuk menampilkan SnackBar melalui ScaffoldMessenger.of(context). BuildContext sangat penting di metode build karena setiap kali Flutter menggambar ulang UI, ia menggunakan context ini untuk mengetahui posisi widget tersebut dalam hierarki dan bagaimana tampilannya harus diperbarui.

6. **Hot Reload dan Hot Restart**
    Hot reload adalah fitur Flutter yang memungkinkan pengembang memperbarui tampilan aplikasi dengan cepat tanpa kehilangan state yang sedang berjalan. Misalnya, ketika ingin mengubah teks atau warna, cukup tekan “hot reload” dan aplikasi langsung menampilkan perubahan tanpa memulai ulang. Sedangkan hot restart akan me-restart seluruh aplikasi dari awal, termasuk menghapus semua state yang tersimpan. Hot reload lebih cepat untuk perubahan kecil pada UI, sementara hot restart digunakan jika ada perubahan besar pada struktur aplikasi.


**TUGAS 8**

1. **Perbedaan Navigator.push() dan Navigator.pushReplacement()**
    Navigator.push() menambahkan halaman baru ke dalam stack sehingga use dapat kembali ke halaman sebelumnya. Sementara itu, Navigator.pushReplacement() menggantikan halaman aktif dengan halaman baru dan menghapus halaman sebelumnya dari stack. Pada aplikasi Football Shop, push() digunakan untuk navigasi yang membutuhkan opsi kembali seperti melihat detail produk, sedangkan pushReplacement() digunakan pada alur final seperti setelah login atau checkout.

2. **Pemanfaatan Scaffold, AppBar, dan Drawer**
    Struktur halaman aplikasi dibangun menggunakan Scaffold sebagai kerangka utama yang menyediakan area konten dan slot navigasi. AppBar memastikan setiap halaman memiliki header yang seragam dan mudah dikenali. Drawer berperan sebagai navigasi samping yang konsisten sehingga user dapat berpindah fitur tanpa mengubah struktur halaman inti.

3. **Kelebihan Padding, SingleChildScrollView, dan ListView dalam Form**
    1. Padding digunakan untuk memberi jarak antar komponen agar tampilan form lebih rapi dan mudah dibaca. 
    2. SingleChildScrollView memungkinkan seluruh elemen form tetap dapat diakses meskipun layar perangkat terbatas. 
    3. ListView membantu menata input field secara vertikal dengan kemampuan scroll otomatis yang responsif.

4. **Penyesuaian Tema Warna untuk Identitas Aplikasi**
    Penyesuaian tema dilakukan menggunakan ThemeData sebagai palet warna utama coklat agar aplikasi memiliki palet warna yang konsisten dengan brand Football Shop. Selebihnya, terdapat beberapa warna pendukung yang masih dalam satu tone untuk diterapkan pada elemen dan tombol untuk memperkuat identitas visual. Konsistensi warna ini membantu menciptakan pengalaman user yang lebih nyaman dan mudah dikenali.

**TUGAS 9**

1. **Mengapa perlu membuat model Dart saat mengambil/mengirim JSON**
    Membuat model Dart (kelas typed) memaksa struktur data yang konsisten antara backend dan frontend sehingga validasi tipe dan null-safety bisa dilakukan lebih awal. Tanpa model dan hanya memakai Map<String, dynamic> kita akan kehilangan pemeriksaan tipe otomatis, penamaan field raw mudah typo, dan kode menjadi sulit dirawat karena pemetaan/konversi tersebar di banyak tempat. Dengan model, IDE dapat membantu refactor, kode jadi lebih mudah diuji dan dipelihara.

2. **Fungsi package http dan CookieRequest serta perbedaannya**
    Package http adalah klien HTTP general-purpose untuk mengirim GET/POST/PUT/DELETE tanpa pengelolaan sesi/cookie otomatis. Package ini cocok untuk permintaan stateless atau API sederhana. CookieRequest (dari pbp_django_auth) membungkus mekanisme HTTP dengan pengelolaan cookie/CSRF dan helper login/logout sehingga autentikasi berbasis session di Django bekerja mulus dari Flutter.

3. **Mengapa instance CookieRequest perlu dibagikan ke semua komponen**
    Cookie/session adalah state aplikasi (session cookie, header CSRF) yang harus konsisten di seluruh widget supaya setiap request membawa kredensial yang sama. Membagikan satu instance dapat mencegah duplikasi dan mismatch cookie. Dengan Provider, semua halaman bisa mengakses CookieRequest yang sama tanpa harus passing parameter manual, memudahkan login/logout global.

4. **Konfigurasi konektivitas antara Flutter dan Django (10.0.2.2, CORS, SameSite, Android INTERNET)**
    1. Android emulator menggunakan 10.0.2.2 untuk mengakses host machine sehingga alamat ini harus ditambahkan ke ALLOWED_HOSTS agar request dari emulator diterima. Tanpa hal tersebut, permintaan akan ditolak. 
    2. CORS harus diaktifkan dan pengaturan cookie (SameSite, Secure) disesuaikan supaya browser/emulator mengizinkan pengiriman cookie lintas-origin (mis. SameSite=None + Secure untuk HTTPS, atau Secure=False untuk localhost/test). Jika salah konfigurasi, maka cookie session/CSRF tidak dikirim dan autentikasi gagal. 
    3. Android butuh izin INTERNET di AndroidManifest.xml agar aplikasi bisa melakukan network request. Tanpa izin tersebut, request tidak akan pernah keluar.

5. **Mekanisme pengiriman data dari input sampai tampil di Flutter**
    1. User memasukkan data pada form Flutter, aplikasi membuat JSON/body request dan memanggil endpoint Django, lalu Django memproses input (validasi, simpan ke DB) dan mengembalikan response JSON. 
    2. Flutter menerima response, meng-decode JSON menjadi model Dart (atau Map), lalu memperbarui state/UI (setState/Provider) sehingga data baru ditampilkan di layar. 
    3. Jika menggunakan model, parsing dan validasi tipe dilakukan pada tahap decoding sehingga UI hanya menerima data yang telah tervalidasi.

6. **Mekanisme autentikasi (register → login → logout)**
    1. Register: Flutter mengirim data/register JSON ke endpoint register Django, Django membuat user dan mereturn status sukses.
    2. Login: Flutter memanggil CookieRequest.login atau POST ke endpoint login, Django memvalidasi kredensial, membuat session dan mengirim session cookie (serta CSRF cookie jika perlu) yang disimpan CookieRequest, sehingga request berikutnya membawa cookie itu dan Django mengenali user sebagai authenticated. 
    3. Logout: Flutter memanggil endpoint logout (POST), Django menghapus session dan mereturn status, lalu CookieRequest membersihkan cookie lokal sehingga aplikasi kembali ke tampilan logged-out.

7. **Langkah implementasi checklist (step-by-step singkat)**
    1. Update proyek Django salah satunya menambahkan app authenticate, dan sesuaikan dengan kebutuhan Flutter.
    2. Mengimplementasikan fitur login, register, logout pada proyek Flutter.
    3. Menambahkan halaman login, register, products_entry_list (berisi list products_card yang mengandung name, price, description, thumbnail, category, is_featured), products_detail (dapat diakses dengan menekan products_card pada products_entry_list, menampilkan seluruh atribut pada model termasuk productViews, dan dapat kembali ke products_entry_list).
    4. Membuat model kustom pada proyek Flutter sesuai proyek Django.
    5. Mengintegrasikan sistem autentikasi Django dengan proyek Flutter.
    6. Memberikan filter pada products_entry_list dengan hanya menampilkan produk user yang sedang login (user itu sendiri/dapat dianggap My Products)

