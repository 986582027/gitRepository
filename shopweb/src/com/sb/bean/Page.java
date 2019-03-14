package com.sb.bean;

public class Page {

		//当前页面
		private int pagenow;
		//总页面
		private int pages;
		//上一页
		private int pre;
		//下一页
		private int next;
		public Page() {
			super();
			// TODO Auto-generated constructor stub
		}
		public int getPagenow() {
			return pagenow;
		}
		public void setPagenow(int pagenow) {
			this.pagenow = pagenow;
		}
		public int getPages() {
			return pages;
		}
		public void setPages(int pages) {
			this.pages = pages;
		}
		public int getPre() {
			return pre;
		}
		public void setPre(int pre) {
			this.pre = pre;
		}
		public int getNext() {
			return next;
		}
		public void setNext(int next) {
			this.next = next;
		}
		@Override
		public String toString() {
			return "Page [pagenow=" + pagenow + ", pages=" + pages + ", pre=" + pre + ", next=" + next + "]";
		}

		
}
