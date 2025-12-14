<%@ page import="java.sql.*" %>
<%
    String query = request.getParameter("search");
    StringBuilder outData = new StringBuilder();
    try {
        Class.forName("org.postgresql.Driver");
        // SRE Tip: Using internal Kubernetes DNS to find the DB
        String url = "jdbc:postgresql://my-db-postgresql.devops-lab.svc.cluster.local:5432/student_db";
        Connection conn = DriverManager.getConnection(url, "postgres", "devops_password");
        
        PreparedStatement st = conn.prepareStatement("SELECT * FROM products WHERE name ILIKE ?");
        st.setString(1, "%" + (query != null ? query : "") + "%");
        ResultSet rs = st.executeQuery();
        
        while(rs.next()) {
            outData.append("<div style='padding:10px; border-bottom:1px solid #eee;'>");
            outData.append("<strong>" + rs.getString("name") + "</strong> - ");
            outData.append("<span style='color:green;'>$" + rs.getString("price") + "</span>");
            outData.append(" (Stock: " + rs.getString("stock") + ")");
            outData.append("</div>");
        }
        conn.close();
    } catch (Exception e) { outData.append("<p style='color:red;'>SRE Error: " + e.getMessage() + "</p>"); }
%>
<%= outData.toString() %>