
# <h1 align="center"> 𝑪𝒂𝒍𝒎é𝒓𝒂🌸 </h1>

<img width="1536" height="1024" alt="image" src="https://github.com/user-attachments/assets/ce64b977-a9b9-46c7-9a9d-4ac6c2f0e886" />

<p align="center">────────── ✿ ──────────</p>

<p align="center">
  𝚂𝚖𝚊𝚛𝚝 𝚠𝚊𝚢 𝚝𝚘 𝚞𝚗𝚍𝚎𝚛𝚜𝚝𝚊𝚗𝚍 𝚢𝚘𝚞𝚛 𝚜𝚔𝚒𝚗 𝚓𝚘𝚞𝚛𝚗𝚎𝚢 🌸
</p>


 <p align="center">
  <img src="https://img.shields.io/badge/Flutter-Framework-blue?logo=flutter" />
  <img src="https://img.shields.io/badge/CRUD-Implemented-pink" />
  <img src="https://img.shields.io/badge/Multi%20Page-Navigation-purple" />
</p>

<p align="center">────────── ✿ ──────────</p>

---

## 
| Keterangan | Detail |
|------------|--------|
| **Nama**   | Zelsya Rizqita Rahmadhini |
| **NIM**    | 2409116022 |
| **Kelas**  | A'24 Sistem Informasi|


---

## Deskripsi Aplikasi

Calmera adalah aplikasi sederhana yang dikembangkan untuk membantu pengguna mengelola dan memantau penggunaan produk skincare secara lebih teratur dan terorganisir. Aplikasi ini dirancang sebagai solusi praktis bagi pengguna yang ingin memahami dan mengatur perjalanan perawatan kulitnya dengan lebih baik. Melalui Calmera, pengguna dapat mencatat nama produk, jenis produk, serta cara pemakaian atau catatan penting lainnya dalam satu tempat yang mudah diakses dan diperbarui. Dengan fitur pengelolaan data yang lengkap, aplikasi ini membantu pengguna menghindari kebingungan dalam penggunaan produk, menjaga konsistensi rutinitas, serta memahami perkembangan perawatan kulit secara lebih terstruktur.

Selain sebagai media pencatatan skincare, aplikasi ini juga menjadi implementasi konsep dasar pengembangan aplikasi mobile, seperti pengelolaan state, navigasi antar halaman, serta operasi CRUD (Create, Read, Update, Delete).

---
## Tujuan Pembuatan Aplikasi

Aplikasi Calmera dibuat untuk membantu pengguna mencatat dan mengelola produk skincare secara praktis dan terorganisir. Melalui aplikasi ini, pengguna dapat menyimpan informasi penting seperti nama produk, jenis, dan cara pemakaian dalam satu tempat yang mudah diakses dan diperbarui. Aplikasi ini dapat diterapkan dalam kehidupan sehari-hari, terutama bagi pengguna skincare yang ingin mengatur rutinitas perawatan kulit dengan lebih terstruktur dan tidak mudah lupa.

---

## Fitur Aplikasi

Aplikasi **Calmera** memiliki beberapa fitur utama sebagai berikut:

### **1. Menambahkan Data Produk Skincare**

Pengguna dapat menambahkan produk baru dengan mengisi nama produk, jenis produk, serta catatan atau cara pemakaian sesuai kebutuhan.


---

### **2. Mengedit Data Produk Skincare**

Pengguna dapat memperbarui informasi produk yang telah tersimpan apabila terdapat perubahan atau kesalahan data.


---

### **3. Menghapus Data Produk Skincare**

Pengguna dapat menghapus produk dari daftar jika sudah tidak digunakan lagi.


---

### **4. Menampilkan Daftar Produk**

Seluruh produk yang telah ditambahkan akan ditampilkan dalam daftar yang tersusun rapi sehingga mudah dipantau.


---

### **5. Navigasi Antar Halaman**

Aplikasi menyediakan navigasi antara halaman utama dan halaman tambah/edit data menggunakan sistem Navigator pada Flutter.


--- 

### **6. Desain Antarmuka Modern dan Aesthetic**

Tampilan aplikasi dirancang dengan tema soft pink yang sederhana, bersih, dan nyaman digunakan.


---

## Widget yang Digunakan

Berikut adalah widget utama yang digunakan dalam pengembangan aplikasi **Calmera**:

| No | Widget | Fungsi |
|----|--------|-----------------------|
| 1 | MaterialApp | Root aplikasi untuk mengatur tema dan konfigurasi dasar. |
| 2 | Scaffold | Struktur dasar halaman seperti body dan floating button. |
| 3 | AppBar | Header pada halaman Add/Edit. |
| 4 | Column | Menyusun widget secara vertikal. |
| 5 | Row | Menyusun elemen secara horizontal. |
| 6 | Expanded | Mengatur pembagian ruang antar widget. |
| 7 | ListView.builder | Menampilkan daftar produk secara dinamis. |
| 8 | Container | Membungkus dan mendesain elemen UI. |
| 9 | Text | Menampilkan teks pada aplikasi. |
|10 | TextField | Input data produk skincare. |
|11 | ElevatedButton | Tombol untuk menyimpan data. |
|12 | FloatingActionButton | Tombol tambah produk. |
|13 | IconButton | Tombol edit dan hapus data. |
|14 | Navigator | Mengatur perpindahan halaman. |
|15 | MaterialPageRoute | Membuat rute navigasi halaman. |
|16 | Padding | Memberi jarak antar elemen. |
|17 | BoxDecoration | Mengatur tampilan seperti warna dan border radius. |
|18 | ClipRRect | Membuat sudut gambar melengkung. |
|19 | Image.asset | Menampilkan gambar dari folder assets. |

