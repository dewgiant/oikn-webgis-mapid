-- ============================================================
-- 02_data.sql — Data Sampel Kalimantan Timur & IKN
-- Sumber: Data publik BPS, BRIN, Kemendagri, OIKN
-- ============================================================

-- ─── DATA: Infrastruktur ────────────────────────────────────
INSERT INTO oikn.infrastruktur (nama, kategori, sub_kategori, status, kapasitas, pengelola, tahun_bangun, sumber_data, keterangan, geom) VALUES

-- Transportasi Udara
('Bandara Sultan Aji Muhammad Sulaiman Sepinggan', 'Transportasi', 'Bandar Udara', 'Beroperasi', '10 juta penumpang/tahun', 'AP I', 1997, 'Kemenhub 2023', 'Bandara Internasional utama Kalimantan Timur', ST_SetSRID(ST_MakePoint(116.8943, -1.2683), 4326)),
('Bandara Aji Pangeran Tumenggung Pranoto Samarinda', 'Transportasi', 'Bandar Udara', 'Beroperasi', '2 juta penumpang/tahun', 'AP I', 2018, 'Kemenhub 2023', 'Bandara domestik pengganti Temindung', ST_SetSRID(ST_MakePoint(117.2534, -0.3741), 4326)),
('Bandara Maratua', 'Transportasi', 'Bandar Udara', 'Beroperasi', '300 ribu penumpang/tahun', 'Kemenhub', 2016, 'Kemenhub 2023', 'Bandara di Kepulauan Derawan, Berau', ST_SetSRID(ST_MakePoint(118.6203, 2.2114), 4326)),

-- Transportasi Laut
('Pelabuhan Semayang Balikpapan', 'Transportasi', 'Pelabuhan', 'Beroperasi', '5 juta ton/tahun', 'Pelindo IV', 1985, 'Kemenhub 2023', 'Pelabuhan utama Balikpapan', ST_SetSRID(ST_MakePoint(116.8218, -1.2557), 4326)),
('Pelabuhan Samarinda', 'Transportasi', 'Pelabuhan', 'Beroperasi', '3 juta ton/tahun', 'Pelindo IV', 1975, 'Kemenhub 2023', 'Pelabuhan sungai Mahakam', ST_SetSRID(ST_MakePoint(117.1521, -0.4885), 4326)),
('Pelabuhan Kariangau Balikpapan', 'Transportasi', 'Pelabuhan', 'Beroperasi', '8 juta ton/tahun', 'Pelindo IV', 2012, 'Kemenhub 2023', 'Terminal peti kemas modern', ST_SetSRID(ST_MakePoint(116.7613, -1.2086), 4326)),
('Terminal Feri Penajam', 'Transportasi', 'Pelabuhan', 'Beroperasi', '1500 penumpang/hari', 'ASDP', 2005, 'Kemenhub 2023', 'Feri penyeberangan Balikpapan-Penajam', ST_SetSRID(ST_MakePoint(116.6845, -1.3568), 4326)),

-- Energi
('PLTU Embalut Kutai Kartanegara', 'Energi', 'Pembangkit Listrik', 'Beroperasi', '200 MW', 'PLN Kaltimra', 2004, 'PLN 2023', 'PLTU batubara utama Kaltim', ST_SetSRID(ST_MakePoint(117.0823, -0.3751), 4326)),
('PLTU Teluk Balikpapan', 'Energi', 'Pembangkit Listrik', 'Beroperasi', '110 MW', 'PLN Kaltimra', 2012, 'PLN 2023', 'PLTU skala besar Balikpapan', ST_SetSRID(ST_MakePoint(116.7986, -1.2501), 4326)),
('PLTS IKN Nusantara', 'Energi', 'Energi Terbarukan', 'Konstruksi', '50 MW', 'PLN / OIKN', 2024, 'OIKN 2024', 'PLTS untuk kebutuhan kawasan inti IKN', ST_SetSRID(ST_MakePoint(117.1620, -0.8512), 4326)),
('SPBU IKN Km 0', 'Energi', 'Bahan Bakar', 'Rencana', '500 KL/bulan', 'Pertamina', 2025, 'Pertamina 2024', 'SPBU khusus kawasan IKN', ST_SetSRID(ST_MakePoint(117.1710, -0.8600), 4326)),

