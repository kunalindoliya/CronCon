package croncon.operation;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Time;

import croncon.bean.CompanyBean;
import croncon.bean.FeedBean;
import croncon.db.Dbconnection;

public class Company {

	static Connection con=null;
    static java.sql.PreparedStatement stmt=null;
    static ResultSet rs=null;
	 public static int addCompany(CompanyBean company, FeedBean feed) throws SQLException{
		   int i=0;
		   //company data
		   String name=company.getName();
		   String contact=company.getContact();
		   String website=company.getWebsite();
		   //feed data
		   String user=feed.getName();
		   String day=feed.getDay();
		   Time time=feed.getTime();
		   String status=feed.getStatus();
		   
		   try {
			   con=Dbconnection.getCon();
			   java.sql.Statement stmt1=con.createStatement();
			   String query1="insert into company(name,contact,website) values('"+name+"','"+contact+"','"+website+"')";
			   String query2 ="insert into feed(name,time,day,status) values('"+user+"','"+time+"','"+day+"','"+status+"')";
			   con.setAutoCommit(false);      
			      stmt1.addBatch(query1);
			      stmt1.addBatch(query2);
			      stmt1.executeBatch();
			      con.commit();
			      i=1;
		   }catch(Exception e) {
			   e.printStackTrace();
			   con.close();
		   }
		   return i;
	   }
	   public  ResultSet displayCompany() throws SQLException
		  {  stmt=null;
			  try {
				  con = Dbconnection.getCon();
				  stmt=con.prepareStatement("select * from company order by id desc");
				  rs=stmt.executeQuery();
			  }
			  catch(Exception e)
			  {
				  e.printStackTrace();
			  }
			return rs;
		  }
	   public static int removeCompany(String str[]) throws SQLException{
		    int i=0;
		    stmt=null;
		    try {
		    	con=Dbconnection.getCon();
		    	for(int j=0;j<str.length;j++)
		    	{
		    		stmt=con.prepareStatement("delete from company where id=?");
		    		stmt.setString(1, str[j]);
		    		i=stmt.executeUpdate();
		    	}
		    }catch(Exception e) {
		    	e.printStackTrace();
		    	con.close();
		    }
		    return i;
	   }
}
