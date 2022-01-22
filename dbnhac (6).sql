-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Máy chủ: 127.0.0.1:3306
-- Thời gian đã tạo: Th1 08, 2022 lúc 10:02 AM
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
('admin', 'nghia', '202cb962ac59075b964b07152d234b70', 'nghia2412@gmail.com'),
('Kim', 'admin', '202cb962ac59075b964b07152d234b70', 'mykim@gmail.com');

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

--
-- Đang đổ dữ liệu cho bảng `chitiethoadon`
--

INSERT INTO `chitiethoadon` (`id_hd`, `id_dianhac`, `soluong`, `gia`) VALUES
('hd151', 'DN66', 1, 12345),
('hd195', 'DN99', 1, 12345),
('hd262', 'DN10', 1, 500000),
('hd262', 'DN76', 1, 300000),
('hd262', 'DN99', 1, 12345),
('hd359', 'DN76', 1, 300000),
('hd359', 'DN99', 2, 12345),
('hd386', 'DN10', 1, 500000),
('hd438', 'DN76', 1, 300000),
('hd438', 'DN99', 1, 12345),
('hd45', 'DN66', 1, 12345),
('hd46', 'DN99', 1, 12345),
('hd477', 'DN99', 1, 12345),
('hd495', 'DN10', 1, 500000),
('hd565', 'DN99', 1, 12345),
('hd605', 'DN10', 1, 500000),
('hd767', 'DN10', 1, 500000),
('hd801', 'DN76', 2, 300000),
('hd801', 'DN99', 2, 12345),
('hd848', 'DN10', 1, 500000),
('hd848', 'DN99', 1, 12345),
('hd942', 'DN66', 1, 12345);

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
('DN10', 'Mlem Mlem', '<p>nhạc Mlem do Min s&aacute;ng t&aacute;c</p>\r\n', 500000, '1641391489-Dia6.jpg', 'jp'),
('DN66', 'Magic Love', '<p>Nhạc của min gi&uacute;p cho mọi người thoải m&aacute;i hơn</p>\r\n', 12345, '1641086529-Dia12.jpg', 'tq'),
('DN76', 'Muộn rồi mà sao còn', '<p>Sơn t&ugrave;ng MTP</p>\r\n', 300000, '1641084559-Dia3.jpg', '2'),
('DN99', 'Arigatou sayonara', '<p>Sơn T&ugrave;ng -MTP (SKY)</p>\r\n', 12345, '1641060759-Dia10.jpg', 'jp');

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

--
-- Đang đổ dữ liệu cho bảng `hoadon`
--

INSERT INTO `hoadon` (`id_hd`, `email`, `ngaybd`, `tennguoinhan`, `diachi`, `ngaynhan`, `dienthoainguoinhan`, `tongtien`) VALUES
('hd151', 'trollwanwan@gmail.com', '2022-01-08 14:18:24', 'khoa', 'quận 12', '2022-01-08 14:18:24', '0938349588', 12345),
('hd195', 'trollwanwan@gmail.com', '2022-01-08 14:50:55', 'khoa', 'quận 12', '2022-01-08 14:50:55', '0938349588', 12345),
('hd262', 'trollwanwan@gmail.com', '2022-01-08 15:06:14', 'khoa', 'quận 12', '2022-01-08 15:06:14', '0938349588', 812345),
('hd359', 'trollwanwan@gmail.com', '2022-01-08 14:14:50', 'khoa', 'quận 12', '2022-01-08 14:14:50', '0938349588', 324690),
('hd386', 'trollwanwan@gmail.com', '2022-01-08 14:55:04', 'khoa', 'quận 12', '2022-01-08 14:55:04', '0938349588', 500000),
('hd438', 'trollwanwan@gmail.com', '2022-01-08 14:52:45', 'khoa', 'quận 12', '2022-01-08 14:52:45', '0938349588', 312345),
('hd45', 'trollwanwan@gmail.com', '2022-01-08 14:28:04', 'khoa', 'quận 12', '2022-01-08 14:28:04', '0938349588', 12345),
('hd46', 'trollwanwan@gmail.com', '2022-01-08 14:48:01', 'khoa', 'quận 12', '2022-01-08 14:48:01', '0938349588', 12345),
('hd477', 'trollwanwan@gmail.com', '2022-01-08 14:46:22', 'khoa', 'quận 12', '2022-01-08 14:46:22', '0938349588', 12345),
('hd495', 'trollwanwan@gmail.com', '2022-01-08 14:59:10', 'khoa', 'quận 12', '2022-01-08 14:59:10', '0938349588', 500000),
('hd565', 'trollwanwan@gmail.com', '2022-01-08 14:33:03', 'khoa', 'quận 12', '2022-01-08 14:33:03', '0938349588', 12345),
('hd605', 'trollwanwan@gmail.com', '2022-01-08 14:56:06', 'khoa', 'quận 12', '2022-01-08 14:56:06', '0938349588', 500000),
('hd767', 'trollwanwan@gmail.com', '2022-01-08 14:56:38', 'khoa', 'quận 12', '2022-01-08 14:56:38', '0938349588', 500000),
('hd801', 'dh51801934@student.stu.edu.vn', '2022-01-02 20:42:42', 'kim', 'quận 12', '2022-01-02 20:42:42', '0938349588', 624690),
('hd81', 'trollwanwan@gmail.com', '2022-01-08 14:59:42', 'khoa', 'quận 12', '2022-01-08 14:59:42', '0938349588', 0),
('hd848', 'trollwanwan@gmail.com', '2022-01-08 15:00:05', 'khoa', 'quận 12', '2022-01-08 15:00:05', '0938349588', 512345),
('hd942', 'trollwanwan@gmail.com', '2022-01-08 14:39:23', 'khoa', 'quận 12', '2022-01-08 14:39:23', '0938349588', 12345),
('hd977', 'trollwanwan@gmail.com', '2022-01-08 14:16:37', 'khoa', 'quận 12', '2022-01-08 14:16:37', '0938349588', 0);

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
('dh51801934@student.stu.edu.vn', 'kim', '25f9e794323b453885f5181f1b624d0b', '0938349588', 'quận 12'),
('nghiazero99@gmail.com', 'aa', '0cc175b9c0f1b6a831c399e269772661', '0358466737', 'aa'),
('trollwanwan@gmail.com', 'khoa', '25f9e794323b453885f5181f1b624d0b', '0938349588', 'quận 12');

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
('NH1', 'Nơi này có anh', '1640948274-Hard ship của mình -....mp4', 'MTP'),
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
