-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Máy chủ: 127.0.0.1
-- Thời gian đã tạo: Th12 11, 2023 lúc 08:01 PM
-- Phiên bản máy phục vụ: 10.4.28-MariaDB
-- Phiên bản PHP: 8.2.4

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Cơ sở dữ liệu: `duanmau_tktw_fpoly_2023`
--

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `bill`
--

CREATE TABLE `bill` (
  `id` int(10) NOT NULL,
  `iduser` int(10) DEFAULT 0,
  `bill_name` varchar(255) NOT NULL,
  `bill_address` varchar(255) NOT NULL,
  `bill_tel` varchar(50) NOT NULL,
  `bill_email` varchar(100) NOT NULL,
  `bill_pttt` tinyint(1) NOT NULL DEFAULT 1 COMMENT '1. Chuyển khoản trự tiếp\r\n2.Chuyển khoản\r\n3.Thanh toán online',
  `ngaydathang` varchar(50) NOT NULL,
  `total` int(10) NOT NULL DEFAULT 0,
  `bill_status` tinyint(1) DEFAULT 0 COMMENT '0.Đơn hàng mới\r\n1.Đang xử lý\r\n2.Đang giao hàng\r\n3.Đã giao hàng',
  `receive_name` varchar(255) DEFAULT NULL,
  `receive_address` varchar(255) DEFAULT NULL,
  `receive_tel` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_vietnamese_ci;

--
-- Đang đổ dữ liệu cho bảng `bill`
--

INSERT INTO `bill` (`id`, `iduser`, `bill_name`, `bill_address`, `bill_tel`, `bill_email`, `bill_pttt`, `ngaydathang`, `total`, `bill_status`, `receive_name`, `receive_address`, `receive_tel`) VALUES
(27, 1, 'Admin', 'Hà Nội', '0353712030', 'admin01@gmail.com', 0, '12:54:06pm 29/10/2023', 230, 0, NULL, NULL, NULL),
(28, 1, 'Admin', 'Hà Nội', '0353712030', 'admin01@gmail.com', 0, '11:00:33am 15/11/2023', 235, 0, NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `binhluan`
--

CREATE TABLE `binhluan` (
  `id` int(10) NOT NULL,
  `noidung` varchar(255) NOT NULL,
  `iduser` int(10) NOT NULL,
  `idpro` int(10) NOT NULL,
  `ngaybinhluan` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_vietnamese_ci;

--
-- Đang đổ dữ liệu cho bảng `binhluan`
--

INSERT INTO `binhluan` (`id`, `noidung`, `iduser`, `idpro`, `ngaybinhluan`) VALUES
(15, 'Good!', 1, 60, '07:40:38pm 06/11/2023'),
(16, 'Máy Xịn!', 1, 50, '08:06:21pm 06/11/2023');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `cart`
--

CREATE TABLE `cart` (
  `id` int(10) NOT NULL,
  `iduser` int(10) NOT NULL,
  `idpro` int(10) NOT NULL,
  `img` varchar(255) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `price` int(10) NOT NULL DEFAULT 0,
  `soluong` int(3) NOT NULL,
  `thanhtien` int(10) NOT NULL,
  `idbill` int(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_vietnamese_ci;

--
-- Đang đổ dữ liệu cho bảng `cart`
--

INSERT INTO `cart` (`id`, `iduser`, `idpro`, `img`, `name`, `price`, `soluong`, `thanhtien`, `idbill`) VALUES
(60, 1, 53, 'vn-11134207-7qukw-lgne1rftms4z57.jpg', 'Xiaomi POCO M5 ', 230, 1, 230, 27),
(61, 1, 60, 'vn-11134207-7r98o-lm8lbobi3cv37b.jpg', 'Xiaomi Smart Band 8', 235, 1, 235, 28);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `danhmuc`
--

CREATE TABLE `danhmuc` (
  `id` int(10) NOT NULL,
  `name` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_vietnamese_ci;

--
-- Đang đổ dữ liệu cho bảng `danhmuc`
--

INSERT INTO `danhmuc` (`id`, `name`) VALUES
(27, 'Điện Thoại'),
(30, 'Phụ Kiện'),
(31, 'Thiết Bị Điện Tử');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `sanpham`
--

CREATE TABLE `sanpham` (
  `id` int(10) NOT NULL,
  `name` varchar(255) NOT NULL,
  `price` double NOT NULL DEFAULT 10.2,
  `img` varchar(255) DEFAULT NULL,
  `mota` text DEFAULT NULL,
  `luotxem` int(11) NOT NULL DEFAULT 0,
  `iddm` int(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_vietnamese_ci;

--
-- Đang đổ dữ liệu cho bảng `sanpham`
--

INSERT INTO `sanpham` (`id`, `name`, `price`, `img`, `mota`, `luotxem`, `iddm`) VALUES
(49, 'Xiaomi Redmi Note 12', 254, 'vn-11134207-7qukw-lfbz92kaq0s5b8.jpg', 'Redmi Note 12 (4GB/128GB) được hoàn thiện từ chất liệu cao cấp với thiết kế đơn giản, hướng đến sự thanh lịch trong suốt quá trình sử dụng. Đồng thời, thiết kế khung phẳng thời trang đến từ chiếc smartphone này cũng sẽ đảm bảo sự thoải mái nhất khi cầm nắm lâu dài. Thêm nữa, Redmi Note 12 có sẵn 3 màu sắc đặc trưng là Xanh bạc hà, Xanh băng tuyết, và Xám thạch anh để bạn thoải mái lựa chọn phong cách phù hợp với bản thân.\r\n\r\nBộ xử lý hoàn toàn mới cho hiệu năng vượt trội\r\n\r\nTiếp nối sự thành công của Redmi Note 11, Redmi Note 12 (4GB/128GB) hứa hẹn sẽ mang đến ấn tượng mạnh mẽ hơn cho mọi đối tượng người dùng. Nổi bật chính là cấu hình vượt trội, khi nó sở hữu con chip mới, Snapdragon 685. Đây được cho là phiên bản nâng cấp của Snapdragon 680 với hiệu năng nổi bật hơn rất nhiều so với thế hệ tiền nhiệm.\r\n\r\nĐược sản xuất trên tiến trình 6nm, bộ xử lý Snapdragon 685 giúp tăng hiệu suất năng lượng CPU lên tới 2.8 GHz. Từ đó mang đến trải nghiệm đa nhiệm mượt mà và khả năng xử lý đồ họa ấn tượng. Mặc dù Redmi Note 12 có thể chưa hỗ trợ kết nối 5G, nhưng với RAM 4GB và bộ nhớ trong 128GB, người dùng sẽ dễ dàng chuyển đổi giữa các ứng dụng và thực hiện nhiều tác vụ đồng thời mà không lo giật lag.\r\n\r\nKhả năng lưu trữ đáng nể\r\n\r\nBên cạnh hiệu năng vượt trội so với các thiết bị cùng phân khúc, Redmi Note 12 (4GB/128GB) còn trang bị khả năng lưu trữ nhanh chóng và tiết kiệm. Với việc được tích hợp 128GB bộ nhớ trong cho phép người dùng cài đặt nhiều ứng dụng yêu thích, lưu trữ hàng ngàn bức ảnh và video mà không lo bị hết dung lượng.\r\n\r\nDung lượng pin lớn kết hợp với tính năng sạc nhanh 33W\r\n\r\n\r\n\r\nDung lượng pin lớn cũng là ưu điểm tuyệt vời giúp cho Redmi Note 12 (4GB/128GB) được rất nhiều người dùng yêu thích. Chiếc smartphone này sở hữu viên pin có dung lượng lên đến 5.000mAh mang đến thời lượng sử dụng lâu dài với nhiều tác vụ khác nhau. Tốc độ sạc pin của thiết bị này cũng khá ấn tượng khi được trang bị tính năng sạc nhanh 33W với công nghệ MMT. Điều này sẽ giúp đảm bảo hiệu suất sử dụng dài lâu nhưng vẫn tối đa hóa thời gian sạc pin.\r\n\r\nBộ ba camera 50MP chất lượng cao', 1, 27),
(50, 'Xiaomi Redmi 10 5G', 245, 'vn-11134207-7r98o-llymyy3dzilb47.jpg', 'Với màn hình IPS LCD kích thước 6.58 inch, Redmi 10 5G mang đến cho bạn không gian giải trí sống động, rộng lớn ngay trên chiếc smartphone của mình. Độ phân giải Full HD+ đảm bảo hình ảnh hiển thị rõ nét, sắc nét, đầy đủ màu sắc.\r\n\r\n\r\n\r\n\r\n\r\n\r\nĐặc biệt, Redmi 10 5G nâng tầm trải nghiệm màn hình với tần số quét 90Hz. Tốc độ làm mới khung hình cao giúp nội dung di chuyển mượt mà, tự nhiên, giảm thiểu hiện tượng giật lag trong quá trình xem video hay chơi game. Không chỉ thế, màn hình của Redmi 10 5G còn tích hợp notch hình giọt nước tinh tế, chứa camera selfie, cùng khả năng hiển thị rõ nét dưới ánh sáng mặt trời.\r\n\r\n\r\n\r\n\r\n\r\nCamera chính có độ phân giải ấn tượng trong tầm giá\r\n\r\n\r\n\r\nRedmi 10 5G không chỉ sở hữu thiết kế hiện đại mà còn \"chất chơi\" với hệ thống camera ấn tượng. Với cảm biến chính 50MP, Redmi 10 5G hứa hẹn mang đến cho bạn những bức ảnh sắc nét, chi tiết. Dù là chụp cảnh quan, chân dung hay cảnh vật gần, bạn đều có thể thu lại hình ảnh một cách chân thực nhất.\r\n\r\n\r\n\r\nNgoài ra, với cảm biến chiều sâu 2MP, bạn cũng có thể tạo hiệu ứng xóa phông, qua đó làm nổi bật đối tượng trong ', 3, 27),
(51, 'Xiaomi Redmi 12C', 267, 'vn-11134207-7qukw-ljp3mowtk1pwb7.jpg', 'Thỏa sức giải trí trên màn hình lớn 6.67 inch full HD+ AMOLED của Redmi Note 12. Độ phân giải cao, chuẩn màu DCI-P3 và đặc biệt là tốc độ làm mới 120Hz mang đến trải nghiệm hình ảnh chưa từng thấy trong phân khúc. Mang trên mình bộ vi xử lý Snapdragon 685, Redmi Note 12 có tốc độ xử lý cực nhanh và khả năng đa nhiệm tuyệt vời. Đây là con chip sản xuất trên tiến trình 6nm hiện đại, tốc độ CPU lên tới 2.8Hz, giúp bạn chụp ảnh, chơi game, livestream siêu mượt. Với bộ ba camera độ phân giải cao 50MP, Redmi Note 12 mang đến những bức ảnh tuyệt đẹp trong mọi hoàn cảnh, mọi điều kiện ánh sáng. Bên cạnh camera chính sắc nét, điện thoại còn có camera góc siêu rộng và camera chụp cận cảnh. Chế độ chụp đêm sẽ giúp bạn chụp ảnh, quay video đẹp lung linh cả trong đêm tối. Để bắt kịp cuộc sống năng động, Redmi Note 12 trang bị viên pin dung lượng 5.000mah, thoải mái để giải trí cả ngày. Bên cạnh thời lượng pin dài, bạn cũng không cần thiết phải mất thời gian chờ đợi khi với công nghệ sạc nhanh 33W, nguồn năng lượng sẽ được tái tạo nhanh chóng. ', 0, 27),
(52, 'Xiaomi Mi Smart Air Purifier', 390, 'vn-11134207-7r98o-llfoshqfjgso70.jpg', 'Cảm biến: PM 2.5, nhiệt độ và độ ẩm\r\n\r\nĐộ ồn: 33,4dB - 64dB (A)\r\n\r\nCông suất tiêu thụ: 33W (tối thiểu)\r\n\r\nDiện tích sử dụng: 35-60m²\r\n\r\nHiệu quả lọc bụi: 99.97 %, cung cấp 6000L/phút\r\n\r\nBộ lọc: Màng lọc HEPA, Màng lọc than hoạt tính, Màng lọc thô\r\n\r\nTốc độ phân phối không khí sạch: (CADR) 500m³/h\r\n\r\nTính năng: khác Lọc bụi và phấn hoa, Khử mùi hôi\r\n\r\nHỗ trợ: điều khiển bằng giọng nói qua Google Assistant và Alexa\r\n\r\nMàn hình: Led hiển thị ( Nhiệt độ, độ ẩm, chỉ số bụi, Wifi, Chế độ lọc, màu sắc chất lượng không khí)\r\n\r\nBộ sản phẩm gồm:Xiaomi Smart Air Purifier, Bộ lọc trong máy, Nguồn, Sách hướng dẫn sử dụng\r\n\r\nKích thước: 275 x 275 x 680mm\r\n\r\nTrọng lượng: Khoảng 6,8kg', 2, 31),
(53, 'Xiaomi POCO M5 ', 230, 'vn-11134207-7qukw-lgne1rftms4z57.jpg', 'Chiếc smartphone gây ấn tượng đầu tiên với khách hàng nhờ vào màn hình có kích thước lớn đến 6.58 inch. Ưu điểm ấn tượng của POCO M5 nằm ở độ phân giải màn hình Full HD+, cùng tần số quét lên đến 90 Hz. Chỉ số tần số quét ấn tượng giúp cho mọi thao tác chạm vuốt trên điện thoại trở nên mượt mà hơn và giúp chiếc smartphone nổi bật hơn hẳn so với những thiết bị cùng phân khúc khác.\r\n\r\nBên cạnh đó, POCO M5 còn sở hữu camera sau 50 MP và dung lượng pin 5000mAh cùng chế độ hỗ trợ sạc nhanh 18W.\r\n\r\nBộ phụ kiện hộp gồm: Sạc, cáp, ốp dẻo, miếng dán màn hình và máy.', 1, 27),
(54, 'Xiaomi POCO F3 ', 345, 'vn-11134207-7r98o-llczusi0jzk8d8.jpg', 'Sở hữu sức mạnh “vô đối” với chip Qualcomm Snapdragon 870, Xiaomi POCO F3 mang đến người dùng cơ hội trải nghiệm hiệu năng của flagship hàng đầu trong mức giá tầm trung, một “món hời” mà các tín đồ “hệ gaming” không thể nào bỏ qua.\r\n\r\n Màn hình AMOLED E4\r\n\r\nPOCO F3 hiển thị mọi thứ sống động rực rỡ với màn hình AMOLED, vật liệu E4 cao cấp mang đến màu sắc chính xác tuyệt vời, hỗ trợ HDR 10+ giúp tăng chất lượng hiển thị lên cao nhất, cho phép cường độ sáng được đẩy lên tối đa nhưng lại tiết kiệm đến 15% dung lượng pin.\r\n\r\n Kết hợp với GPU Adreno 650 tạo nên trải nghiệm đồ họa đỉnh cao, mượt mà khi chơi game, RAM 8GB chuẩn LPDDR5 cho tốc độ mở và truy xuất dữ liệu gần như lập tức, kể cả khi bạn đã mở nhiều ứng dụng trước đó.\r\n\r\n POCO F3 trang bị kết nối mạng không dây nhanh nhất hiện nay là 5G và WiFi 6, giúp tải dữ hiệu hay một trang web có nhiều hình ảnh chỉ trong tích tắc, xem phim với chất lượng cao trơn tru mượt mà, không lo gián đoạn do tốc độ chậm.\r\n\r\n Trang bị cụm camera sau với kiểu sắp xếp khá độc đáo, POCO F3 sẽ trở nên mới lạ và khác biệt so với những mẫu smartphone khác trên thị trường.\r\n\r\n Camera chính 48 MP đảm bảo mọi chi tiết được lưu lại với chất lượng cao nhất, thể hiện cuộc sống chân thật và sống động như những gì bạn thấy. Được xử lý bới thuật toán AI và chế độ ban đêm 2.0 ấn tượng, POCO F3 hứa hẹn sẽ tạo nên những tấm hình chụp đêm rực rỡ với độ sáng vượt trội, các chi tiết tái tạo chính xác đến không ngờ.\r\n\r\n Camera telemacro 5 MP với khoảng cách lấy nét siêu cận đến 3cm, lấy nét vào những chi tiết siêu nhỏ, tạo nên khung hình macro tuyệt đẹp.', 0, 27),
(55, 'WIFI 6 MESH XIAOMI ', 157, '74565ae215db2b194ee26ea7d6b0fee5.jpg', 'Router Wifi 6 Xiaomi AX6000 là một trong những router đầu tiên hỗ trợ công nghệ Wifi 6 Enhanced hiện đại, đến từ thương hiệu Xiaomi nổi tiếng. Bên cạnh đó là những cải tiến mạnh mẽ về hiệu năng, giúp tăng tốc độ internet cho người dùng một cách nhanh chóng. Sản phẩm sẽ sự lựa chọn tốt nhất dành cho bạn nếu bạn đang muốn nâng cấp Router cho gia đình mình.\r\n\r\nƯu điểm của Router Wifi 6 Xiaomi AX6000\r\nRouter Wifi 6 Xiaomi AX6000 được trang bị bộ xử lý Qualcomm IPQ5018 tiên tiến, đi kèm RAM 512G, hỗ trợ băng tần kép 2.4GHz à 5GHz cùng công nghệ WiFi 6 hiện đại, cho tốc độ truyền dữ liệu lên tới 6000MB, sẽ là một trang bị không thể thiếu dành cho bạn.\r\n\r\nCông nghệ wifi 6, đường truyền mượt mà\r\nRouter Wifi 6 Xiaomi AX6000 hỗ trợ băng tần 2.4GHz với tốc độ 574Mbps và băng tần 5GHz với tốc độ truyền tải lên tới 4804Mbps, đáp ứng nhu cầu sử dụng internet cho doanh nghiệp lớn.\r\n\r\nĐồng thời Router AX6000 hỗ trợ băng tần 4×4 160MHz, nhanh gấp đôi so với băng tần Wi-Fi 6 4×4 80MHz hiện có, đồng thời cũng hỗ trợ kết nối cùng lúc nhiều thiết bị hơn. Không những vậy, đây còn là mẫu router đầu tiên trên thế giới hỗ trợ công nghệ truyền dẫn tốc độ cao 4K QAM mới nhất hiện nay, giúp tăng 20% tốc độ truyền tải so với thế hệ trước – 1024 QAM.\r\n\r\nChip xử lý chuyên dụng, khả năng phủ sóng rộng\r\nRouter Xiaomi AX6000 được trang bị chip Qualcomm IPQ5018 cho khả năng xử lý dữ liệu mạnh mẽ, khả năng làm việc ổn định ở tốc độ cao. Ngoài ra, 6 bộ khuếch đại tín hiệu độc lập được tích hợp bên trong router cũng mang đến vùng phủ sóng rộng hơn, khả năng xuyên tường tốt hơn và cho tốc độ kết nối nhanh hơn. Router có thể dễ dàng phủ sóng một căn hộ với ba phòng ngủ lớn.\r\n\r\nTương tự các router khác của Xiaomi, Mi Router AX6000 cũng hỗ trợ kết nối mạng lưới Mesh Networking, tự động roaming sóng Wi-Fi giữa các router trong ngôi nhà của bạn. Bên cạnh đó, nó còn mang đến các tiện ích đối với hệ sinh thái Xiaomi AIoT, đi kèm 512MB RAM và hỗ trợ kết nối đồng thời 248 thiết bị cùng một lúc.\r\n\r\nHỗ trợ chuyển mạng WAN LAN ổn định\r\nRouter WiFi 6 AX600 được trang bị cổng mạng tốc độ cao 2500M. So với cổng Gigabit Ethernet hiện có trên các mẫu router truyền thống, cổng mạng 2500M hoàn toàn có thể đáp ứng nhu cầu nâng cấp băng thông rộng.\r\n\r\nNgoài ra, cổng mạng cũng hỗ trợ chuyển mạng WAN/ LAN.', 1, 31),
(56, 'Xiaomi Power Strip 3 USB ', 250, 'f14d3fa4444ef4a9febfbd2f8868bca9.jpg', 'Ổ Cắm Điện Xiaomi Power Strip 3 USB 3 Outlet - Hàng Chính Hãng\r\n\r\n\r\n\r\nMi power strip được thiết kế với 3 jack cắm điện, cắm được các phích cắm từ 2 chấu đến 3 chấu, tròn hay dẹp đều có thể cắm được. Ngoài ra còn được tích hợp 3 khe cắm USB.\r\n\r\n \r\n\r\nCông suất cho mỗi  USB là 5V-2.1A, Mi Power strip có tích hợp chip tự điều áp cho từng cổng USB, giúp thiết bị được sạc an toàn nhất với thời gian sạc nhanh nhất.\r\n\r\n\r\n\r\nKhả năng chịu nhiệt đến 750 độ C, giúp thiết bị an toàn hơn nhất là với trẻ em. Mỗi khe cắm đều có 1 lớp nhựa an toàn khi bạn rút phích cắm ra sẽ đậy mạch điện lại, rất an toàn.', 0, 30),
(57, ' Xiaomi Mijia T100 (pin sạc)', 300, '45929deb17d2d535484beb04eea885bf.jpg', 'Bàn chải điện Mijia Sonic T100 đặc biệt được Xiaomi trang bị động cơ rung với tần số cao 16500 vòng/phút cho khả năng hoạt động hiệu quả và làm sạch 360 độ cho các bộ phận trong khoang miệng. Mặc dù sử dụng động cơ mạnh mẽ, tuy nhiên T100 vẫn duy trì mức âm thanh 60dB khá êm ái, giảm độ giật nên sẽ không gây nhiều tiếng ồn ảnh hưởng đến thao tác sử dụng. 2 chế độ chải là mạnh mẽ và chế độ tiêu chuẩn sẽ đáp ứng đầy đủ nhu cầu cho mỗi người dùng.\r\n\r\n\r\n\r\nTrang bị lông bàn chải mềm mại, an toàn\r\n\r\nNgoài ra, Mijia T100 còn được thiết kế đầu bàn chải nhỏ gọn với cấu trúc lông mềm mại. Từ đó sẽ giúp bàn chải có khả năng xuyên dễ dàng hơn qua các khe hở của nướu và loại sạch các mảng bám thức ăn ở các khu vực khó tiếp cận trong khoang miệng. Đặc biệt, nhà sản xuất còn cải tiến tăng mật độ lông bàn chải và tối ưu hóa cấu trúc phù hợp với đường cong khoang miệng không chỉ tăng hiệu quả làm sạch mà còn cho cảm giác mềm mại hơn với nướu, bảo vệ sức khỏe răng miệng tốt hơn.\r\n\r\n\r\n\r\n-Cơ chế thiết lập thời gian chải thông minh\r\n\r\nĐiểm khác biệt cơ bản của Bàn chải điện Mijia Sonic T100 so với các loại bàn chải thông thường chính là cơ chế thiết lập thời gian đánh răng cực thông minh. Cụ thể, sau 30 giây bàn chải sẽ tự động dừng ngắn nhằm nhắc nhở người dùng chuyển đổi vùng chải và sẽ tự động dừng sau 2 phút để kết thúc quá trình chải răng.\r\n\r\nThiết kế nhỏ gọn, cao cấp\r\n\r\n\r\n\r\nVới thiết kế được đánh giá là khá nhỏ gọn so với các loại bàn chải điện cùng loại khác, Mijia T100 mang đến một vẻ ngoài cao cấp, nhỏ gọn và vô cùng đẹp mắt. Tay cầm đường kính 19mm, khối lượng 46g không chỉ giúp vừa vặn trong lòng bàn tay người dùng, linh hoạt hơn trong thao tác sử dụng mà còn dễ lưu trữ hơn khi mang theo bên cạnh.\r\n\r\nPin dung lượng cao cũng đáp ứng đầy đủ nhu cầu sử dụng trong 30 ngày liên tục trong khi chỉ mất 4 giờ sạc đầy, rất linh hoạt trong những chuyến công tác, du lịch,...', 0, 31),
(58, ' XIAOMI POCO X5 Pro 5G', 400, 'sg-11134201-23020-ujwiue3yhhnv4e.jpg', 'Đúng như đã hẹn từ trước, POCO – thương hiệu con của nhà Xiaomi đã cho ra mắt POCO X5 series mới. Trong đó, POCO X5 Pro 5G chính là phiên bản cao cấp nhất với việc được trang bị chip Rồng, camera 108 MP cùng nhiều thông số ấn tượng khác. Đúng như đã hẹn từ trước, POCO – thương hiệu con của nhà Xiaomi đã cho ra mắt POCO X5 series mới. Trong đó, POCO X5 Pro 5G chính là phiên bản cao cấp nhất với việc được trang bị chip Rồng, camera 108 MP cùng nhiều thông số ấn tượng khác. Làm nổi bật lên khỏi mặt lưng chính là cụm camera mắt mèo khá quen thuộc gần đây nằm ở góc bên trái của POCO X5 Pro 5G. Còn ở góc phải là dòng chữ POCO đặc trưng trên toàn bộ sản phẩm ở vài năm gần đây. Nhìn chung, ở góc trên cùng mặt lưng vẫn là dải đen chạy ngang nên tạo ra được một nét đặc trưng riêng của dòng sản phẩm này.', 1, 27),
(59, 'Xiaomi Redmi Buds 4 Lite', 300, 'vn-11134207-7r98o-lmmq2p21cp2707.jpg', 'Tai nghe không dây Xiaomi Redmi Buds 4 Lite thiết kế thanh lịch với thời lượng pin lên đến 20 giờ liên tục, tai nghe còn được trang bị những tính năng mới được nâng cấp như khả năng ghép nối tốt hứa hẹn đây sẽ là sự lựa chọn hoàn hảo dành cho các tín đồ True Wireless. Là sản phẩm kế thừa từ Redmi Buds 3, Buds 3 Lite có thiết kế nhỏ gọn giúp bạn dễ dàng mang theo và sử dụng Thiết kế nhỏ gọn, thời trang, linh hoạt cho trải nghiệm đeo tuyệt vời\r\n\r\nCũng như những chiếc tai nghe bluetooth True Wireless khác thì Redmi Buds 4 Lite cũng được trang bị thiết kế khá nhỏ nhắn, đơn giản hóa các chi tiết với đường cong mềm mại, vật liệu nhựa cao cấp cùng công nghệ xử lý bề mặt hiện đại tạo nên một tổng thể hoàn hảo và cao cấp cho bộ 2 tai nghe. Hơn thế nữa, Redmi Buds 4 Lite có các tính năng cực tiện lợi như Driver động 12mm, Hỗ trợ Google Fast Pair, Bluetooth 5.3, Up to 20 hours, IP54 chống nước cực tốt, Tai nghe siêu nhẹ 3,92g', 0, 30),
(60, 'Xiaomi Smart Band 8', 235, 'vn-11134207-7r98o-lm8lbobi3cv37b.jpg', 'Xiaomi Smart Band 8 được trang bị màn hình AMOLED 1.62 inch cùng tần số quét 60Hz, màn hình Always On Display cùng khả năng điều chỉnh độ sáng tự động. Đồng hồ được trang bị khả năng kháng nước 5ATM cùng viên pin cho thời gian sử dụng tới 16 ngày. Mi Band 8 sở hữu khả năng theo dõi nhiều chỉ số sức khỏe như đo nhịp tim, chỉ số giấc ngủ và hỗ trợ tập luyện tới 150 môn thể thao.\r\n\r\n\r\n\r\nKiểu dáng thời trang cao cấp\r\n\r\nVòng tay thông minh Xiaomi Smart Band 8 nổi bật với thiết kế năng động hợp thời trang với nhiều mẫu mã khác nhau, được nâng cấp với cấu trúc tháo nhanh phần dây đeo. Thiết kế này mang tới trải nghiệm độc đáo, mới lạ cho người dùng khi có thể dễ dàng thoát khỏi và thay thế phần dây đeo hoàn toàn mới. Bên cạnh đó, Xiaomi Band thế hệ thứ 8 còn khá thu hút khi được hoàn thiện từ chất liệu kim loại sành điệu cùng 2 phiên bản khung viền màu Vàng nhạt và Đen sáng. Với ưu điểm này, Xiaomi Band 8 không chỉ thể hiện sự trẻ trung mà còn truyền cảm hứng cho phong cách thời trang hiện đại.\r\n\r\n\r\n\r\nĐa dạng loại vòng tay độc đáo khác nhau thoả sức cho người dùng lựa chọn\r\n\r\nBộ sưu tập dây đeo thời trang đa dạng là điểm cộng lớn của Xiaomi Smart Band 8 trong lần ra mắt lần này. Vòng đeo tay thông minh Xiaomi Smart Band 8 sở hữu nhiều phiên bản dây đeo diện mạo mới, tôn vinh sự tự do thời trang của người dùng. Hiển thị mượt mà hơn với giao diện màn hình sắc nét\r\n\r\nMàn hình hiển thị của đồng hồ Xiaomi Smart Band 8 nhỏ gọn nhưng sắc nét và đầy đủ chức năng. Với độ phân giải cao cùng kích thước màn hình 1.62 inch, mọi trải nghiệm hiển thị trên Xiaomi Smart Band 8 đều cực kỳ rõ nét, màu sắc nhẹ nhàng. \r\nVòng tay sở hữu tốc độ làm mới lên tới 60Hz mang tới trải nghiệm hình ảnh cực kỳ mượt mà, cảm giác vận hành trơn tru. Bên cạnh đó, Xiaomi Band thế hệ thứ 8 còn có sở hữu độ sáng màn hình 326ppi, giúp điều chỉnh độ sáng tự động. Nó thích ứng chính xác với độ sáng của môi trường xung quanh, nâng cao trải nghiệm hiển thị cho người dùng.\r\n\r\nChưa hết, Xiaomi Smart Band 8 còn cực kỳ đa dạng về chủ đề hiển thị trên màn hình. Với hơn 200 mặt đồng hồ số thời trang, vòng tay công nghệ Xiaomi mới này sẽ mang tới cho bạn nguồn cảm hứng ăn mặc ổn định. \r\n\r\n\r\n\r\nChế độ giải trí mới mẻ, vui nhộn\r\n\r\nMột điểm nâng cấp mới toanh khác của vòng đeo tay thông minh Xiaomi Smart Band 8 là chế độ giải trí thú vị cho người dùng. Vòng tay thông minh này được trang bị nhiều tựa game hấp dẫn, giúp người dùng giải trí trong những lúc rảnh rỗi. Một vài game thú vị trên Xiaomi Smart Band 8 như: Bắn súng, Sudoku, Giải đố vui nhộn, Anh hùng qua cầu. Người sử dụng có thể trải nghiệm những tựa game này trực tiếp trên màn hình của Xiaomi Smart Band 8. Qua hệ thống cảm biến của vòng tay Xiaomi Smart Band 8, người dùng có thể dễ dàng điều khiển game chỉ với một vài thao tác đơn giản.\r\n\r\n\r\n\r\nĐa dạng các chế độ luyện tập với 150 môn thể thao\r\n\r\nTrong việc luyện tập, Xiaomi Smart Band 8 là một thiết bị vô cùng hữu ích. Với hơn 150 chế độ luyện tập mang tới phương pháp thể lực phù hợp nhất cho người sử dụng.', 2, 30),
(61, 'Xiaomi Redmi 10000mAh', 200, 'sg-11134201-22100-ar9oetxbijiv24.jpg', 'Kích thước: 147×71.2×14.2mm.\r\n\r\nChất liệu: hợp kim nhôm.\r\n\r\nLõi pin: lithium Polymer 10000mAh.\r\n\r\nDung lượng thật: 5500mAh.\r\n\r\nĐầu ra: 2 USB.\r\n\r\nĐiện áp vào: 5.0V-2.0A / 9V-2.0A / 12V-1.5A - 18W.\r\n\r\nĐiện áp ra: 5.1V-2.4A / 9V-1.6A (MAX) và 12V-1.2A (MAX) - 15W.\r\n\r\nĐiện áp khi sạc 2 cổng: 5.1V - 2.4A.', 0, 30);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `taikhoan`
--

CREATE TABLE `taikhoan` (
  `id` int(10) NOT NULL,
  `user` varchar(255) NOT NULL,
  `pass` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `address` varchar(255) DEFAULT NULL,
  `tel` varchar(50) DEFAULT NULL,
  `role` tinyint(4) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_vietnamese_ci;

--
-- Đang đổ dữ liệu cho bảng `taikhoan`
--

INSERT INTO `taikhoan` (`id`, `user`, `pass`, `email`, `address`, `tel`, `role`) VALUES
(1, 'Admin', '123', 'admin01@gmail.com', 'Hà Nội', '0353712030', 1),
(2, 'User', '123', 'user01@gmail.com', 'Hà Nội', '0353712030', 0);

--
-- Chỉ mục cho các bảng đã đổ
--

--
-- Chỉ mục cho bảng `bill`
--
ALTER TABLE `bill`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `binhluan`
--
ALTER TABLE `binhluan`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_sp_bl` (`idpro`),
  ADD KEY `id_user_bl` (`iduser`);

--
-- Chỉ mục cho bảng `cart`
--
ALTER TABLE `cart`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_bill` (`idbill`),
  ADD KEY `id_sanpham` (`idpro`),
  ADD KEY `id_user` (`iduser`);

--
-- Chỉ mục cho bảng `danhmuc`
--
ALTER TABLE `danhmuc`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `sanpham`
--
ALTER TABLE `sanpham`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_dm_sp` (`iddm`);

--
-- Chỉ mục cho bảng `taikhoan`
--
ALTER TABLE `taikhoan`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT cho các bảng đã đổ
--

--
-- AUTO_INCREMENT cho bảng `bill`
--
ALTER TABLE `bill`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=29;

--
-- AUTO_INCREMENT cho bảng `binhluan`
--
ALTER TABLE `binhluan`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT cho bảng `cart`
--
ALTER TABLE `cart`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=62;

--
-- AUTO_INCREMENT cho bảng `danhmuc`
--
ALTER TABLE `danhmuc`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=32;

--
-- AUTO_INCREMENT cho bảng `sanpham`
--
ALTER TABLE `sanpham`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=62;

--
-- AUTO_INCREMENT cho bảng `taikhoan`
--
ALTER TABLE `taikhoan`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=23;

--
-- Các ràng buộc cho các bảng đã đổ
--

--
-- Các ràng buộc cho bảng `binhluan`
--
ALTER TABLE `binhluan`
  ADD CONSTRAINT `id_sp_bl` FOREIGN KEY (`idpro`) REFERENCES `sanpham` (`id`),
  ADD CONSTRAINT `id_user_bl` FOREIGN KEY (`iduser`) REFERENCES `taikhoan` (`id`);

--
-- Các ràng buộc cho bảng `cart`
--
ALTER TABLE `cart`
  ADD CONSTRAINT `id_bill` FOREIGN KEY (`idbill`) REFERENCES `bill` (`id`),
  ADD CONSTRAINT `id_sanpham` FOREIGN KEY (`idpro`) REFERENCES `sanpham` (`id`),
  ADD CONSTRAINT `id_user` FOREIGN KEY (`iduser`) REFERENCES `taikhoan` (`id`);

--
-- Các ràng buộc cho bảng `sanpham`
--
ALTER TABLE `sanpham`
  ADD CONSTRAINT `id_dm_sp` FOREIGN KEY (`iddm`) REFERENCES `danhmuc` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