-- Air Bersih
('SPAM IKN Sepaku', 'Air', 'Instalasi Air Minum', 'Konstruksi', '300 liter/detik', 'PUPR / OIKN', 2024, 'OIKN 2024', 'Sistem penyediaan air minum IKN', ST_SetSRID(ST_MakePoint(117.1510, -1.1280), 4326)),
('PDAM Tirta Manuntung Balikpapan', 'Air', 'Instalasi Air Minum', 'Beroperasi', '1800 liter/detik', 'PDAM Balikpapan', 1972, 'PDAM 2023', 'PDAM utama Kota Balikpapan', ST_SetSRID(ST_MakePoint(116.8672, -1.2438), 4326)),
('Bendungan Sepaku Semoi', 'Air', 'Bendungan', 'Beroperasi', '16 juta m³', 'PUPR', 2023, 'PUPR 2023', 'Bendungan utama pasokan air IKN', ST_SetSRID(ST_MakePoint(117.0900, -1.0800), 4326)),
('Embung IKN Nusantara', 'Air', 'Embung', 'Konstruksi', '4 juta m³', 'PUPR / OIKN', 2024, 'OIKN 2024', 'Embung penampung air hujan kawasan IKN', ST_SetSRID(ST_MakePoint(117.1980, -0.9120), 4326)),

-- Telekomunikasi
('BTS 5G Tower IKN', 'Telekomunikasi', 'Menara BTS', 'Konstruksi', '5G/4G', 'Telkomsel', 2024, 'Kominfo 2024', 'Menara BTS 5G pertama di kawasan IKN', ST_SetSRID(ST_MakePoint(117.1680, -0.8550), 4326)),
('Data Center IKN', 'Telekomunikasi', 'Pusat Data', 'Konstruksi', 'Tier-3, 5 MW', 'Kominfo / OIKN', 2025, 'OIKN 2024', 'Pusat data pemerintahan IKN', ST_SetSRID(ST_MakePoint(117.1750, -0.8480), 4326)),

-- Kesehatan
('RSUD Dr. Kanujoso Djatiwibowo', 'Kesehatan', 'Rumah Sakit', 'Beroperasi', '450 TT', 'Pemprov Kaltim', 1972, 'Kemenkes 2023', 'RS rujukan utama Kalimantan Timur', ST_SetSRID(ST_MakePoint(116.8542, -1.2682), 4326)),
('RS Pertamina Balikpapan', 'Kesehatan', 'Rumah Sakit', 'Beroperasi', '200 TT', 'Pertamina', 1988, 'Kemenkes 2023', 'RS swasta terbesar Balikpapan', ST_SetSRID(ST_MakePoint(116.8324, -1.2745), 4326)),
('Rumah Sakit IKN Nusantara', 'Kesehatan', 'Rumah Sakit', 'Rencana', '300 TT', 'OIKN / Kemenkes', 2025, 'OIKN 2024', 'RS modern di kawasan inti IKN', ST_SetSRID(ST_MakePoint(117.1810, -0.8700), 4326)),

-- Pendidikan
('Universitas Mulawarman', 'Pendidikan', 'Universitas', 'Beroperasi', '30.000 mahasiswa', 'Kemendikbud', 1962, 'BPS 2023', 'Universitas negeri terbesar Kaltim', ST_SetSRID(ST_MakePoint(117.1601, -0.4520), 4326)),
('Universitas Balikpapan', 'Pendidikan', 'Universitas', 'Beroperasi', '8.000 mahasiswa', 'Swasta', 1981, 'BPS 2023', 'Universitas swasta terkemuka Balikpapan', ST_SetSRID(ST_MakePoint(116.8812, -1.2510), 4326)),
('Kampus IKN Nusantara', 'Pendidikan', 'Universitas', 'Rencana', '15.000 mahasiswa', 'OIKN / Kemendikbud', 2026, 'OIKN 2024', 'Kampus pendidikan tinggi di IKN', ST_SetSRID(ST_MakePoint(117.1900, -0.8620), 4326)),

-- IKN Landmark
('Istana Negara IKN', 'Pemerintahan', 'Istana', 'Konstruksi', NULL, 'Setneg / OIKN', 2024, 'OIKN 2024', 'Istana kepresidenan baru di IKN Nusantara', ST_SetSRID(ST_MakePoint(117.1692, -0.8434), 4326)),
('Gedung DPR/MPR IKN', 'Pemerintahan', 'Legislatif', 'Rencana', NULL, 'Setneg / OIKN', 2026, 'OIKN 2024', 'Gedung parlemen di kawasan IKN', ST_SetSRID(ST_MakePoint(117.1750, -0.8500), 4326)),
('Kantor Kementerian IKN', 'Pemerintahan', 'Kementerian', 'Konstruksi', '10 kementerian', 'OIKN', 2024, 'OIKN 2024', 'Klaster kementerian koordinator IKN', ST_SetSRID(ST_MakePoint(117.1650, -0.8560), 4326));


