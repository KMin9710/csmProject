package com.dongkoo.model;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class MarketVO {

	private String ID;
	private int MKNO;
	private String MK_NAME;
	private String MK_BUSNUM;
	private String MK_ADDR1;
	private String MK_ADDR2;
	private String MK_ADDR3;
	private String MK_TEL;
	private String MK_INDU;
	private String MK_TIME;
	private int MKDAY;
	private String MK_IMAGE;
}
