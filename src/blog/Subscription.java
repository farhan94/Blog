package blog;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import com.google.appengine.api.users.User;
import com.googlecode.objectify.annotation.Entity;
import com.googlecode.objectify.annotation.Id;

@Entity
abstract public class Subscription {
	public static List<String> email_list = new ArrayList<String>();
    
    Subscription() {}
    public void Subscription(String email) {
        this.email_list.add(email);
    }
    public void Subscription(){}
    public static void removeEmail(String email) {
        email_list.remove(email);
    }
    
    public static void addEmail(String email){
    	email_list.add(email);
    }
}