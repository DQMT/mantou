package io.uicp.tincat.mantou.util;

import java.util.Random;

import org.apache.commons.codec.digest.DigestUtils;


public class StringUtil {

    public static String getRandomString(int length){  
        String str = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789";  
        Random random = new Random();  
        StringBuffer sb = new StringBuffer();  
          
        for(int i = 0 ; i < length; ++i){  
            int number = random.nextInt(62);//[0,62)  
              
            sb.append(str.charAt(number));  
        }  
        return sb.toString();  
    } 
    
    public static String getMD5(String s){
    	return DigestUtils.md5Hex(s);
    }
}
