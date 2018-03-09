package com.ngoc.bookmanagement.controller;

import com.ngoc.bookmanagement.constant.Constant;
import com.ngoc.bookmanagement.exception.DuplicateEmailException;
import com.ngoc.bookmanagement.model.Avatar;
import com.ngoc.bookmanagement.model.Book;
import com.ngoc.bookmanagement.model.User;
import com.ngoc.bookmanagement.service.AvatarService;
import com.ngoc.bookmanagement.service.BookService;
import com.ngoc.bookmanagement.service.PasswordService;
import com.ngoc.bookmanagement.service.UserService;
import net.bytebuddy.asm.Advice;
import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

import javax.servlet.http.HttpServletRequest;
import java.util.Date;

@Controller
public class CreateDummyDataController {

    private static final Logger logger = Logger.getLogger(CreateDummyDataController.class);

    @Autowired
    private UserService userService;

    @Autowired
    private BookService bookService;

    @Autowired
    private AvatarService avatarService;

    @Autowired
    private PasswordService passwordService;


    @GetMapping("/createDummyData")
    public String createDummyDataGet(HttpServletRequest request) throws DuplicateEmailException {
        logger.info(request.getRequestURI() + ", method = GET");
        request.setAttribute(Constant.urlRewriteAttribute, request.getRequestURI());

        long avatarId;
        Avatar avatar;

        // account admin
        User admin = new User("admin@gmail.com", "password", "ngoc", "bui", Constant.ADMIN_ROLE);
        admin.setEncryptingPassword(passwordService.encryptPassword(admin.getPassword()));
        long adminId = userService.save(admin);

        avatar = new Avatar();
        avatar.setUrl(null);
        avatar.setUser_id(adminId);
        avatarService.save(avatar);
        admin.setAvatar_id(1);
        userService.update(adminId, admin);

        // account user
        User user = new User("ngoc@gmail.com", "password", "Quang Ngọc", "Bui Lam", Constant.USER_ROLE);
        user.setEncryptingPassword(passwordService.encryptPassword(user.getPassword()));
        long id = userService.save(user);

        avatar = new Avatar();
        avatar.setUrl(null);
        avatar.setUser_id(id);
        avatarService.save(avatar);
        user.setAvatar_id(2);
        userService.update(id, user);

        Book book = new Book();
        book.setTitle("Ánh Sáng thành phố");
        book.setAuthor("Lôi Mễ");
        book.setDescription("trinh thám");
        book.setCreated_at(new Date());
        book.setUpdated_at(new Date());
        book.setUser_id(user.getId());
        bookService.save(book);

        book = new Book();
        book.setTitle("Độc giả thứ 7");
        book.setAuthor("Lôi Mễ");
        book.setDescription("trinh thám");
        book.setCreated_at(new Date());
        book.setUpdated_at(new Date());
        book.setUser_id(user.getId());
        bookService.save(book);

        book = new Book();
        book.setTitle("Phía Sau Nghi Can X");
        book.setAuthor("Higashino");
        book.setDescription("Khi nhấn chuông cửa nhà nghi can chính của một vụ án mới, điều tra viên Kusanagi không biết rằng anh sắp phải đương đầu với một thiên tài ẩn dật. Kusanagi càng không thể ngờ rằng, chỉ một câu nói vô thưởng vô phạt của anh đã kéo người bạn thân, Manabu Yukawa, một phó giáo sư vật lý tài năng, vào vụ án. Và điều làm sững sờ nhất, đó là vụ án kia chẳng qua cũng chỉ như một bài toán cấp ba đơn giản, tuy nhiên ấn số X khi được phơi bày ra lại không đem đến hạnh phúc cho bất cứ ai…  Với một giọng văn tỉnh táo và dung dị, Higashino Keigo đã đem đến cho độc giả hơn cả một cuốn tiểu thuyết trinh thám. Mô tả tội ác không phải điều hấp dẫn nhất ở đây, mà còn là những giằng xé nội tâm thầm kín, những nhân vật bình dị, và sự quan tâm sâu sa tới con người. Tác phẩm đã đem lại cho Higashino Keigo Giải Naoki lần thứ 134, một  giải thưởng văn học lâu đời sánh ngang giải Akutagawa tại Nhật.");
        book.setCreated_at(new Date());
        book.setUpdated_at(new Date());
        book.setUser_id(user.getId());
        bookService.save(book);

        book = new Book();
        book.setTitle("Bạch Dạ Hành");
        book.setAuthor("Higashino Keigo");
        book.setDescription("Kosuke, chủ một tiệm cầm đồ bị sát hại tại một ngôi nhà chưa hoàn công, một triệu yên mang theo người cũng bị cướp mất.  Sau đó một tháng, nghi can Fumiyo được cho rằng có quan hệ tình ái với nạn nhân và đã sát hại ông để cướp một triệu yên, cũng chết tại nhà riêng vì ngộ độc khí ga. Vụ án mạng ông chủ tiệm cầm đồ rơi vào bế tắc và bị bỏ xó.  Nhưng với hai đứa trẻ mười một tuổi, con trai nạn nhân và con gái nghi can, vụ án mạng năm ấy chưa bao giờ kết thúc. Sinh tồn và trưởng thành dưới bóng đen cái chết của bố mẹ, cho đến cuối đời, Ryoji vẫn luôn khao khát được một lần đi dưới ánh mặt trời, còn Yukiho cứ ra sức vẫy vùng rồi mãi mãi chìm vào đêm trắng.");
        book.setCreated_at(new Date());
        book.setUpdated_at(new Date());
        book.setUser_id(user.getId());
        bookService.save(book);

        book = new Book();
        book.setTitle("Mạnh Hơn Sợ Hãi");
        book.setAuthor("Marc Levy");
        book.setDescription("Bức thư tìm được trong xác chiếc máy bay vùi mình trong khe núi Trắng đã thổi bùng trong Suzie Baker hy vọng đòi lại công lý cho gia đình. Và trong khi mạng lưới mật vụ Mỹ rùng rùng chuyển động hòng cản bước cô, cô gặp Andrew Stilman. Anh là một tài năng thực sự trong lĩnh vực phóng sự điều tra, và anh trở thành người cộng sự để cùng cô lật lại vụ kỳ án. Hai con người khát khao công lý, cùng mang trong tim một tình yêu lớn hơn mọi hình dung, liệu có thể vượt qua những cạm bẫy và mưu mô trong hành trình phá án giờ đã trở nên không thể thiếu nếu muốn giữ được mạng sống của cô gái trẻ?");
        book.setCreated_at(new Date());
        book.setUpdated_at(new Date());
        book.setUser_id(user.getId());
        bookService.save(book);

        book = new Book();
        book.setTitle("Chân Trời Đảo Ngược");
        book.setAuthor("Marc Levy");
        book.setDescription("Ý thức của chúng ta nằm ở đâu?  Liệu chúng ta có thể sao chép và lưu giữ ký ức bên ngoài thân xác con người không?  Liệu tình yêu có thể đảo ngược quy luật khắc nghiệt về sự hữu hạn của cuộc sống trong thời gian và không gian?  Xúc động, ly kỳ nhưng cũng đầy hài hước và lạc quan, Marc Levy đưa chúng ta đến với câu chuyện tình thách thức thời gian, không gian và bệnh tật, khiến ta trân trọng hơn những điều tưởng chừng nhỏ bé trong cuộc sống. \"Một trong những tiểu thuyết xúc động nhất của Marc Levy. Người đẹp ngủ trong rừng phiên bản 2.0, với một trong những nhân vật nữ thành công nhất.\"");
        book.setCreated_at(new Date());
        book.setUpdated_at(new Date());
        book.setUser_id(user.getId());
        bookService.save(book);

        book = new Book();
        book.setTitle("Đề thi đẫm máu");
        book.setAuthor("Lôi Mễ");
        book.setDescription("Truyện trinh thám kinh dị");
        book.setCreated_at(new Date());
        book.setUpdated_at(new Date());
        book.setUser_id(user.getId());
        bookService.save(book);


        // account user1
        User user1 = new User("hai@gmail.com", "password", "Thanh Hai", "Bui Lam", Constant.USER_ROLE);
        user1.setEncryptingPassword(passwordService.encryptPassword(user1.getPassword()));
        long id1 = userService.save(user1);

        avatar = new Avatar();
        avatar.setUrl(null);
        avatar.setUser_id(id1);
        avatarService.save(avatar);
        user1.setAvatar_id(3);
        userService.update(id1, user1);

        book = new Book();
        book.setTitle("Nhà Giả Kim");
        book.setAuthor("Paulo Coelho");
        book.setDescription("Tất cả những trải nghiệm trong chuyến phiêu du theo đuổi vận mệnh của mình đã giúp Santiago thấu hiểu được ý nghĩa sâu xa nhất của hạnh phúc, hòa hợp với vũ trụ và con người.");
        book.setCreated_at(new Date());
        book.setUpdated_at(new Date());
        book.setUser_id(user1.getId());
        bookService.save(book);

        book = new Book();
        book.setTitle("Nhà Giả Kim");
        book.setAuthor("Paulo Coelho");
        book.setDescription("Tất cả những trải nghiệm trong chuyến phiêu du theo đuổi vận mệnh của mình đã giúp Santiago thấu hiểu được ý nghĩa sâu xa nhất của hạnh phúc, hòa hợp với vũ trụ và con người.");
        book.setCreated_at(new Date());
        book.setUpdated_at(new Date());
        book.setUser_id(user1.getId());
        bookService.save(book);

        book = new Book();
        book.setTitle("The Spy");
        book.setAuthor("Paulo Coelho");
        book.setDescription("HER ONLY CRIME WAS TO BE AN INDEPENDENT WOMAN  When Mata Hari arrived in Paris she was penniless. Within months she was the most celebrated woman in the city.  As a dancer, she shocked and delighted audiences; as a courtesan, she bewitched the era’s richest and most powerful men.  But as paranoia consumed a country at war, Mata Hari’s lifestyle brought her under suspicion. In 1917, she was arrested in her hotel room on the Champs Elysees, and accused of espionage. Told in Mata Hari’s voice through her final letter, The Spy is the unforgettable story of a woman who dared to defy convention and who paid the ultimate price.");
        book.setCreated_at(new Date());
        book.setUpdated_at(new Date());
        book.setUser_id(user1.getId());
        bookService.save(book);

        book = new Book();
        book.setTitle("5 Centimet Trên Giây");
        book.setAuthor("Shinkai Makoto");
        book.setDescription("");
        book.setCreated_at(new Date());
        book.setUpdated_at(new Date());
        book.setUser_id(user1.getId());
        bookService.save(book);

        book = new Book();
        book.setTitle("Conan tập 2");
        book.setAuthor("conan");
        book.setDescription("");
        book.setCreated_at(new Date());
        book.setUpdated_at(new Date());
        book.setUser_id(user1.getId());
        bookService.save(book);

        // account user2
        User user2 = new User("user3@gmail.com", "password", "A", "Nguyễn Văn", Constant.USER_ROLE);
        user2.setEncryptingPassword(passwordService.encryptPassword(user2.getPassword()));
        long id2 = userService.save(user2);

        avatar = new Avatar();
        avatar.setUrl(null);
        avatar.setUser_id(id2);
        avatarService.save(avatar);
        user2.setAvatar_id(4);
        userService.update(id2, user2);

        return "redirect:/";
    }
}