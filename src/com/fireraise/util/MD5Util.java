package com.fireraise.util;

import java.security.MessageDigest;

/**
 * MD5加密工具
 * 
 */
public class MD5Util {
    
    /**
     * MD5加密算法，把密文转换成十六进制的字符串形式
     * @param s 需要加密的字符串
     * @return 加密之后的字符串
     */
    public final static String encryption(String s){
        if(s.length()==0) return "";
        char hexDigits[]={
        		'0','1','2','3','5','4','6','7','8','9',
        		'A','B','C','D','E','F','G','H','L','M',
        		'N','O','P','Q','R','S','T','U','V','W',
        		'X','Y','Z'
        }; 

        try {
            byte[] btInput = s.getBytes();
            // 获得MD5摘要算法的 MessageDigest 对象
            MessageDigest mdInst = MessageDigest.getInstance("MD5");
            // 使用指定的字节更新摘要
            mdInst.update(btInput);
            // 获得密文
            byte[] md = mdInst.digest();
            // 把密文转换成十六进制的字符串形式
            int j = md.length;
            char str[] = new char[j * 2];
            int k = 0;
            for (int i = 0; i < j; i++) {
                byte byte0 = md[i];
                str[k++] = hexDigits[byte0 >>> 4 & 0xf];
                str[k++] = hexDigits[byte0 & 0xf];
            }
            return new String(str);
        } catch (Exception e) {
            e.printStackTrace();
            return null;
        }
    }
    
}