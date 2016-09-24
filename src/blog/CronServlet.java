package blog;
import java.io.IOException;
import java.util.Collections;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.http.*;

import com.googlecode.objectify.ObjectifyService;

import googleSendgridJava.Sendgrid;

@SuppressWarnings("serial")
public class CronServlet extends HttpServlet {
public void doGet(HttpServletRequest req, HttpServletResponse resp)
throws IOException {
try {
	ObjectifyService.register(Blog.class);
	// set credentials
	Sendgrid mail = new Sendgrid("krsayani11", "FARHAN123");
	List<Blog> blogs = ObjectifyService.ofy().load().type(Blog.class).list();
	Collections.sort(blogs);
	String recent_posts = "";
	int numP = 0;
	int d = 24*60*60*1000;
	for(int i = 0; i < blogs.size(); i++){		
		if(blogs.get(i).getDate().getTime() > System.currentTimeMillis() - d){
			numP++;
			recent_posts = recent_posts + blogs.get(i).getCompleteBlogAsString();
			recent_posts = recent_posts + "<br>";
		}
	}
	if(numP != 0){
	// set email data
		for(int index = 0; index < Subscription.email_list.size(); index++){
			mail.setTo(Subscription.email_list.get(index)).setFrom("noreply@TheBlog.com").setSubject("Posts from within 24 hours").setText("").setHtml(recent_posts);
			mail.send();
		}
	}
}
catch (Exception ex) {
//Log any exceptions in your Cron Job
}
}
@Override
public void doPost(HttpServletRequest req, HttpServletResponse resp)
throws ServletException, IOException {
doGet(req, resp);
}
}