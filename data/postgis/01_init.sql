-- ============================================================
-- 01_init.sql — Setup Schema & Tabel
-- Database: gisdb (PostGIS enabled)
-- ============================================================

-- Enable PostGIS extensions
CREATE EXTENSION IF NOT EXISTS postgis;
CREATE EXTENSION IF NOT EXISTS postgis_topology;
CREATE EXTENSION IF NOT EXISTS fuzzystrmatch;
CREATE EXTENSION IF NOT EXISTS postgis_tiger_geocoder;

-- ─── Schema ────────────────────────────────────────────────
CREATE SCHEMA IF NOT EXISTS oikn;

-- ─── Tabel 1: Titik Infrastruktur ──────────────────────────
CREATE TABLE IF NOT EXISTS oikn.infrastruktur (
    id          SERIAL PRIMARY KEY,
    nama        VARCHAR(255)  NOT NULL,
    kategori    VARCHAR(100)  NOT NULL,   -- Jalan, Energi, Air, Telkom, Kesehatan, Pendidikan
    sub_kategori VARCHAR(100),
    status      VARCHAR(50)   DEFAULT 'Beroperasi', -- Beroperasi, Konstruksi, Rencana
    kapasitas   VARCHAR(100),
    pengelola   VARCHAR(200),
    tahun_bangun INTEGER,
    sumber_data VARCHAR(200),
    keterangan  TEXT,
    geom        GEOMETRY(Point, 4326)
);

-- ─── Tabel 2: Kawasan / Zona (Polygon) ─────────────────────
CREATE TABLE IF NOT EXISTS oikn.kawasan (
    id          SERIAL PRIMARY KEY,
    nama        VARCHAR(255)  NOT NULL,
    jenis       VARCHAR(100)  NOT NULL,  -- IKN, Hutan Lindung, Pertanian, Permukiman
    luas_ha     NUMERIC(12,2),
    status      VARCHAR(100),
    kab_kota    VARCHAR(100),
    provinsi    VARCHAR(100)  DEFAULT 'Kalimantan Timur',
    keterangan  TEXT,
    geom        GEOMETRY(MultiPolygon, 4326)
);

-- ─── Tabel 3: Jaringan Jalan (LineString) ──────────────────
CREATE TABLE IF NOT EXISTS oikn.jaringan_jalan (
    id          SERIAL PRIMARY KEY,
    nama        VARCHAR(255),
    kelas       VARCHAR(50),  -- Nasional, Provinsi, Kabupaten, Lokal
    permukaan   VARCHAR(50),  -- Aspal, Beton, Kerikil, Tanah
    kondisi     VARCHAR(50),  -- Baik, Sedang, Rusak, Konstruksi
    panjang_km  NUMERIC(8,3),
    lebar_m     NUMERIC(5,1),
    tahun_bangun INTEGER,
    keterangan  TEXT,
    geom        GEOMETRY(MultiLineString, 4326)
);

-- ─── Tabel 4: Titik Pemantauan Lingkungan ──────────────────
CREATE TABLE IF NOT EXISTS oikn.pemantauan_lingkungan (
    id              SERIAL PRIMARY KEY,
    kode_stasiun    VARCHAR(50) UNIQUE,
    nama_lokasi     VARCHAR(255),
    jenis_pemantauan VARCHAR(100),  -- Kualitas Air, Kualitas Udara, Kebisingan
    nilai_terakhir  NUMERIC(10,3),
    satuan          VARCHAR(50),
    status_baku     VARCHAR(50),    -- Normal, Waspada, Kritis
    tanggal_ukur    DATE,
    sumber          VARCHAR(200),
    geom            GEOMETRY(Point, 4326)
);

-- ─── Spatial Indexes ───────────────────────────────────────
CREATE INDEX idx_infrastruktur_geom   ON oikn.infrastruktur          USING GIST (geom);
CREATE INDEX idx_kawasan_geom         ON oikn.kawasan                 USING GIST (geom);
CREATE INDEX idx_jalan_geom           ON oikn.jaringan_jalan          USING GIST (geom);
CREATE INDEX idx_lingkungan_geom      ON oikn.pemantauan_lingkungan   USING GIST (geom);

-- Attribute indexes
CREATE INDEX idx_infrastruktur_kategori ON oikn.infrastruktur (kategori);
CREATE INDEX idx_kawasan_jenis          ON oikn.kawasan (jenis);

SELECT '✅ Schema dan tabel berhasil dibuat!' AS status;
