package myKarateTest.utils;

import com.google.gson.JsonObject;
import com.google.gson.JsonParser;

public class JavaDemo {
	
	public String fetchName (String jsonResponse) {
		
//		System.out.println(jsonResponse);
		
		JsonObject jsonObject = JsonParser.parseString(jsonResponse)
			    .getAsJsonObject();
		
		String name = jsonObject.get("name").getAsString();
		
		return name + " Jaiswal";
	}

}
