package blog;

import static com.googlecode.objectify.ObjectifyService.ofy;

import java.io.IOException;
import javax.servlet.http.*;

import com.google.appengine.api.users.User;
import com.google.appengine.api.users.UserService;
import com.google.appengine.api.users.UserServiceFactory;
import com.googlecode.objectify.ObjectifyService;
import blog.Subscription;

@SuppressWarnings("serial")
public class UnsubscribeServlet extends HttpServlet {
    
	 public void doPost(HttpServletRequest req, HttpServletResponse resp) throws IOException {
	     //UserService userService = UserServiceFactory.getUserService();
	     //User user = userService.getCurrentUser();
	
	    
	     String email_address = req.getParameter("Email Address");
	    
	     blog.Subscription.removeEmail(email_address);
	
	     resp.sendRedirect("/Blog.jsp");
 }
}
