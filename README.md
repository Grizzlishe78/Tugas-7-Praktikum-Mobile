Simon Dimas Pramudya <br>
H1D023104 <br>
Shift Asal G <br>
Shift Akhir D <br>

# Tugas 7 Pertemuan 9

Screenshoot Aplikasi

main.dart <br>

File utama aplikasi yang memanggil MyApp, mengatur tema, serta mendefinisikan routing ke halaman Login, Home, About, dan Profile. <br>

login_page.dart <br>

Halaman tempat pengguna memasukkan username dan password. Username akan disimpan menggunakan SharedPreferences dengan key 'username'. <br>

home_page.dart <br>

Halaman utama setelah login. Mengambil username dari SharedPreferences, menampilkan sapaan, serta menampilkan daftar tema musik lengkap dengan gambar dan deskripsi. <br>

about_page.dart <br>

Halaman detail yang menampilkan informasi lebih lengkap tentang tema musik yang dipilih, termasuk judul, deskripsi, dan gambar dari assets/images. <br>

side_menu.dart <br>

Widget menu samping (drawer) yang berisi navigasi ke halaman Home, About, Profile, serta tombol Logout yang menghapus data login dari SharedPreferences. <br>
