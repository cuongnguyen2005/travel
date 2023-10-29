// ignore_for_file: public_member_api_docs, sort_constructors_first

class Places {
  int id;
  String nameAirport;
  String nameHotel;
  String namePlace;
  String rating;
  String image;
  String location;
  int price;
  String info;
  String cateName;

  Places({
    required this.id,
    required this.nameAirport,
    required this.nameHotel,
    required this.namePlace,
    required this.rating,
    required this.image,
    required this.location,
    required this.price,
    required this.info,
    required this.cateName,
  });
}

List<Places> places = [
  Places(
    id: 1,
    namePlace: 'Sun World Fansipan Legend',
    nameAirport: 'Hà Nội',
    nameHotel: 'Khách sạn Sun Legen',
    rating: '4.5',
    // image: [
    //   'assets/images/fansipan1.jpg',
    //   'assets/images/fansipan2.jpg',
    //   'assets/images/fansipan3.jpg',
    //   'assets/images/fansipan4.jpeg'
    // ],
    image: 'assets/images/fansipan1.jpg',
    location: 'Đường Nguyễn Chí Thanh, Sa Pa, Lào Cai',
    price: 245,
    info:
        'Việc khám phá nóc nhà của Đông Dương giờ đây đã trở nên dễ dàng và bớt thử thách đi rất nhiều nhờ có  - tuyến cáp treo dài nhất và hiện đại bậc nhất châu Á. Qua một chặng cáp treo, bạn sẽ đến với đỉnh Fansipan - ngọn núi cao 3143m so với mặt nước biển cùng với quần thể kiến trúc tâm linh ẩn mình trong mây mù Tây Bắc. Những ngôi chùa nằm cheo leo giữa núi rừng đại ngàn và pho tượng Phật khổng lồ luôn mang lại cảm giác an yên cho mọi du khách tìm về nơi đây.',
    cateName: 'Domestic',
  ),
  Places(
    id: 2,
    namePlace: 'Budapest',
    nameAirport: 'Hungary',
    nameHotel: 'Khách sạn Budapest',
    rating: '4.5',
    // image: [
    //   'assets/images/Budapest1.jpg',
    //   'assets/images/Budapest2.jpg',
    //   'assets/images/Budapest3.jpg',
    // ],
    image: 'assets/images/Budapest1.jpg',
    location: 'Budapest, Hungary',
    price: 245,
    info:
        'Nhà văn Ba Lan từng đoạt giải Prince of Asturias, Claudio Magris mô tả Budapest là Hòn ngọc của sông Danube sau khi du lịch qua châu Âu.',
    cateName: 'Aboard',
  ),
  Places(
    id: 3,
    namePlace: 'Vancouver',
    nameAirport: 'Canada',
    nameHotel: 'Khách sạn Vancouver',
    rating: '4.5',
    // image: [
    //   'assets/images/vancouver1.jpg',
    //   'assets/images/vancouver2.jpg',
    //   'assets/images/vancouver3.jpg',
    //   'assets/images/vancouver4.jpg',
    // ],
    image: 'assets/images/vancouver1.jpg',
    location: 'Vancouver, Canada',
    price: 245,
    info:
        'Canada là một đất nước rộng lớn với rất nhiều điều để khám phá từ đông sang tây. Vancouver, British Columbia, một trong những thành phố đẹp nhất trên thế giới, ngập tràn rừng cây, công viên xinh đẹp, quán rượu sôi động, nhà hàng đẳng cấp thế giới, bảo tàng và tất cả các loại cơ hội mua sắm, với vô số cơ hội giải trí ngoài trời chỉ cách đó vài phút.',
    cateName: 'Aboard',
  ),
  Places(
    id: 4,
    namePlace: 'Vịnh Hạ Long',
    nameAirport: 'Cát Bi',
    nameHotel: 'Khách sạn Hạ Long',
    rating: '4.7',
    // image: [
    //   'assets/images/halong1.jpg',
    //   'assets/images/halong2.jpg',
    //   'assets/images/halong3.jpg',
    //   'assets/images/halong4.png',
    //   'assets/images/halong5.jpg'
    // ],
    image: 'assets/images/halong1.jpg',
    location: 'Thành phố Hạ Long, Quảng Ninh',
    price: 245,
    info:
        'Vịnh Hạ Long - di sản thiên nhiên thế giới đã được UNESCO công nhận là một trong những minh chứng cho thấy rằng thiên nhiên kỳ diệu như thế nào trong việc tạo ra những tuyệt tác về phong cảnh. Mặt vịnh êm ả với làn nước trong xanh cùng những hòn đảo nhỏ với hình thù sinh động chắc chắn là những ấn tượng khó quên với du khách.',
    cateName: 'Domestic',
  ),
  Places(
    id: 5,
    namePlace: 'Tam Cốc - Bích Động',
    nameAirport: 'Hà Nội',
    nameHotel: 'Khách sao ngàn sao',
    rating: '4.5',
    // image: [
    //   'assets/images/tamcoc1.jpeg',
    //   'assets/images/tamcoc2.jpg',
    //   'assets/images/tamcoc3.jpg',
    //   'assets/images/tamcoc4.jpg'
    // ],
    image: 'assets/images/tamcoc1.jpeg',
    location: 'Ninh Hải, Hoa Lư, Ninh Bình',
    price: 245,
    info:
        'Không chỉ nổi tiếng với quần thể cố đô, Ninh Bình còn gây thương nhớ với khung cảnh thiên nhiên yên bình nhờ non xanh, nước biếc và những làng mạc trù phú trong khu danh thắng Tam Cốc - Bích Động. Không gì có thể sánh được cảm giác ngồi trên thuyền lướt nhẹ trên mặt nước, phóng tầm mắt ra xa những dãy núi đá vôi và hít căng lồng ngực bầu không khí trong lành từ đồng ruộng bát ngát.',
    cateName: 'Domestic',
  ),
  Places(
    id: 6,
    namePlace: 'Sun World Bà Nà Hills',
    nameAirport: 'Đà Nẵng',
    nameHotel: 'Khách sạn Sun World',
    rating: '4.5',
    // image: [
    //   'assets/images/banahill1.jpeg',
    //   'assets/images/banahill2.jpg',
    //   'assets/images/banahill3.jpg',
    // ],
    image: 'assets/images/banahill1.jpeg',
    location: 'Hoà Ninh, Hòa Vang, Đà Nẵng',
    price: 245,
    info:
        'Nếu bạn đến tham quan Đà Nẵng mà bỏ qua  thì coi như chưa từng đến nơi đây. Với tuyến cáp treo dài top 10 thế giới, du khách sẽ được đưa lên “tiên cảnh” với sự hùng vĩ của thiên nhiên xung quanh từ đỉnh núi Chúa với những cánh rừng ẩn mình trong sương mờ, những thác nước tráng lệ và những ngọn núi đồ sộ. Du khách cũng có thể chiêm ngưỡng những kiến trúc cổ kính, diễm lệ của Làng Pháp và đi bộ trên Cầu Vàng - địa điểm được xếp hạng là một trong những cây cầu đi bộ đẹp nhất thế giới năm 2018.',
    cateName: 'Domestic',
  ),
  Places(
    id: 7,
    namePlace: 'VinWonders Nha Trang',
    nameAirport: 'Cam Ranh',
    nameHotel: 'Khách sạn VinWonders',
    rating: '4.5',
    // image: [
    //   'assets/images/japan.png',
    //   'assets/images/korea.png',
    //   'assets/images/turkey.png',
    //   'assets/images/dubai.png',
    // ],
    image: 'assets/images/japan.png',
    location: 'Hòn Tre, Nha Trang, Khánh Hòa',
    price: 245,
    info:
        'Những gì đang chờ đón bạn bạn ? Nơi đây là khu vui chơi, giải trí và là địa điểm sống ảo không thể tuyệt vời hơn cho cả gia đình để có những phút giây gắn kết khó quên. Công viên này sở hữu tuyến cáp treo 2 chiều dài nhất thế giới với độ dài 3320m, cùng với đó là vô số trò chơi cảm giác mạnh như nhà phao nổi, tàu lượn siêu tốc và đặc biệt hơn cả là những màn trình diễn cá heo ấn tượng. Không chỉ có vậy, VinWonders Nha Trang còn chào đón du khách với bánh xe khổng lồ với màu sắc rực rỡ và những tòa lâu đài như lạc vào thế giới cổ tích.',
    cateName: 'Domestic',
  ),
  Places(
    id: 8,
    namePlace: 'Chợ Bến Thành',
    nameAirport: 'Hồ Chí Minh',
    nameHotel: 'Khách sạn View',
    rating: '4.5',
    // image: [
    //   'assets/images/chobenthanh1.jpg',
    //   'assets/images/chobenthanh2.jpg',
    //   'assets/images/chobenthanh3.jpg',
    // ],
    image: 'assets/images/chobenthanh1.jpg',
    location: 'Phường Bến Thành, Quận 1, Thành phố Hồ Chí Minh',
    price: 245,
    info:
        'Chợ Bến Thành cũng là một trong những địa điểm nổi bật mang tính biểu tượng của Sài Gòn xưa, nơi bán đủ mọi thứ trên đời, đặc biệt là các món quà lưu niệm. Nếu đã đến Thành phố Hồ Chí Minh, đừng bỏ qua khu chợ sầm uất này để ghi lại những bức ảnh kỷ niệm và thưởng thức ẩm thực đặc trưng Sài Gòn nhé!',
    cateName: 'Domestic',
  ),
  Places(
    id: 9,
    namePlace: 'Vinpearl Safari Phú Quốc',
    nameAirport: 'Phú Quốc',
    nameHotel: 'Khách sạn VinPearl',
    rating: '4.5',
    // image: [
    //   'assets/images/vinpearlphuquoc.jpg',
    //   'assets/images/vinpearlphuquoc2.jpg',
    //   'assets/images/vinpearlphuquoc3.jpg',
    // ],
    image: 'assets/images/vinpearlphuquoc.jpg',
    location: 'Bãi Dài, Gành Dầu, Phú Quốc, Kiên Giang',
    price: 245,
    info:
        'Vinpearl Safari Phú Quốc là địa điểm mà chắc chắn những gia đình có con nhỏ không nên bỏ qua. Nơi đây sẽ cho cả gia đình những trải nghiệm khác biệt hoàn toàn so với các sở thú truyền thống khi bạn có thể “mục sở thị” các loài động vật hoang dã bằng cách quan sát chúng từ xe bus, xem cách chúng sinh hoạt trong thiên nhiên ra sao thay vì chỉ được nhìn từ qua khung sắt. Với hơn 3000 động vật từ 150 loài khác nhau như hổ, sư tử, hươu cao cổ, voi, đại bàng,... cả gia đình sẽ có những kiến thức và trải nghiệm thật bổ ích.',
    cateName: 'Domestic',
  ),
  Places(
    id: 10,
    namePlace: 'Bali',
    nameAirport: 'Indonesia',
    nameHotel: 'Khách sạn Bali',
    rating: '4.5',
    // image: [
    //   'assets/images/bali.jpg',
    //   'assets/images/bali1.jpg',
    //   'assets/images/bali2.jpg',
    // ],
    image: 'assets/images/bali.jpg',
    location: 'Bali, Indonesia',
    price: 245,
    info:
        'Bali là điểm đến phổ biến nhất cho những người muốn tận hưởng một kỳ nghỉ vui vẻ và không căng thẳng. Điểm đến này nhận được số điểm 73,7 trên 100. “Bali đứng đầu danh sách nhờ có các spa và trung tâm chăm sóc sức khỏe tuyệt vời cũng như các hoạt động ngoài trời tuyệt vời - hoàn hảo cho bất kỳ ai đang tìm kiếm sự thư giãn và phiêu lưu trong kỳ nghỉ của họ”, thông báo từ trang web Club Med.',
    cateName: 'Aboard',
  ),
  Places(
    id: 11,
    namePlace: 'Las Vegas',
    nameAirport: 'Hoa Kỳ',
    nameHotel: 'Khách sạn  LasVegas',
    rating: '4.5',
    // image: [
    //   'assets/images/japan.png',
    //   'assets/images/korea.png',
    //   'assets/images/turkey.png',
    //   'assets/images/dubai.png',
    // ],
    image: 'assets/images/japan.png',
    location: 'Nevada, Hoa Kỳ',
    price: 245,
    info:
        'Trong khi hầu hết mọi người nghĩ về Las Vegas với vô số khách sạn, sòng bạc và giải trí, khu vực này là nơi có nhiều hơn thế. Club Med đã xác định hơn 40 hoạt động ban ngày khiến nơi này không chỉ là một điểm đến đánh bạc, uống rượu và biểu diễn. Có rất nhiều trò chơi đẳng cấp thế giới, đi bộ đường dài, thể thao dưới nước và thậm chí trượt tuyết tại Núi Charleston vào mùa đông.',
    cateName: 'Aboard',
  ),
  Places(
    id: 12,
    namePlace: 'New Orleans',
    nameAirport: 'Hoa Kỳ',
    nameHotel: 'Khách sạn NewOrleans',
    rating: '4.5',
    // image: [
    //   'assets/images/japan.png',
    //   'assets/images/korea.png',
    //   'assets/images/turkey.png',
    //   'assets/images/dubai.png',
    // ],
    image: 'assets/images/korea.png',
    location: 'Louisiana, Hoa Kỳ',
    price: 245,
    info:
        'New Orleans là một trải nghiệm tuyệt vời cho các giác quan, một thành phố với những con đường rực rỡ sắc màu, nhịp điệu đầy tâm hồn và nhạc blues. Vùng ven biển Louisiana là trung tâm ẩm thực của đồ ăn creole và cajun, và ngoài các món ngon từ tôm và khoai tây nướng, đó là thành phố đã mang đến cho chúng ta món muffuletta, beignets và hàu nướng than. New Orleans, có biệt danh là “The Big Easy”, là một thị trấn của các vị vua và nữ hoàng nhạc jazz, kiến ​​trúc mang tính biểu tượng, các Vị thánh của New Orleans, và có lẽ là con phố tinh thần nhất ở Mỹ - Phố Bourbon. Đây cũng là một trong những thành phố duy nhất ở Mỹ nơi bạn có thể uống rượu trên đường phố một cách hợp pháp.',
    cateName: 'Aboard',
  ),
  Places(
    id: 13,
    namePlace: 'Barcelona',
    nameAirport: 'Tây Ban Nha',
    nameHotel: 'Khách sạn Barce',
    rating: '4.5',
    // image: [
    //   'assets/images/japan.png',
    //   'assets/images/korea.png',
    //   'assets/images/turkey.png',
    //   'assets/images/dubai.png',
    // ],
    image: 'assets/images/turkey.png',
    location: 'Barcelona, ​​Tây Ban Nha',
    price: 245,
    info:
        'Nếu bạn đang tìm kiếm một điểm đến cho chuyến du lịch một mình, nơi mang lại tất cả sự quyến rũ và sôi động của một thành phố lớn nhưng cũng có giá cả phải chăng, thì không đâu xa hơn Barcelona. Thành phố sôi động của Tây Ban Nha có nhiều món ăn ngon, kiến ​​trúc hấp dẫn và cuộc sống về đêm sôi động, tất cả đều ở mức giá hợp lý so với các thủ đô khác của châu Âu.',
    cateName: 'Aboard',
  ),
  Places(
    id: 14,
    namePlace: 'Amsterdam',
    nameAirport: 'Hà Lan',
    nameHotel: 'Khách sạn Amsterdam',
    rating: '4.5',
    // image: [
    //   'assets/images/japan.png',
    //   'assets/images/korea.png',
    //   'assets/images/turkey.png',
    //   'assets/images/dubai.png',
    // ],
    image: 'assets/images/dubai.png',
    location: 'Amsterdam, Hà Lan',
    price: 245,
    info:
        'Amsterdam của Hà Lan thu hút đông đảo du khách với những con kênh quyến rũ, chợ hoa tươi vui, những người dân địa phương vui vẻ đi xe đạp, ngôi nhà Anne Frank và các bảo tàng đẳng cấp thế giới như Rijksmuseam, nhưng còn rất nhiều điểm tham quan khác ở đất nước đầy tráng lệ này - những cánh đồng hoa đầy màu sắc và những chiếc cối xay gió cổ điển.',
    cateName: 'Aboard',
  ),
];
