
using System;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Xml.Linq;

/// <summary>
/// Summary description for Helper
/// </summary>
/// 


public class Helper
{     
	public static SqlConnection ConnectToDb(string fileName)
    {
        string path = HttpContext.Current.Server.MapPath("App_Data/") + fileName;
       
        
		//string connString = @"Data Source=(LocalDB)\MSSQLLocalDB;AttachDbFilename=" + path + ";Integrated Security=True;Connect Timeout=30";
		string connString = @"Data Source=(LocalDB)\MSSQLLocalDB;AttachDbFilename=|DataDirectory|\EliranDataBase.mdf;Integrated Security=True;Connect Timeout=30";
        
		SqlConnection conn = new SqlConnection(connString);
            return conn;
	}

	public static bool DoQuery(string fileName, string sql)
	{
		SqlConnection conn = ConnectToDb(fileName);
		conn.Open();
		SqlCommand com = new SqlCommand(sql, conn);
		int num = com.ExecuteNonQuery();
		conn.Close();
		return num > 0;
	}



	public static bool IsExist(string fileName, string sql)
	{

		SqlConnection conn = ConnectToDb(fileName);
		conn.Open();
		SqlCommand com = new SqlCommand(sql, conn);
		SqlDataReader data = com.ExecuteReader();

		bool found = Convert.ToBoolean(data.Read());
		conn.Close();
		return found;

	}

	public static DataTable ExecuteDataTable(string fileName, string sql)
	{
		SqlConnection conn = ConnectToDb(fileName);
		conn.Open();

		DataTable dt = new DataTable();

		SqlDataAdapter tableAdapter = new SqlDataAdapter(sql, conn);

		tableAdapter.Fill(dt);

			conn.Close();
		return dt;
	}

}



