package cs157a;

import java.sql.Connection;
import java.sql.SQLException;
import java.util.Arrays;
import java.util.List;

import org.junit.jupiter.api.Test;

class DbUtilsTest {

	@Test
	void testDisplayTables() {
		System.out.println("\n---------testDisplayTables----------");
		Connection conn = DbUtils.getConnection("/Users/Chicken/CS157A/e_vendor_data_test.properties");
		System.out.println(Utils.printHtmlTable(conn, "user"));
		System.out.println(Utils.printHtmlTable(conn, "admin"));
		System.out.println(Utils.printHtmlTable(conn, "buys"));
		System.out.println(Utils.printHtmlTable(conn, "seller"));
		System.out.println(Utils.printHtmlTable(conn, "post"));
		System.out.println(Utils.printHtmlTable(conn, "postings"));
        DbUtils.close(conn);
	}

}
