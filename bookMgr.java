package library;

import java.io.File;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.Vector;

import javax.servlet.http.HttpServletRequest;

import library.BookBean;
import library.DBConnectionMgr;

public class bookMgr {
	
	private DBConnectionMgr pool;

	public bookMgr() {
		try {
			pool = DBConnectionMgr.getInstance();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	public Vector<BookBean> getAllList() {
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = null;
		Vector<BookBean> vlist = new Vector<BookBean>();
		try {
			con = pool.getConnection();
			sql = "select * from book order by num desc";
			pstmt = con.prepareStatement(sql);
			rs = pstmt.executeQuery();
			while (rs.next()) {
				BookBean plBean = new BookBean();
				plBean.setNum(rs.getInt("num"));
				plBean.setTitle(rs.getString("title"));
				plBean.setPrice(rs.getInt("price"));
				plBean.setPublisher(rs.getString("publisher"));
				plBean.setAuthor(rs.getString("author"));
				vlist.add(plBean);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			pool.freeConnection(con, pstmt, rs);
		}
		return vlist;
	}

	public void insertBoard(HttpServletRequest req) {
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = null;
		
		try {
			con = pool.getConnection();

			sql = "insert book ";
			sql += "values(null, ?, ?, ?, ?)";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, req.getParameter("title"));
			pstmt.setString(2, req.getParameter("price"));
			pstmt.setString(3, req.getParameter("publisher"));
			pstmt.setString(4, req.getParameter("author"));
			pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			pool.freeConnection(con, pstmt, rs);
		}
	}

	public void updateBoard(HttpServletRequest req) {
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = null;
		
		try {
			con = pool.getConnection();

			sql = "update book ";
			sql += "set title=?, price=?, publisher=?, author=? where num=?";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, req.getParameter("title"));
			pstmt.setInt(2, Integer.parseInt(req.getParameter("price")));
			pstmt.setString(3, req.getParameter("publisher"));
			pstmt.setString(4, req.getParameter("author"));
			pstmt.setInt(5, Integer.parseInt(req.getParameter("num")));
			pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			pool.freeConnection(con, pstmt, rs);
		}
	}

	public void deleteBoard(HttpServletRequest req) {
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = null;
		String num = req.getParameter("num");
		
		try {
			con = pool.getConnection();

			sql = "delete from book where num=?";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, num);
			pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			pool.freeConnection(con, pstmt, rs);
		}
	}

	public BookBean getBoard(int num) {
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = null;
		BookBean bean = new BookBean();
		try {
			con = pool.getConnection();
			sql = "select * from book where num=?";
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, num);
			rs = pstmt.executeQuery();
			if (rs.next()) {
				bean.setNum(rs.getInt("num"));
				bean.setTitle(rs.getString("title"));
				bean.setPrice(rs.getInt("price"));
				bean.setPublisher(rs.getString("publisher"));
				bean.setAuthor(rs.getString("author"));
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			pool.freeConnection(con, pstmt, rs);
		}
		return bean;
	}
}