-- ─── DATA: Kawasan (Polygon disederhanakan) ─────────────────
INSERT INTO oikn.kawasan (nama, jenis, luas_ha, status, kab_kota, keterangan, geom) VALUES

('Kawasan Inti Pusat Pemerintahan IKN',
 'IKN', 5620, 'Aktif - Konstruksi', 'Penajam Paser Utara',
 'Kawasan inti IKN seluas 5.620 Ha untuk fungsi pemerintahan pusat',
 ST_SetSRID(ST_Multi(ST_GeomFromText('POLYGON((117.14 -0.88, 117.22 -0.88, 117.22 -0.82, 117.14 -0.82, 117.14 -0.88))')), 4326)),

('Kawasan Pengembangan IKN',
 'IKN', 56180, 'Aktif - Perencanaan', 'Penajam Paser Utara',
 'Wilayah pengembangan IKN total 56.180 Ha',
 ST_SetSRID(ST_Multi(ST_GeomFromText('POLYGON((116.98 -1.05, 117.35 -1.05, 117.35 -0.72, 116.98 -0.72, 116.98 -1.05))')), 4326)),

('Kawasan Hutan Lindung Sungai Wain',
 'Hutan Lindung', 9782, 'Dilindungi', 'Balikpapan',
 'Hutan lindung dengan sumber air baku Balikpapan, habitat Bekantan',
 ST_SetSRID(ST_Multi(ST_GeomFromText('POLYGON((116.81 -1.10, 116.95 -1.10, 116.95 -1.00, 116.81 -1.00, 116.81 -1.10))')), 4326)),

('Kawasan Industri Kariangau',
 'Industri', 5130, 'Aktif - Operasional', 'Balikpapan',
 'Kawasan industri dengan pelabuhan peti kemas dan fasilitas logistik',
 ST_SetSRID(ST_Multi(ST_GeomFromText('POLYGON((116.74 -1.22, 116.80 -1.22, 116.80 -1.15, 116.74 -1.15, 116.74 -1.22))')), 4326)),

('Kota Balikpapan',
 'Permukiman', 50330, 'Aktif - Operasional', 'Balikpapan',
 'Wilayah administratif Kota Balikpapan, gerbang IKN',
 ST_SetSRID(ST_Multi(ST_GeomFromText('POLYGON((116.78 -1.32, 117.00 -1.32, 117.00 -1.18, 116.78 -1.18, 116.78 -1.32))')), 4326)),

('Kota Samarinda',
 'Permukiman', 71836, 'Aktif - Operasional', 'Samarinda',
 'Ibukota Provinsi Kalimantan Timur',
 ST_SetSRID(ST_Multi(ST_GeomFromText('POLYGON((117.08 -0.58, 117.23 -0.58, 117.23 -0.40, 117.08 -0.40, 117.08 -0.58))')), 4326)),

('Kawasan Mangrove Teluk Balikpapan',
 'Hutan Mangrove', 12800, 'Dilindungi', 'Balikpapan/PPU',
 'Ekosistem mangrove terbesar di Kalimantan Timur, habitat Bekantan',
 ST_SetSRID(ST_Multi(ST_GeomFromText('POLYGON((116.70 -1.28, 116.84 -1.28, 116.84 -1.15, 116.70 -1.15, 116.70 -1.28))')), 4326)),

('Kawasan Pertambangan Batubara Kutai',
 'Pertambangan', 45200, 'Aktif - Operasional', 'Kutai Kartanegara',
 'Kawasan konsesi batubara di Kutai Kartanegara',
 ST_SetSRID(ST_Multi(ST_GeomFromText('POLYGON((116.95 -0.50, 117.20 -0.50, 117.20 -0.25, 116.95 -0.25, 116.95 -0.50))')), 4326));


-- ─── DATA: Jaringan Jalan ───────────────────────────────────
INSERT INTO oikn.jaringan_jalan (nama, kelas, permukaan, kondisi, panjang_km, lebar_m, tahun_bangun, keterangan, geom) VALUES

('Jalan Tol Balikpapan–Samarinda (Balsam)',
 'Tol', 'Beton', 'Baik', 99.35, 23.5, 2019,
 'Tol pertama di Kalimantan, menghubungkan dua kota utama',
 ST_SetSRID(ST_Multi(ST_GeomFromText('LINESTRING(116.85 -1.25, 116.95 -1.10, 117.05 -0.80, 117.14 -0.55)')), 4326)),

