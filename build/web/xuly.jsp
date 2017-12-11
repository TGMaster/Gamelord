 <%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" errorPage="loi.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
 
<%@page import="java.sql.ResultSet"%>
<%@page import="db.XuLyDB"%>
<%@page import="spc.Giohang"%>
<%@page import="java.util.ArrayList"%>
<%@page import="spc.MonHang"%>
<%@page import="db.SanPham"%>
<%
        Giohang cart=(Giohang)session.getAttribute("gio");
     
        if(request.getParameter("mua")!=null){
            String mssp=request.getParameter("ms");
            int soluong=Integer.parseInt(request.getParameter("sl"));
            if(cart==null)
                cart=new Giohang();
            XuLyDB db=new XuLyDB();
            SanPham sp=db.getSanPham(mssp);//l;ay 1 sp
            MonHang mh=new MonHang(sp.getMsSP(),soluong,sp.getDongia());
            //them vào giỏ
            cart.ThemHang(mh);
             
            session.setAttribute("gio",cart);
             
            response.sendRedirect("shopping.jsp");
        }
        else if(request.getParameter("in")!=null){
            response.sendRedirect("hoadon.jsp");    
        }
    %>