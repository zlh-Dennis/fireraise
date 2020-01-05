package com.fireraise.util;

import java.util.UUID;

/**
 * @ClassName: IdGeneration
 * @Description: ID生成类，用于生成各种各种对象的id
 * @date 2019年12月26日 下午3:46:29
 */
public class IdGeneration {

//	private static Random random = new Random();
//    private static SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMddhhmmss");
    
    /**
     * 自动生成 advertisement 对象的id
     * @return 自动生成且补全位数的id
     */
    public static String advertisementID() {
    	return "01" + getUUID(18);
//        String id = "01" + sdf.format(new Date()) + random.nextInt(10000);
//        return IdFix(id, 20);
    }
    
    /**
     * 自动生成 applicant 对象的id
     * @return 自动生成且补全位数的id
     */
    public static String applicantID() {
    	return "02" + getUUID(18);
    }
    
    /**
     * 自动生成 bankcard 对象的id
     * @return 自动生成且补全位数的id
     */
    public static String bankcardID() {
    	return "03" + getUUID(18);
    }
    
    /**
     * 自动生成 bill 对象的id
     * @return 自动生成且补全位数的id
     */
    public static String billID() {
    	return "04" + getUUID(18);
    }
    
    /**
     * @Description: 自动生成 manager 对象的id
     * @Title: managerID
     */
    public static String managerID() {
    	return "05" + getUUID(18);
    }
    
    /**
     * @Description: 自动生成 message 对象的id
     * @Title: messageID
     */
    public static String messageID() {
    	return "06" + getUUID(18);
    }
    
    /**
     * @Description: 自动生成 user 对象的id
     * @Title: userID
     */
    public static String userID() {
    	String id = "07" + getUUID(18);
    	System.out.println(id);
    	return id;
    }
    
    /**
     * @Description: 自动生成身份证图片的id
     * @Title: cardID
     * @param
     */
    public static String cardID() {
    	return "08" + getUUID(18);
    }
    
    /**
     * @Description: 自动生成海报的id
     * @Title: pictureID
     * @param
     */
    public static String pictureID() {
    	return "09" + getUUID(18);
    }
    
    public static String hurdlesID() {
    	return "10" + getUUID(18);
    }
    
    /**
     * @Description: 获得n位的UUID字符串
     * @Title: getUUID
     * @param
     */
    public static String getUUID(int number) {
		UUID uuid = UUID.randomUUID();
		String str = uuid.toString();
		// 去掉"-"符号
		String temp = str.substring(0, 8) + str.substring(9, 13) + str.substring(14, 18) + str.substring(19, 23)
				+ str.substring(24);
		return temp.substring(0, number);
	}
    
    /**
     * 使用随机数生成的id有可能会产生位数不足的情况，因此使用此方法补足位数
     * @param id 随机生成的id，如果位数不足则补全，反之不做处理
     * @param number 补足位数之后的id位数(期待的id字符数)
     * @return 位数补足完成后的id
     */
//    private static String IdFix(String id, Integer number) {
//        if(id.length() < number) {
//            id = id + new Random().nextInt(9);
//            return IdFix(id, number);
//        }
//        else
//            return id;
//    }
    
}