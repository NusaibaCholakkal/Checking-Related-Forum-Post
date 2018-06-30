import java.awt.image.BufferedImage;
import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;
import java.util.regex.Matcher;
import java.util.regex.Pattern;
import javax.imageio.ImageIO;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.FileItemFactory;
import org.apache.commons.fileupload.FileUploadException;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;

/**
 * Servlet implementation class for Servlet: UploadAction
 *
 */
 public class forum extends javax.servlet.http.HttpServlet implements javax.servlet.Servlet {
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

	
	      
        List<String> ms = new ArrayList<String>();
        String finalimage = "";
        boolean isMultipart = ServletFileUpload.isMultipartContent(
                request);
        List<String> m = new ArrayList<String>();
        File savedFile;
        // System.out.println("requestss//: "+request);
        if (!isMultipart) {
            System.out.println("File Not Uploaded");
        } else {
            FileItemFactory factory = new DiskFileItemFactory();
            ServletFileUpload upload = new ServletFileUpload(factory);
            List items = null;

            try {
                items = upload.parseRequest(request);
                //System.out.println("items: "+items);
            } catch (FileUploadException e) {
                e.printStackTrace();
            }
            Iterator itr = items.iterator();
            while (itr.hasNext()) {
                List<String> al = new ArrayList<String>();

                String sss = "";
                FileItem item = (FileItem) itr.next();
                String value = "";
                String a[];
                if (item.isFormField()) {
                    String name = item.getFieldName();
                    //System.out.println("name: "+name+'\n');
                    value = item.getString();
                    // System.out.println("value: "+value);
                    al.add(value);
                    for (int i = 0; i < al.size(); i++) {
                        sss += al.get(i);
                        System.out.println("is thios image" + sss);

     //System.out.println("the value sixcwe"+m.size());
                    }

                    a = sss.split("-");
                    for (int i = 0; i < a.length; i++) {

                        String am = a[i];
                        System.out.println("aaaaaaaaaaaaaaaa" + a[i]);
                        m.add(a[i]);
                    }
                } else {

                    String itemName = item.getName();

                    String reg = "[.*]";
                    String replacingtext = "";
                    // System.out.println("Text before replacing is:-" + itemName);
                    Pattern pattern = Pattern.compile(reg);
                    Matcher matcher = pattern.matcher(itemName);
                    StringBuffer buffer = new StringBuffer();

                    while (matcher.find()) {
                        matcher.appendReplacement(buffer, replacingtext);
                    }
                    int IndexOf = itemName.indexOf(".");
                    int Indexf = itemName.indexOf(".");
                    String domainName = itemName.substring(IndexOf);
                    finalimage = buffer.toString() + domainName;
                    System.out.println("Final Image===" + finalimage);
                    ms.add(finalimage);
                    ServletContext sc=request.getSession().getServletContext();
                    savedFile = new File(sc.getRealPath("forum")+"/" + finalimage);
                    try {
						item.write(savedFile);
					} catch (Exception e) {
						// TODO Auto-generated catch block
                                                                                                                                                                            					e.printStackTrace();
					}

                }
            }
        }
        PrintWriter out=response.getWriter();       
	try {				
        Class.forName("com.mysql.jdbc.Driver");
	Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/relatedforum", "root", "root");
        String a="insert into forum (uname,fname,cate,des,img) values ('"+m.get(1)+"','"+m.get(0)+"','"+m.get(2)+"','"+m.get(3)+"','"+ms.get(0)+"') ";
        PreparedStatement pss = con.prepareStatement(a);        
        pss.executeUpdate();
        out.println("<script>"
				+"alert(' Added Successfully')"
				+"</script>");
        RequestDispatcher rd = request.getRequestDispatcher("user.jsp");
                rd.include(request, response); 
            }
	catch(Exception e)
        {
            System.out.println(e);
            out.println("<script>"
				+"alert(' Not Posted... ')"
				+"</script>");
             RequestDispatcher rd = request.getRequestDispatcher("user.jsp");
                rd.include(request, response); 
        }
    }



public String getServletInfo() {
    return "Short description";
}// </editor-fold>

}

