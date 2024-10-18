package com.dongkoo.model;

import java.sql.Date;
import java.util.List;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class GoodsVO {

	private String ID;
	private String PDNO;
	private String PD_BCATE;
	private String PD_MCATE;
	private String PD_SCATE;
	private String PD_NAME;
	private String PD_MAKER;
	private String PD_NARA;
	private String PD_SIZE;
	private String PD_COLOR;
	private int PD_INPR;
	private int PD_OUTPR;
	private String PD_LTCD;
	private String PD_IMAGE;
	private Date PDDAY;
	private List<AttachImageVO> imageList;
	
	
}