---

## ⭐ Nilai Tambah

Aplikasi Calmera memiliki nilai tambah karena telah memenuhi dua kriteria tambahan yang ditentukan dalam tugas, yaitu fitur Update dan navigasi multi halaman.

### 1. Fitur Update (Edit Data)

  Selain dapat menambahkan dan menghapus data, diaplikasi ini juga pengguna bisa mengedit data produk skincare yang sudah tersimpan.
  Pengguna cukup menekan ikon edit pada salah satu produk, kemudian aplikasi akan membuka halaman edit dengan data yang sudah terisi sebelumnya. Setelah data diperbarui dan    tombol simpan ditekan, perubahan tersebut langsung terlihat pada halaman utama.

--- 

### 2. Navigasi Multi Halaman (Multi Page Navigation)

Aplikasi Calmera juga menggunakan lebih dari satu halaman, yaitu halaman utama (Home) dan halaman tambah/edit data.
Perpindahan antar halaman dilakukan menggunakan Navigator dan MaterialPageRoute. Saat pengguna menekan tombol tambah atau ikon edit, aplikasi akan berpindah ke halaman lain untuk mengisi atau memperbarui data.

---

## Alur Aplikasi



Calmera adalah aplikasi yang dikembangkan menggunakan Flutter untuk membantu pengguna mengelola dan memantau penggunaan produk skincare secara lebih teratur dan terorganisir. Aplikasi ini dirancang sebagai solusi praktis bagi pengguna yang ingin memahami dan mengatur perjalanan perawatan kulitnya dengan lebih baik.

---

### ➣ Halaman Utama (Home Page)

Halaman utama merupakan halaman pertama yang muncul saat aplikasi Calmera dijalankan. Pada halaman ini, pengguna dapat melihat seluruh data produk skincare yang telah disimpan sebelumnya dalam bentuk daftar.

Setiap produk ditampilkan dengan informasi utama berupa nama produk, jenis produk, serta catatan atau cara pemakaian. Dari halaman ini, pengguna dapat langsung mengelola data yang tersedia.

> <img width="1920" height="1022" alt="image" src="https://github.com/user-attachments/assets/31ddf71e-d0d5-4fec-ac7b-27ef7afea5b8" />

### ➣ Halaman Edit Skincare 

Halaman ini digunakan untuk memperbarui data produk yang sudah terdaftar. Halaman ini dapat diakses melalui ikon edit pada halaman utama.

Data produk akan otomatis terisi sesuai dengan item yang dipilih. Pengguna dapat mengubah nama produk, jenis produk, dan catatan pemakaian. Setelah menekan tombol Simpan, data akan diperbarui dan langsung tampil kembali di halaman utama. Dengan adanya halaman ini, pengguna tidak perlu menghapus dan menambahkan ulang data, karena perubahan dapat dilakukan secara langsung melalui fitur edit.

> <img width="1919" height="1016" alt="image" src="https://github.com/user-attachments/assets/9138ccca-b148-41a5-a5e9-722b8500e357" />

Sebagai contoh, saya melakukan pembaruan pada produk Cetaphil Gentle Skin Cleanser menjadi La Mer The Cleansing Foam melalui halaman Edit Skincare.
Saya mengubah nama produk dan menyesuaikan catatan pemakaiannya, kemudian menekan tombol Simpan.

> <img width="1920" height="1020" alt="image" src="https://github.com/user-attachments/assets/c9de06f6-1445-410b-852e-7eec7a7efc41" />

Setelah menekan tombol Simpan, data akan langsung diperbarui dan perubahan tersebut otomatis ditampilkan pada halaman utama tanpa perlu menghapus data sebelumnya.

> <img width="1919" height="1027" alt="image" src="https://github.com/user-attachments/assets/2aff87f7-ed29-4174-b9c3-90c5513ccf58" />

### ➣ Halaman Add Skincare

Halaman Add Skincare digunakan untuk menambahkan data produk baru ke dalam aplikasi. Halaman ini dapat diakses melalui tombol tambah (+) pada halaman utama.
Pada halaman ini, pengguna diminta mengisi tiga data utama, yaitu nama produk, jenis produk, serta cara pakai atau catatan. Sebagai contoh, saya menambahkan produk N°1 DE CHANEL dengan jenis Cream Brightening melalui halaman Add Skincare. Setelah semua data diisi, pengguna menekan tombol Simpan untuk menyimpan informasi tersebut.

> <img width="1918" height="1010" alt="image" src="https://github.com/user-attachments/assets/8009279a-c3ca-47db-9679-03007ff6b0ec" />

Setelah semua data diisi dan tombol Simpan ditekan, produk tersebut langsung ditambahkan ke dalam daftar pada halaman utama.

> <img width="1920" height="1015" alt="image" src="https://github.com/user-attachments/assets/7f50078a-133b-4f23-9390-72e02ad1f144" />



