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