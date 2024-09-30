package weather;
import java.io.*;
import java.net.URL;
import java.net.URLConnection;

import javax.servlet.*;
import javax.servlet.annotation.*;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.util.*;
import com.google.gson.Gson;
import com.google.gson.JsonObject;

@WebServlet("/wtrserv1")
@SuppressWarnings("serial")
public class WeatherServlet1 extends HttpServlet{

	@SuppressWarnings("deprecation")
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
	
		String city=req.getParameter("city");
		String api="94983e73cbe3123ee33526ac482b40da";
		String url="https://api.openweathermap.org/data/2.5/weather?q="+city+" &appid="+api;
		try {
		//api connectoin
		URL u = new URL(url);
		URLConnection connection = u.openConnection();
		connection.setRequestProperty(api, url);
		//reading data from network
		InputStream stream = connection.getInputStream();
		InputStreamReader isr=new InputStreamReader(stream);
		  
		Scanner sc = new Scanner(isr);
		StringBuilder response= new StringBuilder();
		while(sc.hasNext()) {
			response.append(sc.nextLine());
		}
		sc.close();
		 // Parse the JSON response to extract temperature, date, and humidity
        Gson gson = new Gson();
        Object responseContent;
		JsonObject jsonObject = gson.fromJson(response.toString(), JsonObject.class);
        
		 //Date & Time
        long dateTimestamp = jsonObject.get("dt").getAsLong() * 1000;
        Date date = new Date(dateTimestamp);
        int date2 = date.getDate();
        //Temperature
        double temperatureKelvin = jsonObject.getAsJsonObject("main").get("temp").getAsDouble();
        int temperatureCelsius = (int) (temperatureKelvin - 273.15);
       
        //Humidity
        int humidity = jsonObject.getAsJsonObject("main").get("humidity").getAsInt();
        
        //Wind Speed
        double windSpeed = jsonObject.getAsJsonObject("wind").get("speed").getAsDouble();
        
        //Weather Condition
        String weatherCondition = jsonObject.getAsJsonArray("weather").get(0).getAsJsonObject().get("main").getAsString();
        
        // Set the data as request attributes (for sending to the jsp page)
        req.setAttribute("date", date2);
        req.setAttribute("city", city);
        req.setAttribute("temperature", temperatureCelsius);
        req.setAttribute("weatherCondition", weatherCondition); 
        req.setAttribute("humidity", humidity);    
        req.setAttribute("windSpeed", windSpeed);
        req.setAttribute("weatherData", response.toString());
        
     
        connection.getOutputStream().close();
}
	catch(Exception e) {
    e.printStackTrace();
}
		
		  // Forward the request to the weather.jsp page for rendering
        req.getRequestDispatcher("index.jsp").forward(req, res);
   

}
}
