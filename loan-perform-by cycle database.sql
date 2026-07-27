SELECT 
  `loan_cycle`,
  COUNT(*) as loan_count,
  SUM(`plafond`) as total_disbursed,
  AVG(`plafond`) as avg_loan_size,
  COUNT(CASE WHEN `status_par` > 0 THEN 1 END) as par_loans,
  ROUND(COUNT(CASE WHEN `status_par` > 0 THEN 1 END) * 100.0 / COUNT(*), 2) as par_rate
FROM read_files('/Volumes/__databricks_internal_catalog_genie_files_7474652793626715/01f13e72d2d21a11adaa6f6502700987/76897870652803-01f13e72d2d21a11adaa6f6502700987/b2fc6917-a45c-47fd-a435-6286c6104aae', dateFormat => "yyyy-MM-dd", delimiter => ",", escape => "\"", format => "csv", header => "true", ignoreLeadingWhiteSpace => "true", ignoreTrailingWhiteSpace => "true", inferColumnTypes => "true", mergeSchema => "true", multiLine => "true", schemaEvolutionMode => "none", schemaHints => "`regional` string, `area_id` integer, `branch_id` integer, `area` string, `branch` string, `bp` string, `nama_bp_uk` string, `majelis` string, `borrower_id` integer, `nama_mitra` string, `loan_id` integer, `tanggal_disbursement` date, `plafond` integer, `reason_high_risk` string, `angsuran_minggu_berjalan` integer, `tenor` integer, `usia_loan` integer, `status_par` integer, `total_par` integer, `dpd` integer, `jumlah_tunggakan` integer, `jumlah_minggu_angsuran` integer, `jadwal_pelayanan` string, `os_total` integer, `os_lancar` integer, `hadir` integer, `tidak_hadir` integer, `tanggal_first_par` string, `tanggal_terakhir_par` string, `loan_cycle` integer, `status_par_last_month` string, `angsuran_per_minggu` integer, `angsuran_pokok` integer, `angsuran_profit` integer, `tanggal_terakhir_bayar` date, `last_partial_payment_date` string, `last_partial_payment_amount` integer, `jumlah_saldo_partial` integer, `sisa_frequency_bayar_lebih` integer, `saldo_bayar_lebih` integer, `no_telpon_mitra` string, `alamat_mitra` string, `kualitas_ojk_bulan_ini` string, `kualitas_ojk_bulan_lalu` string, `last_presence` string, `link_koordinat` string, `nomor_hp_afin` string, `tanggal_register_afin` date, `status_mitra` string", skipRows => "0") AS portfolio_data
WHERE `loan_cycle` IS NOT NULL
GROUP BY `loan_cycle`
ORDER BY `loan_cycle`
