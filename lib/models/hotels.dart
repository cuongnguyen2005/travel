// ignore_for_file: public_member_api_docs, sort_constructors_first

class Hotels {
  int id;
  String nameHotel;
  String rating;
  List<String> image;
  String location;
  int price;
  String info;
  String findLocation;

  Hotels({
    required this.id,
    required this.nameHotel,
    required this.rating,
    required this.image,
    required this.location,
    required this.price,
    required this.info,
    required this.findLocation,
  });
}

List<Hotels> hotels = [
  //sapa
  Hotels(
    id: 1,
    nameHotel: 'Eden Boutique Hotel & Spa',
    rating: '4',
    image: [
      'assets/images/eden_sapa.jpg',
      'assets/images/eden_sapa1.jpg',
      'assets/images/eden_sapa2.jpg',
      'assets/images/eden_sapa3.jpg',
      'assets/images/eden_sapa4.jpg',
    ],
    location: '3B Thac Bac Street, Sapa, Lao Cai, Sa Pa, Việt Nam',
    price: 1326000,
    info:
        'Nằm ở thị xã Sa Pa, Eden Boutique Hotel & Spa có khu vườn, sảnh khách chung, sân hiên, nhà hàng và quầy bar. Khách sạn này nằm gần một số điểm tham quan nổi tiếng, cách Hồ Sa Pa chưa đầy 1 km, Nhà thờ Đá Sa Pa 5 phút đi bộ và Bến xe Sa Pa 800 m. Chỗ nghỉ cung cấp dịch vụ lễ tân 24 giờ, dịch vụ đưa đón sân bay, khu bếp chung và WiFi miễn phí trong toàn bộ khuôn viên.\nPhòng nghỉ gắn máy điều hòa tại Eden Boutique Hotel & Spa có bàn làm việc, ấm đun nước, tủ lạnh, minibar, két an toàn, TV màn hình phẳng và phòng tắm riêng với vòi xịt/chậu rửa vệ sinh. Tất cả các phòng đều được trang bị ga trải giường và khăn tắm.\nKhách lưu trú tại chỗ nghỉ có thể thưởng thức bữa sáng kiểu Mỹ.\nKhu vực này nổi tiếng với hoạt động đi xe đạp và du khách có thể thuê xe hơi tại Eden Boutique Hotel & Spa.\nGa cáp treo Fansipan Legend nằm trong bán kính 4,5 km từ khách sạn trong khi Vườn hoa Hàm Rồng - Núi Hàm Rồng cách đó 1,4 km. Sân bay gần nhất là sân bay Wenshan Puzhehei, cách Eden Boutique Hotel & Spa 221 km.',
    findLocation: 'sapa',
  ),
  Hotels(
    id: 2,
    nameHotel: 'Hotel de la Coupole - MGallery',
    rating: '5',
    image: [
      'assets/images/mgallery.jpg',
      'assets/images/mgallery2.jpg',
      'assets/images/mgallery3.jpg',
      'assets/images/mgallery4.jpg',
    ],
    location: '1, Phố Hoàng Liên, Lào Cai, Sa Pa, Việt Nam',
    price: 2878500,
    info:
        'Nằm ở thị trấn Sa Pa, Hotel de la Coupole - MGallery có hồ bơi nước nóng trong nhà, spa và trung tâm thể dục.\nLấy cảm hứng từ các dân tộc thiểu số ở Sapa và thời trang May Đo Cao Cấp (Haute Couture) của Pháp, tất cả các phòng tại đây đều có ban công, máy điều hòa, truyền hình vệ tinh màn hình phẳng, ấm đun nước, bể sục, đồ vệ sinh cá nhân miễn phí, tủ quần áo, phòng tắm riêng và khu vực ghế ngồi. Một số phòng cho tầm nhìn ra khu vườn.\nKhách sạn phục vụ bữa sáng tự chọn hoặc kiểu lục địa. Trong khuôn viên có nhà hàng Pháp Chic mở cửa cả ngày và đồng thời phục vụ các món ăn địa phương của Việt Nam. Du khách có thể thưởng thức bánh ngọt và sô-cô-la Marou được chế tác công phu tại tiệm bánh Cacao hay rượu sâm panh, món tapas và cocktail pha thủ công ở quán Absinthe.\nChỗ nghỉ cũng có phòng xông hơi khô và phòng tắm hammam. Khách nghỉ tại Hotel de la Coupole - MGallery có thể tham gia các hoạt động trong và xung quanh thị trấn Sa Pa, như đi xe đạp.',
    findLocation: 'sapa',
  ),
  Hotels(
    id: 3,
    nameHotel: 'Sapa Relax Hotel & Spa',
    rating: '3',
    image: [
      'assets/images/sapa_relax.jpg',
      'assets/images/sapa_relax2.jpg',
      'assets/images/sapa_relax3.jpg',
      'assets/images/sapa_relax4.jpg',
    ],
    location: '19A Dong Loi, Sapa Town, Lào Cai, Sa Pa, Việt Nam',
    price: 856000,
    info:
        'Tọa lạc tại thị xã Sa Pa, cách Ga cáp treo Fansipan Legend 5,4 km, Sapa Relax Hotel & Spa cung cấp chỗ nghỉ với khu vườn, chỗ đỗ xe riêng miễn phí, sảnh khách chung và sân hiên. Khách sạn 3 sao này có nhà hàng và phòng nghỉ gắn máy điều hòa với WiFi miễn phí cùng phòng tắm riêng. Chỗ nghỉ cung cấp dịch vụ phòng, dịch vụ lễ tân 24 giờ và dịch vụ thu đổi ngoại tệ cho khách.\nTất cả phòng nghỉ tại Sapa Relax Hotel & Spa đều được trang bị tủ lạnh, minibar, ấm đun nước, vòi xịt/chậu rửa vệ sinh, đồ vệ sinh cá nhân miễn phí, bàn làm việc, tủ để quần áo và TV màn hình phẳng. Một số phòng có ban công. Các phòng được bố trí ga trải giường và khăn tắm.',
    findLocation: 'sapa',
  ),
  //quảng ninh
  Hotels(
    id: 4,
    nameHotel: 'PHOENIX MINH CHÂU HOTEL',
    rating: '3',
    image: [
      'assets/images/phoenix.jpg',
      'assets/images/phoenix2.jpg',
      'assets/images/phoenix3.jpg',
      'assets/images/phoenix4.jpg',
    ],
    location: 'đảo Quan Lạn, huyện Vân Đồn, Quảng Ninh, Việt Nam',
    price: 1500000,
    info:
        'Tọa lạc tại tỉnh Quảng Ninh, cách Đảo Quan Lạn 8 km, PHOENIX MINH CHÂU HOTEL có hồ bơi ngoài trời, vườn và tầm nhìn ra hồ bơi. Trong số các tiện nghi của chỗ nghỉ này có nhà hàng, lễ tân 24 giờ, dịch vụ phòng và WiFi miễn phí trong toàn bộ khuôn viên. Khách sạn cung cấp các phòng gia đình.\nMỗi phòng nghỉ tại khách sạn đều có sân hiên nhìn ra vườn. Các căn được trang bị phòng tắm riêng, dép đi trong phòng và ga trải giường.\nKhách nghỉ tại PHOENIX MINH CHÂU HOTEL có thể thưởng thức bữa sáng à la carte.\nĐảo Ba Mùn nằm trong bán kính 13 km từ chỗ nghỉ trong khi Đảo Cô Tô cách đó 23 km. Sân bay gần nhất là sân bay quốc tế Cát Bi, cách PHOENIX MINH CHÂU HOTEL 87 km.',
    findLocation: 'quang ninh',
  ),
  Hotels(
    id: 5,
    nameHotel: 'Starlight Boutique Hotel',
    rating: '4',
    image: [
      'assets/images/starlight.jpg',
      'assets/images/starlight2.jpg',
      'assets/images/starlight3.jpg',
      'assets/images/starlight4.jpg',
    ],
    location: 'Khu 4 thị trấn Cô Tô, Cô Tô, Quảng Ninh, Việt Nam',
    price: 2300000,
    info:
        'Tọa lạc tại tỉnh Quảng Ninh, cách Đảo Cô Tô 70 m, Starlight Boutique Hotel có dịch vụ tiền sảnh, phòng nghỉ không gây dị ứng, sảnh khách chung, WiFi miễn phí và khu vườn. Khách sạn này có các phòng gia đình và sân hiên. Chỗ nghỉ cung cấp dịch vụ lễ tân 24 giờ, dịch vụ phòng và dịch vụ thu đổi ngoại tệ cho khách.\nPhòng nghỉ tại đây được trang bị máy điều hòa, TV truyền hình vệ tinh màn hình phẳng, tủ lạnh, ấm đun nước, vòi xịt/chậu rửa vệ sinh, dép và tủ để quần áo. Tất cả các phòng đều đi kèm két an toàn và minibar. Một số phòng có ban công trong khi các phòng còn lại cho tầm nhìn ra hồ nước. \nĐảo Ba Mùn nằm trong bán kính 200 m từ khách sạn trong khi Đảo Quan Lạn cách đó 12 km.',
    findLocation: 'quang ninh',
  ),
  Hotels(
    id: 6,
    nameHotel: 'Divas Homestay',
    rating: '3.5',
    image: [
      'assets/images/divas.jpg',
      'assets/images/divas2.jpg',
      'assets/images/divas3.jpg',
      'assets/images/divas4.jpg',
    ],
    location: 'khu 4 thị trấn Cô Tô, Cô Tô, Quảng Ninh, Việt Nam',
    price: 900000,
    info:
        'Located in Quang Ninh with Tình Yêu Beach and Cau My Co To Rocky Beach nearby, Divas Homestay provides accommodation with free private parking.\nMong Rong Beach is 2.3 km from the apartment.',
    findLocation: 'quang ninh',
  ),
  //Đà nẵng
  Hotels(
    id: 7,
    nameHotel: 'Bella Merry Hotel and Apartment',
    rating: '4',
    image: [
      'assets/images/bella.jpg',
      'assets/images/bella2.jpg',
      'assets/images/bella3.jpg',
      'assets/images/bella4.jpg',
    ],
    location: '69-71 Hà Bổng, Sơn Trà, Đà Nẵng, Việt Nam',
    price: 2780000,
    info:
        'Tọa lạc tại thành phố Đà Nẵng, Bella Merry Hotel and Apartment cung cấp chỗ nghỉ 4 sao hướng biển có hồ bơi ngoài trời, khu vườn và sảnh khách chung. Chỗ nghỉ này có dịch vụ phòng, nhà hàng, công viên nước và sân hiên. Nơi đây cung cấp dịch vụ lễ tân 24 giờ, dịch vụ đưa đón sân bay, dịch vụ văn phòng và WiFi miễn phí.\nTất cả các căn tại đây đều được trang bị máy điều hòa, TV truyền hình vệ tinh màn hình phẳng, minibar, ấm đun nước, vòi xịt/chậu rửa vệ sinh, đồ vệ sinh cá nhân miễn phí và bàn làm việc. Mỗi phòng đều được bố trí phòng tắm riêng với vòi sen và máy sấy tóc, trong khi một số phòng còn có nhà bếp với lò vi sóng. Các phòng nghỉ tại khách sạn đều có sẵn ga trải giường và khăn tắm.\nBella Merry Hotel and Apartment cung cấp dịch vụ cho thuê xe đạp và xe hơi, khu vực này nổi tiếng với hoạt động đi bộ đường dài và đi xe đạp.',
    findLocation: 'da nang',
  ),
  Hotels(
    id: 8,
    nameHotel: 'Syne Hotel',
    rating: '4',
    image: [
      'assets/images/syne.jpg',
      'assets/images/syne2.jpg',
      'assets/images/syne3.jpg',
      'assets/images/syne4.jpg',
    ],
    location: '22 Chính Hữu, Đà Nẵng, Việt Nam',
    price: 2450000,
    info:
        'Tọa lạc tại thành phố Đà Nẵng, Syne Hotel cung cấp chỗ nghỉ 4 sao sát biển và có hồ bơi ngoài trời, khu vườn và sân hiên. Trong số các tiện nghi của chỗ nghỉ này có nhà hàng, dịch vụ phòng, máy ATM và WiFi miễn phí trong toàn bộ khuôn viên. Nơi đây cung cấp dịch vụ tiền sảnh, bàn đặt tour và dịch vụ thu đổi ngoại tệ cho khách.\nCác phòng nghỉ tại khách sạn đều được trang bị máy điều hòa, tủ lạnh, minibar, ấm đun nước, vòi xịt/chậu rửa vệ sinh, đồ vệ sinh cá nhân miễn phí và bàn làm việc. Ngoài phòng tắm riêng với vòi sen cùng máy sấy tóc, các phòng tại đây còn có tầm nhìn ra quang cảnh thành phố. Mỗi phòng tại Syne Hotel đều có sẵn ga trải giường và khăn tắm.\nChỗ nghỉ phục vụ bữa sáng buffet hoặc bữa sáng kiểu lục địa.\nNhân viên tại quầy lễ tân thành thạo tiếng Nam Phi, Ả Rập, Azerbaijan và Belarus có thể hỗ trợ du khách lên kế hoạch cho kỳ nghỉ của mình.',
    findLocation: 'da nang',
  ),
  Hotels(
    id: 9,
    nameHotel: 'Sekong Hotel Da Nang',
    rating: '3.5',
    image: [
      'assets/images/divas.jpg',
      'assets/images/divas2.jpg',
      'assets/images/divas3.jpg',
      'assets/images/divas4.jpg',
    ],
    location: '160 Vo Nguyen Giap, Phuoc My, Son Tra, Đà Nẵng, Việt Nam',
    price: 1200000,
    info:
        'Tọa lạc ở thành phố Đà Nẵng, cách Bãi biển Mỹ Khê 300 m, Sekong Hotel Da Nang cung cấp chỗ nghỉ với xe đạp cho khách sử dụng miễn phí, chỗ đỗ xe riêng miễn phí, sân hiên và nhà hàng. Khách sạn 3 sao này có quầy bar. Chỗ nghỉ cung cấp dịch vụ lễ tân 24 giờ, dịch vụ đưa đón sân bay, dịch vụ phòng và WiFi miễn phí trong toàn bộ khuôn viên.\nCác phòng nghỉ tại khách sạn đều có ấm đun nước. Mỗi phòng nghỉ tại Sekong Hotel Da Nang đều được trang bị máy điều hòa, két an toàn, TV màn hình phẳng và một số phòng còn có ban công.\nChỗ nghỉ phục vụ bữa sáng kiểu lục địa, kiểu Anh/Ireland hoặc kiểu Ý hằng ngày.\nKhu vực này nổi tiếng với hoạt động đi xe đạp và du khách có thể thuê xe hơi tại chỗ nghỉ.\nSekong Hotel Da Nang nằm cách Cầu Sông Hàn 2,5 km và Cầu khóa Tình yêu 3 km. Sân bay gần nhất là sân bay quốc tế Đà Nẵng, cách khách sạn 6 km.',
    findLocation: 'da nang',
  ),
  //Nha trang
  Hotels(
    id: 10,
    nameHotel: 'Diamond Bay Hotel',
    rating: '5',
    image: [
      'assets/images/diamond.jpg',
      'assets/images/diamond2.jpg',
      'assets/images/diamond3.jpg',
      'assets/images/diamond4.jpg',
    ],
    location: '20 Tran Phu, Nha Trang, Việt Nam',
    price: 3250000,
    info:
        'Nằm gần bờ biển, Diamond Bay Hotel tọa lạc tại thành phố Nha Trang, cách Bảo tàng Khánh Hòa chỉ 200 m. Khách sạn có hồ bơi ngoài trời và du khách có thể chọn từ hàng loạt món ăn địa phương và quốc tế hay đơn giản là ngồi thưởng thức 1 ly bia ở quán bar.\nGần đó có các điểm tham quan như Bảo tàng Alexandre Yersin, cách đó 400 m, và Nhà thờ Nha Trang, cách đó 900 m. Sân bay Quốc tế Cam Ranh nằm trong bán kính 27 km từ khách sạn.\nĐược trang trí với tông màu đất và trung tính, mỗi phòng tại khách sạn đều được trang bị máy lạnh và TV màn hình phẳng. Một số phòng cho tầm nhìn ra hồ bơi hoặc thành phố. Các phòng tắm riêng có vòi sen hoặc bồn tắm và được cung cấp áo choàng tắm cùng dép để tạo sự thoải mái cho khách.\nChỗ nghỉ có các phòng karaoke, trung tâm thể dục và thậm chí cả các cửa hàng bán lẻ để khách thư giãn cùng các tiện nghi phục vụ doanh nhân như trung tâm dịch vụ doanh nhân và tiện nghi tổ chức tiệc/hội họp. Du khách có thể được hỗ trợ suốt 24 giờ/ngày bởi đội ngũ nhân viên song ngữ với các dịch vụ nhận phòng/trả phòng, thu đổi ngoại tệ, giữ hành lý và thậm chí là dịch vụ đặt tour/đặt vé',
    findLocation: 'nha trang',
  ),
  Hotels(
    id: 11,
    nameHotel: 'Galliot Hotel',
    rating: '4',
    image: [
      'assets/images/galliot.jpg',
      'assets/images/galliot2.jpg',
      'assets/images/galliot3.jpg',
      'assets/images/galliot4.jpg',
    ],
    location: '61A Nguyen Thien Thuat, Nha Trang, Việt Nam',
    price: 2870000,
    info:
        'Nằm ở Khu Phố Tây, Galliot Hotel cung cấp hồ bơi ngoài trời, trung tâm thể dục và các liệu pháp mát-xa. Khách có thể giải trí với tiện nghi hát karaoke cùng Wi-Fi miễn phí. Tại đây cung cấp dịch vụ đưa đón thu phí đến Sân bay Nha Trang.\nHotel Galliot có lễ tân 24 giờ với dịch vụ giặt và ủi. Trà và cà phê miễn phí được phục vụ tại sảnh đợi. Bàn đặt tour, tiện nghi cho khách doanh nhân và bãi đậu xe chung miễn phí cũng được cung cấp tại khách sạn.\nVới nội thất trang nhã trong tông màu trung tính, phòng máy lạnh được trang bị TV màn hình LCD gắn tường, khu vực tiếp khách, minibar và két an toàn. Đồ vệ sinh cá nhân được cung cấp trong phòng tắm riêng. Một số phòng còn có ban công.',
    findLocation: 'nha trang',
  ),
  Hotels(
    id: 12,
    nameHotel: 'Asteria Comodo Nha Trang Hotel',
    rating: '5',
    image: [
      'assets/images/asteria.jpg',
      'assets/images/asteria2.jpg',
      'assets/images/asteria3.jpg',
      'assets/images/asteria4.jpg',
    ],
    location: '86A Tran Phu, Nha Trang, Việt Nam',
    price: 3500000,
    info:
        'Comodo Nha Trang Hotel cung cấp các phòng nghỉ theo phong cách hiện đại tại thành phố Nha Trang, cách Trung tâm thuyền buồm Việt Nam và quán Sailing Club 4 phút đi bộ. Khách sạn có hồ bơi ngoài trời và 2 lựa chọn ăn uống trong khuôn viên, đều phục vụ đủ loại món ăn quốc tế.\nCác phòng nghỉ tại Comodo Nha Trang Hotel có bàn làm việc, TV màn hình phẳng và phòng tắm riêng với đồ vệ sinh cá nhân miễn phí. Máy điều hòa và tủ quần áo cũng được trang bị trong phòng.\nKhách sạn cách Quảng trường 2/4 và Tháp Trầm Hương 15 phút đi bộ. Sân bay quốc tế Cam Ranh cách đó 25 km.',
    findLocation: 'nha trang',
  ),

  //hội an
  Hotels(
    id: 13,
    nameHotel: 'Hoianan Boutique Hotel',
    rating: '4',
    image: [
      'assets/images/hoianan.jpg',
      'assets/images/hoianan2.jpg',
      'assets/images/hoianan3.jpg',
      'assets/images/hoianan4.jpg',
    ],
    location: '15A Nguyễn Hoàng, Minh An, Hội An, Việt Nam',
    price: 2340000,
    info:
        'Nằm ở thành phố Hội An, Hoianan Boutique Hotel có xe đạp cho khách sử dụng miễn phí, sân hiên, nhà hàng và quầy bar. Khách sạn 4 sao này có dịch vụ tiền sảnh và bàn đặt tour. Chỗ nghỉ cung cấp dịch vụ lễ tân 24 giờ, dịch vụ đưa đón sân bay, dịch vụ phòng và WiFi miễn phí.\nTất cả phòng nghỉ tại Hoianan Boutique Hotel được bố trí máy điều hòa, khu vực ghế ngồi, TV truyền hình vệ tinh màn hình phẳng, két an toàn, ấm đun nước và phòng tắm riêng với vòi xịt/chậu rửa vệ sinh, đồ vệ sinh cá nhân miễn phí cùng máy sấy tóc. Một số phòng có ban công trong khi các phòng khác nhìn ra thành phố. Mỗi phòng đều được trang bị ga trải giường và khăn tắm.\nChỗ nghỉ phục vụ bữa sáng kiểu Mỹ, bữa sáng kiểu Á hoặc bữa sáng chay.',
    findLocation: 'hoi an',
  ),
  Hotels(
    id: 14,
    nameHotel: 'Raon Villa - STAY 24H',
    rating: '4',
    image: [
      'assets/images/raon.jpg',
      'assets/images/raon2.jpg',
      'assets/images/raon3.jpg',
      'assets/images/raon4.jpg',
    ],
    location: 'Trần Nhân Tông, Cẩm Thanh, Hội An, Việt Nam ',
    price: 2300000,
    info:
        'Located in Hoi An, 4.6 km from Assembly Hall of Chaozhou Chinese Congregation, Raon Villa - STAY 24H provides accommodation with an outdoor swimming pool, free private parking, a garden and a shared lounge. This 4-star hotel offers a shared kitchen, room service and free WiFi. The hotel has a terrace and city views, and guests can enjoy a meal at the restaurant or a drink at the bar.\nAt the hotel each room is equipped with air conditioning, a seating area, a flat-screen TV with satellite channels, a safety deposit box and a private bathroom with a bidet, free toiletries and a hairdryer. Every room is equipped with a kettle, while some rooms are equipped with a kitchenette with a fridge. At Raon Villa - STAY 24H rooms include bed linen and towels.',
    findLocation: 'hoi an',
  ),
  Hotels(
    id: 15,
    nameHotel: 'Hoi An Dream City Hotel',
    rating: '3.5',
    image: [
      'assets/images/dream.jpg',
      'assets/images/dream2.jpg',
      'assets/images/dream3.jpg',
      'assets/images/dream4.jpg',
    ],
    location: '39 Tran Cao Van Street, Sơn Phong, Hội An, Việt Nam',
    price: 1250000,
    info:
        'Nằm cách Phố Cổ Hội An 5 phút đi bộ, Hoi An Dream City Hotel có hồ bơi ngoài trời cũng như nhà hàng trong khuôn viên. Khách sạn này cung cấp chỗ nghỉ ấm cúng với Wi-Fi miễn phí.\nTất cả phòng nghỉ tại đây đều có cửa sổ lớn, máy điều hòa và không gian lớn hơn. TV truyền hình cáp màn hình phẳng và bàn làm việc cũng được trang bị trong phòng. Phòng tắm riêng đi kèm bồn tắm, đồ vệ sinh cá nhân miễn phí và máy sấy tóc.\nDu khách có thể ghé qua thư viện để đọc sách hoặc thư giãn trong bể sục. Khách sạn cũng cung cấp các dịch vụ cho thuê xe hơi, thu đổi ngoại tệ và đặt vé. Lễ tân có thể thu xếp dịch vụ giữ hành lý cho khách.',
    findLocation: 'hoi an',
  ),
];