('Jalan Tol Balikpapan–Penajam (Seksi I)',
 'Tol', 'Beton', 'Konstruksi', 11.5, 23.5, 2024,
 'Akses tol menuju IKN dari Balikpapan',
 ST_SetSRID(ST_Multi(ST_GeomFromText('LINESTRING(116.82 -1.22, 116.72 -1.28, 116.68 -1.35)')), 4326)),

('Jalan Nasional Trans-Kalimantan Segmen Kaltim',
 'Nasional', 'Aspal', 'Sedang', 287.5, 8.0, 2000,
 'Jalur trans-Kalimantan melewati Kalimantan Timur',
 ST_SetSRID(ST_Multi(ST_GeomFromText('LINESTRING(116.83 -1.27, 117.00 -1.05, 117.18 -0.50, 117.25 -0.35)')), 4326)),

('Jalan Akses IKN — Koridor Utama',
 'Nasional', 'Beton', 'Konstruksi', 47.5, 12.0, 2023,
 'Jalan akses utama dari Balikpapan ke kawasan IKN',
 ST_SetSRID(ST_Multi(ST_GeomFromText('LINESTRING(116.85 -1.22, 116.92 -1.10, 117.05 -0.98, 117.14 -0.88)')), 4326)),

('Jalan Lingkar Dalam IKN',
 'Nasional', 'Beton', 'Rencana', 23.0, 10.0, 2025,
 'Jalan lingkar dalam kawasan inti IKN',
 ST_SetSRID(ST_Multi(ST_GeomFromText('LINESTRING(117.14 -0.82, 117.18 -0.84, 117.22 -0.86, 117.20 -0.90, 117.16 -0.92, 117.14 -0.88)')), 4326)),

('Jalan Provinsi Balikpapan–Penajam',
 'Provinsi', 'Aspal', 'Sedang', 35.2, 7.0, 1998,
 'Jalan provinsi via Penajam Paser Utara',
 ST_SetSRID(ST_Multi(ST_GeomFromText('LINESTRING(116.82 -1.30, 116.75 -1.35, 116.70 -1.40, 116.68 -1.50)')), 4326));


-- ─── DATA: Pemantauan Lingkungan ────────────────────────────
INSERT INTO oikn.pemantauan_lingkungan (kode_stasiun, nama_lokasi, jenis_pemantauan, nilai_terakhir, satuan, status_baku, tanggal_ukur, sumber, geom) VALUES
('STN-AIR-001', 'Sungai Mahakam — Samarinda Hulu', 'Kualitas Air', 6.8, 'pH', 'Normal', '2024-01-15', 'DLHK Kaltim 2024', ST_SetSRID(ST_MakePoint(117.1200, -0.4600), 4326)),
('STN-AIR-002', 'Sungai Wain — Hulu', 'Kualitas Air', 7.1, 'pH', 'Normal', '2024-01-15', 'DLHK Kaltim 2024', ST_SetSRID(ST_MakePoint(116.8800, -1.0800), 4326)),
('STN-AIR-003', 'Teluk Balikpapan — Inlet', 'Kualitas Air', 7.8, 'pH', 'Normal', '2024-01-15', 'KLHK 2024', ST_SetSRID(ST_MakePoint(116.7800, -1.2000), 4326)),
('STN-AIR-004', 'Sungai Sepaku — Lokasi IKN', 'Kualitas Air', 6.5, 'pH', 'Waspada', '2024-01-15', 'OIKN 2024', ST_SetSRID(ST_MakePoint(117.0900, -1.1000), 4326)),
('STN-UDR-001', 'Jl. Sudirman Balikpapan', 'Kualitas Udara', 45.2, 'µg/m³ PM2.5', 'Normal', '2024-01-15', 'DLHK Kaltim 2024', ST_SetSRID(ST_MakePoint(116.8500, -1.2600), 4326)),
('STN-UDR-002', 'Kawasan Industri Kariangau', 'Kualitas Udara', 87.5, 'µg/m³ PM2.5', 'Waspada', '2024-01-15', 'DLHK Kaltim 2024', ST_SetSRID(ST_MakePoint(116.7700, -1.1900), 4326)),
('STN-UDR-003', 'Lokasi IKN Nusantara', 'Kualitas Udara', 12.3, 'µg/m³ PM2.5', 'Normal', '2024-01-15', 'OIKN 2024', ST_SetSRID(ST_MakePoint(117.1600, -0.8600), 4326)),
('STN-BIS-001', 'Jl. MT Haryono Balikpapan', 'Kebisingan', 72.4, 'dBA', 'Waspada', '2024-01-15', 'DLHK Kaltim 2024', ST_SetSRID(ST_MakePoint(116.8600, -1.2500), 4326));

SELECT '✅ Data sampel berhasil dimasukkan ke database!' AS status;
