package com.windy.zfxy.utils;

public class ShortString {
	public static String shortString(String s){
		String str = "" ;
		if(s!=null&&!s.equals("")&&s.length()!=0){
			if(s.length()>10){
				str = s.subSequence(0,10).toString()+".......";
			}else{
				str = s ;
			}
		}
		return str;
	}
	public static String shotTitle(String s,int size){
		String str = "" ;
		if(s!=null&&!s.equals("")&&s.length()!=0){
			if(s.length()>size){
				str = s.subSequence(0,size).toString()+"......";
			}else{
				str = s ;
			}
		}
		return str;
	}
}
