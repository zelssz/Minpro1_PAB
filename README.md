# <h1 align="center"> 𝑪𝒂𝒍𝒎é𝒓𝒂🌸 </h1>


## Deskripsi Aplikasi

Calmera merupakan aplikasi mobile sederhana yang dikembangkan menggunakan framework Flutter. Aplikasi ini dirancang untuk membantu pengguna mencatat dan mengelola produk skincare pribadi secara terstruktur dan mudah dipantau.

Melalui aplikasi ini, pengguna dapat menyimpan informasi penting mengenai produk yang digunakan, seperti nama produk, jenis produk, serta catatan atau cara pemakaian. Semua data ditampilkan dalam bentuk daftar yang rapi sehingga memudahkan pengguna melihat dan mengelola rutinitas perawatan kulit mereka.

Selain sebagai media pencatatan skincare, aplikasi ini juga menjadi implementasi konsep dasar pengembangan aplikasi mobile, seperti pengelolaan state, navigasi antar halaman, serta operasi CRUD (Create, Read, Update, Delete).



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

| No | Widget | Keterangan |
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
### Halaman Utama (Home Page)

Halaman utama merupakan halaman pertama yang muncul saat aplikasi Calmera dijalankan. Pada halaman ini, pengguna dapat melihat seluruh data produk skincare yang telah disimpan sebelumnya dalam bentuk daftar.

Setiap produk ditampilkan dengan informasi utama berupa nama produk, jenis produk, serta catatan atau cara pemakaian. Dari halaman ini, pengguna dapat langsung mengelola data yang tersedia.

<img width="1920" height="1022" alt="image" src="https://github.com/user-attachments/assets/31ddf71e-d0d5-4fec-ac7b-27ef7afea5b8" />

### Halaman Edit Skincare 

Halaman ini digunakan untuk memperbarui data produk yang sudah terdaftar. Halaman ini dapat diakses melalui ikon edit pada halaman utama.

Data produk akan otomatis terisi sesuai dengan item yang dipilih. Pengguna dapat mengubah nama produk, jenis produk, dan catatan pemakaian. Setelah menekan tombol Simpan, data akan diperbarui dan langsung tampil kembali di halaman utama. Dengan adanya halaman ini, pengguna tidak perlu menghapus dan menambahkan ulang data, karena perubahan dapat dilakukan secara langsung melalui fitur edit.

<img width="1919" height="1016" alt="image" src="https://github.com/user-attachments/assets/9138ccca-b148-41a5-a5e9-722b8500e357" />
