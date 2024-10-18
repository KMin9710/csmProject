package com.dongkoo.model;

import lombok.Getter;
import lombok.ToString;
import lombok.Setter;

@Getter
@Setter
@ToString
public class Criteria {
	
	private int pageNum;			//페이지 번호
	private int amount;				//페이지 표시 개수
	private int skip;				//페이지 스킵
	private String type;			//검색 타입
	private String keyword;			//검색 키워드
	
	public Criteria(int pageNum, int amount) {		//criteria 생성자
		this.pageNum = pageNum;
		this.amount = amount;
		this.skip = (pageNum - 1) * amount;
	}

	public Criteria() {								//criteria 기본 생성자
		this(1,10);
	}
	
	public String[] getTypeArr() {					//검색 타입 데이터 배열 반환
		return type == null? new String[] {}:type.split("");
	}
}
