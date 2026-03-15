# 🗺️ OIKN WebGIS Training — IKN Nusantara & Kalimantan Timur

> Sistem Informasi Geografis (WebGIS) berbasis web untuk visualisasi dan analisis data spasial kawasan IKN Nusantara dan Kalimantan Timur, dibangun menggunakan stack open-source modern.

[![MapLibre GL JS](https://img.shields.io/badge/MapLibre_GL_JS-4.1.0-blue)](https://maplibre.org/)
[![GeoServer](https://img.shields.io/badge/GeoServer-2.23.0-green)](https://geoserver.org/)
[![PostGIS](https://img.shields.io/badge/PostGIS-15--3.3-blue)](https://postgis.net/)
[![Docker](https://img.shields.io/badge/Docker-Compose-2496ED)](https://docker.com/)
[![License](https://img.shields.io/badge/License-MIT-yellow)](LICENSE)

---

## 📋 Deskripsi Proyek

Proyek ini merupakan implementasi WebGIS untuk mendukung pemantauan dan perencanaan pembangunan **IKN Nusantara** dan wilayah **Kalimantan Timur**. Platform ini mengintegrasikan:

- **26 titik infrastruktur** strategis (transportasi, energi, air, telekomunikasi, kesehatan, pendidikan, pemerintahan)
- **8 kawasan wilayah** (IKN, hutan lindung, industri, permukiman, mangrove, pertambangan)
- **6 ruas jalan** utama (tol, nasional, provinsi)
- **8 stasiun pemantauan lingkungan** (kualitas air, udara, kebisingan)

---

## 🏗️ Arsitektur Sistem

```
┌─────────────────────────────────────────────────────────────┐
│                      Browser / Client                        │
│               MapLibre GL JS (Frontend)                      │
└──────────────────────────┬──────────────────────────────────┘
                           │ HTTP/WMS/WFS
┌──────────────────────────▼──────────────────────────────────┐
│                     Nginx (Port 80)                          │
│              Reverse Proxy + Static Files                    │
└────────────┬─────────────────────────────────┬──────────────┘
             │                                 │
┌────────────▼─────────────┐   ┌───────────────▼──────────────┐
│  GeoServer (Port 8080)   │   │  GeoNetwork (Port 8081)      │
│  WMS · WFS · WCS         │   │  Metadata Catalog (CSW)      │
└────────────┬─────────────┘   └──────────────────────────────┘
             │ JDBC
┌────────────▼─────────────────────────────────────────────────┐
│              PostGIS — PostgreSQL 15 (Port 5432)             │
│   Schema: oikn                                               │
│   Tables: infrastruktur · kawasan · jaringan_jalan           │
│           pemantauan_lingkungan                              │
└──────────────────────────────────────────────────────────────┘
```

---

## 🗂️ Struktur Repository

```
oikn-webgis-training-mapid/
│
├── 📄 docker-compose.yaml          # Orkestrasi semua service
├── 📄 .env.example                 # Template environment variables
├── 📄 README.md                    # Dokumentasi utama (file ini)
├── 📄 .gitignore
│
├── 📁 frontend/                    # Aplikasi peta (MapLibre GL JS + Vite)
│   ├── index.html                  # Halaman peta utama
│   ├── package.json                # Dependencies
│   ├── vite.config.js              # Konfigurasi Vite + proxy
│   └── README.md                   # Panduan frontend
│
└── 📁 data/                        # Konfigurasi data & service
    ├── postgis/
    │   ├── 01_init.sql             # Skema database + tabel + index
    │   └── 02_data.sql             # Data sampel (26 infrastruktur, 8 kawasan, dll)
    ├── geoserver/
    │   └── SETUP_GEOSERVER.md      # Panduan publish layer di GeoServer
    └── nginx/
        └── nginx.conf              # Reverse proxy config
```

---

## 🚀 Cara Menjalankan

### Prasyarat

| Software | Versi Minimum | Keterangan |
|----------|--------------|------------|
| Docker Desktop | 24.x | Untuk menjalankan container |
| Node.js | 18.x | Untuk development frontend |
| QGIS | 3.28 | Opsional, untuk eksplorasi data |

### 1. Clone Repository

```bash
git clone https://github.com/USERNAME/oikn-webgis-training-mapid.git
cd oikn-webgis-training-mapid
```

### 2. Setup Environment Variables

```bash
cp .env.example .env
# Edit .env sesuai kebutuhan (opsional, default sudah bisa digunakan)
```

### 3. Jalankan Backend (Docker)

```bash
docker compose up -d
```

Tunggu semua service ready (±2-3 menit untuk GeoServer pertama kali):

```bash
docker compose ps        # Cek status service
docker compose logs -f   # Pantau log
```

### 4. Verifikasi Service

| Service | URL | Login |
|---------|-----|-------|
| GeoServer | http://localhost:8080/geoserver | admin / geoserver |
| GeoNetwork | http://localhost:8081/geonetwork | admin / admin |
| PostGIS | localhost:5432 | gisuser / gispassword |

### 5. Jalankan Frontend

```bash
cd frontend
npm install
npm run dev
```

Buka browser: **http://localhost:3000**

---

## 🗄️ Database Schema

Database `gisdb` dengan schema `oikn` berisi 4 tabel:

### Tabel `oikn.infrastruktur`
| Kolom | Tipe | Keterangan |
|-------|------|-----------|
| id | SERIAL PK | ID unik |
| nama | VARCHAR(255) | Nama infrastruktur |
| kategori | VARCHAR(100) | Transportasi, Energi, Air, dll |
| sub_kategori | VARCHAR(100) | Tipe spesifik |
| status | VARCHAR(50) | Beroperasi / Konstruksi / Rencana |
| kapasitas | VARCHAR(100) | Kapasitas/skala |
| pengelola | VARCHAR(200) | Instansi pengelola |
| tahun_bangun | INTEGER | Tahun pembangunan |
| geom | GEOMETRY(Point,4326) | Koordinat spasial |

### Tabel `oikn.kawasan`
Polygon wilayah dengan atribut jenis, luas (ha), status, dan kabupaten/kota.

### Tabel `oikn.jaringan_jalan`
LineString jaringan jalan dengan kelas, permukaan, kondisi, dan panjang (km).

### Tabel `oikn.pemantauan_lingkungan`
Point stasiun pemantauan dengan nilai pengukuran dan status baku mutu.

---

## 🌍 Fitur WebGIS

| Fitur | Keterangan |
|-------|-----------|
| **Multi-basemap** | OpenStreetMap, Citra Satelit Esri, Dark Mode, OpenTopoMap |
| **4 Layer Tematik** | Kawasan, Jalan, Infrastruktur, Lingkungan |
| **Filter Layer** | Filter per kategori infrastruktur & kelas jalan |
| **Popup Atribut** | Klik fitur untuk melihat detail atribut |
| **Info Panel** | Panel sidebar menampilkan atribut lengkap |
| **Legenda Status** | Beroperasi / Konstruksi / Rencana |
| **WMS GeoServer** | Integrasi layer WMS dari GeoServer |
| **Koordinat Kursor** | Tampilan koordinat real-time |
| **Fullscreen Mode** | Mode layar penuh |
| **Scale Bar** | Skala peta dinamis |

---

## 🌐 GeoServer — WMS & WFS Endpoint

Setelah layer dipublish (lihat `data/geoserver/SETUP_GEOSERVER.md`):

```
# WMS — Tampilan peta
http://localhost:8080/geoserver/oikn/wms?
  service=WMS&version=1.1.1&request=GetCapabilities

# WFS — Data vektor (GeoJSON)
http://localhost:8080/geoserver/oikn/wfs?
  service=WFS&version=2.0.0&request=GetFeature
  &typeName=oikn:infrastruktur
  &outputFormat=application/json

# WFS — Filter by CQL
http://localhost:8080/geoserver/oikn/wfs?
  service=WFS&request=GetFeature
  &typeName=oikn:infrastruktur
  &CQL_FILTER=status='Beroperasi'
  &outputFormat=application/json
```

---

## 🔌 Integrasi QGIS

### Koneksi PostGIS
1. **Layer** → **Data Source Manager** → **PostgreSQL**
2. Klik **New** → isi nama koneksi
3. Host: `localhost` | Port: `5432` | DB: `gisdb`
4. Username: `gisuser` | Password: `gispassword`
5. **Connect** → pilih schema `oikn` → tambah layer

### Koneksi WMS GeoServer
1. **Layer** → **Add Layer** → **Add WMS/WMTS Layer**
2. URL: `http://localhost:8080/geoserver/oikn/wms`
3. Connect → pilih layer yang diinginkan

---

## 🛑 Menghentikan Service

```bash
docker compose down           # Hentikan service (data tersimpan)
docker compose down -v        # Hentikan + hapus semua volume
docker compose restart        # Restart semua service
docker compose restart geoserver  # Restart service tertentu
```

---

## 🛠️ Troubleshooting

**GeoServer tidak bisa konek ke PostGIS:**
```bash
# Pastikan PostGIS sudah healthy
docker compose ps
# Lihat log PostGIS
docker compose logs postgis
```

**Frontend tidak menampilkan peta:**
```bash
# Pastikan npm install sudah dijalankan
cd frontend && npm install && npm run dev
```

**Port sudah terpakai:**
```bash
# Edit port di docker-compose.yaml
# Contoh ganti 8080 ke 8082 di bagian ports geoserver
```

---

## 📚 Teknologi & Referensi

| Teknologi | Versi | Dokumentasi |
|-----------|-------|-------------|
| MapLibre GL JS | 4.1.0 | https://maplibre.org/maplibre-gl-js/docs/ |
| Vite | 5.x | https://vitejs.dev/ |
| GeoServer | 2.23.0 | https://docs.geoserver.org/ |
| PostGIS | 15-3.3 | https://postgis.net/documentation/ |
| GeoNetwork | 4.2 | https://docs.geonetwork-opensource.org/ |
| Docker Compose | v2 | https://docs.docker.com/compose/ |

---

## 📊 Sumber Data

| Data | Sumber | Tahun |
|------|--------|-------|
| Infrastruktur transportasi | Kementerian Perhubungan | 2023 |
| Data pembangkit listrik | PLN Kalimantan Timur | 2023 |
| Data OIKN & IKN | Otorita IKN | 2024 |
| Batas administrasi | BPS Kaltim | 2023 |
| Kualitas lingkungan | DLHK Kaltim | 2024 |

> **Catatan:** Data yang digunakan dalam proyek ini bersifat publik dan digunakan untuk tujuan pelatihan. Sebagian koordinat merupakan koordinat perkiraan berdasarkan informasi publik yang tersedia.

---

## 👥 Kontribusi

Silakan buat Pull Request atau Issue untuk perbaikan dan penambahan data.

---

*Dibuat untuk keperluan OIKN WebGIS Training — MapID*
