package com.kh.product;

public class ProductReview {

    private int reviewID;
    private int productID;
    private String userID;
    private String reviewTitle;
    private String reviewComment;

    public ProductReview(int reviewID, int productID, String userID, String reviewTitle, String reviewComment) {
        this.reviewID = reviewID;
        this.productID = productID;
        this.userID = userID;
        this.reviewTitle = reviewTitle;
        this.reviewComment = reviewComment;
    }

    public int getReviewID() {
		return reviewID;
	}



	public void setReviewID(int reviewID) {
		this.reviewID = reviewID;
	}



	public int getProductID() {
		return productID;
	}



	public void setProductID(int productID) {
		this.productID = productID;
	}



	public String getUserID() {
		return userID;
	}



	public void setUserID(String userID) {
		this.userID = userID;
	}



	public String getReviewTitle() {
		return reviewTitle;
	}



	public void setReviewTitle(String reviewTitle) {
		this.reviewTitle = reviewTitle;
	}



	public String getReviewComment() {
		return reviewComment;
	}



	public void setReviewComment(String reviewComment) {
		this.reviewComment = reviewComment;
	}


}
