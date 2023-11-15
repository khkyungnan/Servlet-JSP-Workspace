package com.kh.product;

import java.sql.Timestamp;

public class ProductComment {
/*
    comment_id NUMBER(10) PRIMARY KEY,
    product_id NUMBER(5),
    commenter_name VARCHAR2(50),
    comment_text VARCHAR2(500),
    FOREIGN KEY (product_id) REFERENCES products(product_id)
 * */
	private int commentId;
	private int productId;
	private String commenterName;
	private String commentText;
	private Timestamp commentDate;
	
	
	/* 값을 저장하고 저장된 내용을 보내기 위한 생성자*/
	public ProductComment(int commentId, int productId, String commenterName, String commentText, Timestamp commentDate) {
		this.commentId = commentId;
		this.productId = productId;
		this.commenterName = commenterName;
		this.commentText = commentText;
		this.commentDate = commentDate;
	}
	
	
	
	public Timestamp getCommentDate() {
		return commentDate;
	}
	public void setCommentDate(Timestamp commentDate) {
		this.commentDate = commentDate;
	}
	public int getCommentId() {
		return commentId;
	}
	public void setCommentId(int commentId) {
		this.commentId = commentId;
	}
	public int getProductId() {
		return productId;
	}
	public void setProductId(int productId) {
		this.productId = productId;
	}
	public String getCommenterName() {
		return commenterName;
	}
	public void setCommenterName(String commenterName) {
		this.commenterName = commenterName;
	}
	public String getCommentText() {
		return commentText;
	}
	public void setCommentText(String commentText) {
		this.commentText = commentText;
	}

	
	
}
