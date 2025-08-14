package DAO;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

import DButil.DBUtil;
import POJO.Subject;


public class SubjectDAO {

    public void addSubject(Subject subject) throws Exception {
        Connection conn = DBUtil.getConnection();
        String sql = "INSERT INTO subject (name) VALUES (?)";
        PreparedStatement ps = conn.prepareStatement(sql);
        ps.setString(1, subject.getName());
        ps.executeUpdate();
        ps.close();
        conn.close();
    }

    public List<Subject> getAllSubjects() throws Exception {
        List<Subject> list = new ArrayList<>();
        Connection conn = DBUtil.getConnection();
        String sql = "SELECT * FROM subject";
        Statement stmt = conn.createStatement();
        ResultSet rs = stmt.executeQuery(sql);
        while (rs.next()) {
            Subject s = new Subject();
            s.setId(rs.getInt("id"));
            s.setName(rs.getString("name"));
            list.add(s);
        }
        rs.close();
        stmt.close();
        conn.close();
        return list;
    }
}
