package paginationDAO;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

public class ProductsDAO {
	private static final String jdbcURL = "jdbc:oracle:thin:@localhost:1521:xe";
	private static final String jdbcUsername = "khmember";
	private static final String jdbcPassword = "kh1234";
	
	//1. 모든 제품을 가지고 오는 메서드
	//페이지 번호와 페이지 크기를 받아와서 리스트에 추가하는 메소드
	
	public List<Products> getAllProducts(int pageNumber, int pageSize){
    	List<Products> productList = new ArrayList<>();
        int start = PaginationUtil.paginationStart(pageNumber, pageSize);
        int end = PaginationUtil.paginationEnd(pageNumber, pageSize);
		
		try {
			Class.forName("oracle.jdbc.OracleDriver");
			 Connection conn = DriverManager.getConnection(jdbcURL, jdbcUsername, jdbcPassword);
	            String sql = "SELECT * FROM (SELECT p.*, ROWNUM AS rnum FROM (SELECT * FROM products ORDER BY product_id) p WHERE ROWNUM <= ?) WHERE rnum >= ?";
	           /*
			 * String sql = "SELCT * FROM products " //products 테이블에서
						+ "ORDER BY product_id "  //product_id 기준으로 정렬할 것 임
						// 지정된 OFFSET FETCH NEXT페이지를 가지고 옴
						+ "OFFSET ? " // OFFSET : 가져오기를 시작할 행의 위치 나타냄
						+ "ROWS FETCH NEXT? " //FETCH NEXT : 다음에 가져올 행의 수 지정
						+ "ROWS ONLY";
			*/
	         PreparedStatement ps = conn.prepareStatement(sql);
	         ps.setInt(1, end);
	         ps.setInt(2, start);

			
			ResultSet rs = ps.executeQuery();
			while(rs.next()) {
				Products product = new Products();
                product.setProductId(rs.getInt("product_id"));
                product.setProductName(rs.getString("product_name"));
                product.setCategory(rs.getString("category"));
                product.setPrice(rs.getDouble("price"));
                product.setStockQuantity(rs.getInt("stock_quantity"));
                productList.add(product);
			}
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		
		return productList;
	}

	
	//2. 전체 제품 수를 가지고 오는 메서드
	public int getTotalProducts() {
		int totalProducts = 0;
		try {
			Class.forName("oracle.jdbc.OracleDriver");
			Connection conn = DriverManager.getConnection(jdbcURL, jdbcUsername, jdbcPassword);
			
			String sql= "SELECT COUNT(*) AS total FROM products";
			PreparedStatement ps = conn.prepareStatement(sql);
			ResultSet rs = ps.executeQuery();
			if (rs.next()) {
				totalProducts = rs.getInt("total");
			}
			
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return totalProducts;
	}
}





