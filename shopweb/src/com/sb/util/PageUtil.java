package com.sb.util;

import com.sb.bean.Page;

public class PageUtil {

	public static Page getPage(Integer pagesize,Integer counts,int pagenow){
		
		Page p = new Page();
		//总页数
		int pages = 0;
		if(pagenow>0){
			if(counts%pagesize==0){
				pages = counts/pagesize;
			}else if(counts%pagesize!=0){
				pages = counts/pagesize+1;
			}
		}else{
			pages = 1;
		}
		//上一页
		int pre = 0;
		if(pagenow>0){
			if(pagenow>1 && pagenow<=pages){
				pre = pagenow-1;
			}else{
				pre=pagenow;
			}
		}
		
		//下一页
		int next = 0;
		if(pagenow>0){
			if(pagenow<pages){
				next = pagenow+1;
			}else if(pagenow==pages){
				next = pages;
			}
		}
		p.setPagenow(pagenow);
		p.setPages(pages);
		p.setPre(pre);
		p.setNext(next);
		return p;
	}
}
