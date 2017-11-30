package action;

import java.util.Scanner;

public class Action {
  public int showMainMenu() {
    Scanner input = new Scanner(System.in);
    
    int yourChoice = 0;
    
    System.out.println("1. Thêm mới cán bộ.");
    System.out.println("2. Chỉnh sửa thông tin cán bộ.");
    System.out.println("3. Xóa cán bộ.");
    System.out.println("4. Hiện thị danh sách cán bộ.");
    System.out.println("5. Thoát chương trình.");
    
    while(true) {
      
    	System.out.print("Nhập lựa chọn (1->5): ");
    	
      try {
        yourChoice = Integer.parseInt(input.nextLine());        
      
        if(!(yourChoice >= 1 && yourChoice <= 5)) {
        	System.out.println("Lựa chọn của bạn không tồn tại, mời nhập lại!");
        }
        else
        	break;
        
      }catch(NumberFormatException numberException) {
        System.out.println("Lựa chọn vừa nhận không hợp lệ, mời nhập lại!");
      }
    }
    
    input.close();
    
    return yourChoice;
  }
}
