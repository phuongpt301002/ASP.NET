-- Tạo cơ sở dữ liệu
CREATE DATABASE QuanLyChiTieuTiemCaPhe;
GO

-- Sử dụng cơ sở dữ liệu QuanLyChiTieuTiemCaPhe
USE QuanLyChiTieuTiemCaPhe;
GO

-- Bảng Lý do thu
CREATE TABLE LyDoThu (
    MaLDT VARCHAR(10) PRIMARY KEY,
    TenLDT NVARCHAR(30)
);
GO

-- Bảng Lý do chi
CREATE TABLE LyDoChi (
    MaLDC VARCHAR(10) PRIMARY KEY,
    TenLDC NVARCHAR(30)
);
GO

-- Bảng Phiếu thu
CREATE TABLE PhieuThu (
    MaPhieuThu VARCHAR(10) PRIMARY KEY,
    SoTien INT,
	NgayLap DATE,
	MaLDT VARCHAR(10),
    DienGiai NVARCHAR(100),
    SoLuong INT,
    DonVi NVARCHAR(10),
);
GO

-- Bảng Chi tiết phiếu thu
CREATE TABLE CTPhieuThu (
    MaCTPhieuThu INT IDENTITY(1,1) PRIMARY KEY,
    MaPhieuThu VARCHAR(10),
    MaLDT VARCHAR(10),
    CONSTRAINT FK_CTPhieuThu_MaPhieuThu FOREIGN KEY (MaPhieuThu) REFERENCES PhieuThu (MaPhieuThu),
    CONSTRAINT FK_CTPhieuThu_MaLDThuChi FOREIGN KEY (MaLDT) REFERENCES LyDoThu (MaLDT)
);
GO

-- Bảng Phiếu chi
CREATE TABLE PhieuChi (
    MaPhieuChi VARCHAR(10) PRIMARY KEY,
	SoTien INT,
    NgayLap DATE,
	MaLDC VARCHAR(10),  
    DienGiai NVARCHAR(100),
    SoLuong INT,
    DonVi NVARCHAR(10),
);
GO

-- Bảng Chi tiết phiếu chi
CREATE TABLE CTPhieuChi (
    MaCTPhieuChi INT IDENTITY(1,1) PRIMARY KEY,
    MaPhieuChi VARCHAR(10),
	MaLDC VARCHAR(10), 
    CONSTRAINT FK_CTPhieuChi_MaPhieuChi FOREIGN KEY (MaPhieuChi) REFERENCES PhieuChi (MaPhieuChi),
    CONSTRAINT FK_CTPhieuChi_MaLDThuChi FOREIGN KEY (MaLDC) REFERENCES LyDoChi (MaLDC)
);
GO


-- Bảng Số dư
CREATE TABLE SoDu (
    MaSoDu VARCHAR(10) PRIMARY KEY,
    NgayLap DATE,
    TongThu INT,
    TongChi INT,
	SoTienDu INT
);
GO

-- Bảng Chi tiết số dư
CREATE TABLE CTSoDu (
    MaCTSoDu INT IDENTITY(1,1) PRIMARY KEY,
    MaSoDu VARCHAR(10),
    MaPhieuThu VARCHAR(10),
    MaPhieuChi VARCHAR(10),
    CONSTRAINT FK_CTSoDu_MaSoDu FOREIGN KEY (MaSoDu) REFERENCES SoDu (MaSoDu),
	CONSTRAINT FK_CTSoDu_MaPhieuThu FOREIGN KEY (MaPhieuThu) REFERENCES PhieuThu (MaPhieuThu),
	CONSTRAINT FK_CTSoDu_MaPhieuChi FOREIGN KEY (MaPhieuChi) REFERENCES PhieuChi (MaPhieuChi)
);
GO

-- Bảng Tham số
CREATE TABLE ThamSo (
    MaTS VARCHAR(10) PRIMARY KEY,
    TenTS NVARCHAR(30),
    DVT NVARCHAR(30),
    Giatri INT,
    Tinhtrang BIT
);
GO

