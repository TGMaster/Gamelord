package org.apache.jsp;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;
import java.sql.ResultSet;
import db.XuLyDB;
import spc.Giohang;
import java.util.ArrayList;
import spc.MonHang;
import db.SanPham;

public final class shopping_jsp extends org.apache.jasper.runtime.HttpJspBase
    implements org.apache.jasper.runtime.JspSourceDependent {

  private static final JspFactory _jspxFactory = JspFactory.getDefaultFactory();

  private static java.util.List<String> _jspx_dependants;

  private org.glassfish.jsp.api.ResourceInjector _jspx_resourceInjector;

  public java.util.List<String> getDependants() {
    return _jspx_dependants;
  }

  public void _jspService(HttpServletRequest request, HttpServletResponse response)
        throws java.io.IOException, ServletException {

    PageContext pageContext = null;
    HttpSession session = null;
    ServletContext application = null;
    ServletConfig config = null;
    JspWriter out = null;
    Object page = this;
    JspWriter _jspx_out = null;
    PageContext _jspx_page_context = null;

    try {
      response.setContentType("text/html; charset=UTF-8");
      pageContext = _jspxFactory.getPageContext(this, request, response,
      			null, true, 8192, true);
      _jspx_page_context = pageContext;
      application = pageContext.getServletContext();
      config = pageContext.getServletConfig();
      session = pageContext.getSession();
      out = pageContext.getOut();
      _jspx_out = out;
      _jspx_resourceInjector = (org.glassfish.jsp.api.ResourceInjector) application.getAttribute("com.sun.appserv.jsp.resource.injector");

      out.write("\n");
      out.write("<!DOCTYPE html PUBLIC \"-//W3C//DTD HTML 4.01 Transitional//EN\" \"http://www.w3.org/TR/html4/loose.dtd\">\n");
      out.write(" \n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("<html>\n");
      out.write("<head>\n");
      out.write("<meta http-equiv=\"Content-Type\" content=\"text/html; charset=UTF-8\">\n");
      out.write("<title>Mua hàng qua mạng</title>\n");
      out.write("</head>\n");
      out.write("<body>\n");
      out.write("    <form action=\"xuly.jsp\" method=\"post\">\n");
      out.write("        Chọn sản phẩm:<select name=\"ms\">\n");
      out.write("        ");

            XuLyDB db=new XuLyDB();
            ResultSet rs = db.getAllProducts();
            while(rs.next()){
                
      out.write("\n");
      out.write("                    <option label='");
      out.print(rs.getString("tensp") );
      out.write("' \n");
      out.write("                        value='");
      out.print(rs.getString("mssp") );
      out.write("'>\n");
      out.write("                ");

            }
        
      out.write("\n");
      out.write("        </select>\n");
      out.write("        Số lượng:<input type=\"text\" name=\"sl\"/>\n");
      out.write("        <input type=\"submit\" value=\"Mua Hàng\" name=\"mua\"/>\n");
      out.write("        <input type=\"submit\" value=\"In Hóa đơn\" name=\"in\"/>   \n");
      out.write("        <hr/>\n");
      out.write("        <h1>CHI TIẾT GIỎ HÀNG</h1>\n");
      out.write("        <table border=\"1\" width=\"70%\">\n");
      out.write("            <tr><th>MSSP</th>\n");
      out.write("            <th>Ten san Phẩm</th>\n");
      out.write("            <th>Số lượng</th>\n");
      out.write("                <th>Đơn giá</th></tr>\n");
      out.write("            ");

                Giohang cart=(Giohang)session.getAttribute("gio"); 
                if(cart!=null){
                    ArrayList<MonHang> ds=cart.getGH();
                    for(MonHang mh:ds){
                        SanPham sp=db.getSanPham(mh.getMsMH());
                        
      out.write("\n");
      out.write("                            <tr>\n");
      out.write("                                <td>");
      out.print( mh.getMsMH());
      out.write("</td>\n");
      out.write("                                <td>");
      out.print( sp.getTenSP());
      out.write("</td>\n");
      out.write("                                <td>");
      out.print( mh.getSoluong());
      out.write("</td>\n");
      out.write("                                <td>");
      out.print( mh.getDongia());
      out.write("</td>\n");
      out.write("                            </tr>\n");
      out.write("                        ");

                    }
            
      out.write("\n");
      out.write("        </table>\n");
      out.write("        <h2 align=\"right\">Tổng tiền:");
      out.print(cart.Tongtien() );
      out.write("</h2>\n");
      out.write("        ");
} 
      out.write("\n");
      out.write("    </form>\n");
      out.write("</body>\n");
      out.write("</html>");
    } catch (Throwable t) {
      if (!(t instanceof SkipPageException)){
        out = _jspx_out;
        if (out != null && out.getBufferSize() != 0)
          out.clearBuffer();
        if (_jspx_page_context != null) _jspx_page_context.handlePageException(t);
        else throw new ServletException(t);
      }
    } finally {
      _jspxFactory.releasePageContext(_jspx_page_context);
    }
  }
}
