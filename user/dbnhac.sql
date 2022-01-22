-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Máy chủ: 127.0.0.1:3306
-- Thời gian đã tạo: Th12 30, 2021 lúc 01:07 PM
-- Phiên bản máy phục vụ: 5.7.31
-- Phiên bản PHP: 7.3.21

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Cơ sở dữ liệu: `dbnhac`
--

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `admin`
--

DROP TABLE IF EXISTS `admin`;
CREATE TABLE IF NOT EXISTS `admin` (
  `username` varchar(50) NOT NULL,
  `hoten` varchar(50) NOT NULL,
  `matkhau` varchar(50) DEFAULT NULL,
  `email` varchar(50) NOT NULL,
  PRIMARY KEY (`username`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Đang đổ dữ liệu cho bảng `admin`
--

INSERT INTO `admin` (`username`, `hoten`, `matkhau`, `email`) VALUES
('z', 'z', 'z', 'z'),
('x', 'x', 'x', 'x'),
('nghia', 'nghia', '202cb962ac59075b964b07152d234b70', '2@gmail.com'),
('admin', 'nghia', '202cb962ac59075b964b07152d234b70', '2@gmail.com');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `chitiethoadon`
--

DROP TABLE IF EXISTS `chitiethoadon`;
CREATE TABLE IF NOT EXISTS `chitiethoadon` (
  `id_hd` varchar(50) CHARACTER SET latin1 NOT NULL,
  `id_dianhac` varchar(50) NOT NULL,
  `soluong` tinyint(3) UNSIGNED NOT NULL,
  `gia` float NOT NULL,
  PRIMARY KEY (`id_hd`,`id_dianhac`),
  KEY `id_dianhac` (`id_dianhac`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `dianhac`
--

DROP TABLE IF EXISTS `dianhac`;
CREATE TABLE IF NOT EXISTS `dianhac` (
  `id_dianhac` varchar(50) NOT NULL,
  `tendianhac` varchar(50) NOT NULL,
  `mota` text NOT NULL,
  `gia` int(10) NOT NULL,
  `hinh` varchar(50) NOT NULL,
  `id_theloai` varchar(50) NOT NULL,
  PRIMARY KEY (`id_dianhac`),
  KEY `id_theloai` (`id_theloai`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Đang đổ dữ liệu cho bảng `dianhac`
--

INSERT INTO `dianhac` (`id_dianhac`, `tendianhac`, `mota`, `gia`, `hinh`, `id_theloai`) VALUES
('DN10', 'Hãy trao cho anh ', '                                                          Sơn tùng MTP         ', 12345, '1640862521-Dia13.jpg', '2'),
('DN66', 'GT', '                                                                    Nhạc tình cảm ', 50000, '1640862461-Dia10.jpg', 'jp'),
('DN_1', 'truyền thái y', '                                Nhạc thể loại tình cảm lãng mạng                                                                                                                                                                                                                                                                                                                                                                                                                                                                                  ', 50000, '1640862407-Dia4.jpg', 'jp'),
('DN_2', 'Mlem Mlem', '                              Nhạc vui vẻ thoải mái tâm trạng                                                                                                                                                                                                   ', 40000, '1640862433-Dia6.jpg', '2');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `hoadon`
--

DROP TABLE IF EXISTS `hoadon`;
CREATE TABLE IF NOT EXISTS `hoadon` (
  `id_hd` varchar(50) CHARACTER SET latin1 NOT NULL,
  `email` varchar(50) CHARACTER SET latin1 NOT NULL,
  `ngaybd` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `tennguoinhan` varchar(50) NOT NULL,
  `diachi` varchar(50) NOT NULL,
  `ngaynhan` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `dienthoainguoinhan` varchar(10) NOT NULL,
  `tongtien` double NOT NULL,
  PRIMARY KEY (`id_hd`),
  KEY `email` (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `khachhang`
--

DROP TABLE IF EXISTS `khachhang`;
CREATE TABLE IF NOT EXISTS `khachhang` (
  `email` varchar(50) CHARACTER SET latin1 NOT NULL,
  `tenkh` varchar(50) NOT NULL,
  `matkhau` varchar(50) CHARACTER SET latin1 NOT NULL,
  `sodienthoai` varchar(10) NOT NULL,
  `diachi` varchar(50) NOT NULL,
  PRIMARY KEY (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Đang đổ dữ liệu cho bảng `khachhang`
--

INSERT INTO `khachhang` (`email`, `tenkh`, `matkhau`, `sodienthoai`, `diachi`) VALUES
('mykim22072000@gmail.com', 'kim', '25f9e794323b453885f5181f1b624d0b', '0122123123', 'quận 7'),
('mykim@gmail.com', 'kim', '202cb962ac59075b964b07152d234b70', '1234567890', 'quận 8'),
('nghiazero99@gmail.com', 'aa', '0cc175b9c0f1b6a831c399e269772661', '0358466737', 'aa');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `nhac`
--

DROP TABLE IF EXISTS `nhac`;
CREATE TABLE IF NOT EXISTS `nhac` (
  `id_nhac` varchar(50) NOT NULL,
  `tennhac` varchar(100) NOT NULL,
  `video` varchar(100) NOT NULL,
  `tentacgia` varchar(100) NOT NULL,
  PRIMARY KEY (`id_nhac`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Đang đổ dữ liệu cho bảng `nhac`
--

INSERT INTO `nhac` (`id_nhac`, `tennhac`, `video`, `tentacgia`) VALUES
('NH6', 'DAN DAN KOKORO HIKARETEKU', '1640867761-Hard ship của mình -....mp4', 'FIELD OF VIEW'),
('NH3', 'Truyền thái y', '1640867660-Truyền Thái Y - Ngô Kiến Huy x Masew x Đinh Hà Uyên Thư - Official Music Video.mp4', 'Ngô kiến huy'),
('NH4', 'Enkidu', '1640867695-【手描きFGO】Those who fight with the monster named Destiny.mp4', 'Gil'),
('NH5', 'Trên tình bạn', '1640867719-MIN - ‘TRÊN TÌNH BẠN, DƯỚI TÌNH YÊU’ LỄ HỘI GIAO LƯU VĂN HOÁ VIỆT HÀN 08112020.mp4', 'Min'),
('NH1', 'Nơi này có anh', '1640867607-Nơi Này Có Anh, Love Is... - Lyrics Video - The Frist Way.mp4', 'MTP'),
('NH2', 'Có chắc yêu là đây', '1640867636-SƠN TÙNG M-TP - CÓ CHẮC YÊU LÀ ĐÂY - OFFICIAL MUSIC VIDEO.mp4', 'MTP');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `theloai`
--

DROP TABLE IF EXISTS `theloai`;
CREATE TABLE IF NOT EXISTS `theloai` (
  `id_theloai` varchar(50) NOT NULL,
  `tentheloai` varchar(50) NOT NULL,
  PRIMARY KEY (`id_theloai`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Đang đổ dữ liệu cho bảng `theloai`
--

INSERT INTO `theloai` (`id_theloai`, `tentheloai`) VALUES
('2', 'Nhạc Việt'),
('jp', 'Nhạc Japan'),
('tq', 'Trung Quốc');

--
-- Các ràng buộc cho các bảng đã đổ
--

--
-- Các ràng buộc cho bảng `chitiethoadon`
--
ALTER TABLE `chitiethoadon`
  ADD CONSTRAINT `chitiethoadon_ibfk_1` FOREIGN KEY (`id_dianhac`) REFERENCES `dianhac` (`id_dianhac`),
  ADD CONSTRAINT `chitiethoadon_ibfk_2` FOREIGN KEY (`id_hd`) REFERENCES `hoadon` (`id_hd`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Các ràng buộc cho bảng `dianhac`
--
ALTER TABLE `dianhac`
  ADD CONSTRAINT `dianhac_ibfk_1` FOREIGN KEY (`id_theloai`) REFERENCES `theloai` (`id_theloai`);

--
-- Các ràng buộc cho bảng `hoadon`
--
ALTER TABLE `hoadon`
  ADD CONSTRAINT `hoadon_ibfk_1` FOREIGN KEY (`email`) REFERENCES `khachhang` (`email`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
