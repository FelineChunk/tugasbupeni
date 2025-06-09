// Fungsi untuk ambil data JSON
function loadJamData(callback) {
  $.getJSON('../data/jam.json', result => {
    callback(result.Search);
  });
}

// Fungsi untuk bikin 1 kartu jam
function jamCardTemplate(j) {
  return `
    <div class="col-md-3 my-3">
      <div class="card shadow-sm h-100">
        <img src="${j.Image}" class="card-img-top" alt="${j.Nama}">
        <div class="card-body">
          <h5 class="card-title">${j.Nama}</h5>
          <h6 class="card-subtitle mb-2 text-muted">${j.Harga}</h6>
          <button class="btn btn-primary mt-3 buy-btn" data-id="${j.Id}">Buy Now!</button>
        </div>
      </div>
    </div>
  `;
}

// Fungsi untuk generate kumpulan kartu jam
function generateJamCards(jamArray, limit = jamArray.length) {
  return jamArray.slice(0, limit).map(jamCardTemplate).join('');
}

// Fungsi render halaman produk
function renderProductPage() {
  loadJamData(jam => {
    const cards = '<div class="row jam-container">' + generateJamCards(jam) + '</div>';
    $('.container').html(cards);
    setupBuyButtons(jam); // Mengirim data jam ke setupBuyButtons setelah render
  });
}

// Fungsi render halaman Tentang
function renderAboutPage() {
  const aboutContent = `
    <header>
        <nav class="navbar navbar-expand-lg bg-body-tertiary shadow-sm">
            <div class="container-fluid">
                <a class="navbar-brand fw-bold" href="#">JamStore</a>
                <button class="navbar-toggler" type="button" data-bs-toggle="collapse"
                    data-bs-target="#navbarNavDropdown" aria-controls="navbarNavDropdown" aria-expanded="false"
                    aria-label="Toggle navigation">
                    <span class="navbar-toggler-icon"></span>
                </button>
                <div class="collapse navbar-collapse" id="navbarNavDropdown">
                    <ul class="navbar-nav ms-auto">
                        <li class="nav-item">
                            <a class="nav-link" href="home.html">Beranda</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="#">Product</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="#">History</a>
                        </li>
                        <li class="nav-item dropdown">
                            <a class="nav-link dropdown-toggle active" href="#" role="button" data-bs-toggle="dropdown"
                                aria-expanded="false">
                                Lainnya
                            </a>
                            <ul class="dropdown-menu">
                                <li><a class="dropdown-item active" href="#">Tentang</a></li>
                                <li><a class="dropdown-item" href="#">Kontak</a></li>
                                <li><a class="dropdown-item" href="#">Bantuan</a></li>
                            </ul>
                        </li>
                    </ul>
                </div>
            </div>
        </nav>
    </header>

    <main class="container my-5">
        <div class="text-center mb-5">
            <h2 class="fw-bold">Tentang JamStore</h2>
            <p class="text-muted">Membawa Karya Lokal ke Dunia Digital</p>
        </div>

        <div class="row">
            <div class="col-md-6">
                <img src="assets/bg1.jpg" class="img-fluid rounded shadow-sm" alt="Tentang Kami">
            </div>
            <div class="col-md-6">
                <h4>Siapa Kami?</h4>
                <p>JamStore adalah platform yang menyediakan berbagai produk jam tangan kerajinan tangan yang dibuat oleh pengrajin lokal dari seluruh Indonesia. Kami berkomitmen untuk mempromosikan kreativitas lokal dan menyediakan produk berkualitas tinggi yang unik dan autentik.</p>

                <h4>Misi Kami</h4>
                <p>Kami ingin menjadi jembatan antara pengrajin lokal dan konsumen modern dengan menyediakan wadah yang terpercaya, inovatif, dan mudah diakses.</p>

                <h4>Kenapa Pilih Kami?</h4>
                <ul>
                    <li>Produk otentik dan buatan tangan</li>
                    <li>Dukungan untuk UMKM lokal</li>
                    <li>Layanan pelanggan yang ramah dan responsif</li>
                </ul>
            </div>
        </div>
    </main>

    <footer>
        <p>&copy; 2025 JamStore. Semua hak dilindungi.</p>
    </footer>
  `;
  // Menambahkan konten halaman Tentang ke dalam elemen container
  $('body').html(aboutContent);
}

// Fungsi render halaman beranda
function renderHomePage() {
  loadJamData(jam => {
    let content = `
      <main class="container my-5">
        <h2 class="mb-4 text-center">Koleksi Jam Dinding</h2>

        <div id="carouselJam" class="carousel slide mb-5 shadow rounded overflow-hidden" data-bs-ride="carousel" style="max-height: 400px;">
          <div class="carousel-inner">
            <div class="carousel-item active">
              <img src="assets/bg1.jpg" class="d-block w-100" alt="Jam 1" style="height: 400px; object-fit: cover;">
            </div>
            <div class="carousel-item">
              <img src="assets/bg2.jpg" class="d-block w-100" alt="Jam 2" style="height: 400px; object-fit: cover;">
            </div>
            <div class="carousel-item">
              <img src="assets/bg3.jpg" class="d-block w-100" alt="Jam 3" style="height: 400px; object-fit: cover;">
            </div>
          </div>
          <button class="carousel-control-prev" type="button" data-bs-target="#carouselJam" data-bs-slide="prev">
            <span class="carousel-control-prev-icon" aria-hidden="true"></span>
            <span class="visually-hidden">Sebelumnya</span>
          </button>
          <button class="carousel-control-next" type="button" data-bs-target="#carouselJam" data-bs-slide="next">
            <span class="carousel-control-next-icon" aria-hidden="true"></span>
            <span class="visually-hidden">Selanjutnya</span>
          </button>
        </div>

        <div class="row jam-container">
          ${generateJamCards(jam, 4)}
        </div>
      </main>
    `;
    $('.container').html(content);
    setupBuyButtons(jam); // Mengirim data jam ke setupBuyButtons setelah render
  });
}

// Fungsi tampilkan modal detail
function showJamModal(jam) {
  $('#jamModalLabel').text(jam.Nama);
  $('#jamModalImage').attr('src', jam.Image);
  $('#jamModalHarga').text(jam.Harga);
  $('#jamModal').modal('show');
}

// Fungsi untuk handle tombol Buy Now!
function setupBuyButtons(jamArray) {
  $('.buy-btn').on('click', function () {
    const jamId = $(this).data('id');
    const jam = jamArray.find(j => j.Id === jamId);
    if (jam) showJamModal(jam);
  });
}

// Atur event listener navigasi
function setupNavListeners() {
  $('#Beranda').on('click', renderHomePage);
  $('#product').on('click', renderProductPage);
  $('#Tentang').on('click', renderAboutPage);  // Menambahkan listener untuk tombol "Tentang"

  $('.nav-link').on('click', function () {
    $('.nav-link').removeClass('active');
    $(this).addClass('active');
  });
}

// Jalankan saat dokumen siap
$(document).ready(() => {
  renderHomePage();
  setupNavListeners();
});
