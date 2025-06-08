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
          <a href="#" class="btn btn-primary mt-3" data-bs-toggle="modal" id="${j.Id} data-bs-target="#MovieDetailModal">Buy Now!</a>
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
  });
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
  });
}

function modal(){
document.querySelectorAll('.btn').addEventListener('click', (a) => {
  id = document.getElementById.a
console.log(`btn diklik dengan id ${a}`)
})
}

// Atur event listener navigasi
function setupNavListeners() {
  document.querySelector('#Beranda').addEventListener('click', renderHomePage);
  document.querySelector('#product').addEventListener('click', renderProductPage);

  // Tambahkan class 'active' di nav-link yang diklik
  document.querySelectorAll('.nav-link').forEach(link => {
    link.addEventListener('click', function () {
      document.querySelectorAll('.nav-link').forEach(item => item.classList.remove('active'));
      this.classList.add('active');
    });
  });
}

// Jalankan saat dokumen siap
$(document).ready(() => {
  renderHomePage(); // Default tampil beranda
  setupNavListeners();
});
