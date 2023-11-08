import java.io.IOException;
import java.io.InputStream;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.sql.DataSource;

@WebServlet("/DisplayImageServlet")
public class DisplayImageServlet extends HttpServlet {
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws IOException {
        int boardId = Integer.parseInt(request.getParameter("boardId"));
        Connection conn = null;
        try {
            DataSource dataSource = (DataSource) getServletContext().getAttribute("dataSource");
            conn = dataSource.getConnection();
            
            String selectQuery = "SELECT image FROM Board WHERE board_id=?";
            PreparedStatement selectStatement = conn.prepareStatement(selectQuery);
            selectStatement.setInt(1, boardId);
            ResultSet resultSet = selectStatement.executeQuery();
            
            if (resultSet.next()) {
                response.setContentType("image/jpeg"); // 이미지 형식 지정 (이미지 형식에 따라 변경)
                InputStream imageStream = resultSet.getBinaryStream("image");
                byte[] buffer = new byte[4096];
                int bytesRead = -1;
                
                while ((bytesRead = imageStream.read(buffer)) != -1) {
                    response.getOutputStream().write(buffer, 0, bytesRead);
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            if (conn != null) {
                try {
                    conn.close();
                } catch (SQLException e) {
                    e.printStackTrace();
                }
            }
        }
    }
}
