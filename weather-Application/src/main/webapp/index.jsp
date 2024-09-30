<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Weather App - CodingWallahSir</title>
     <link rel="stylesheet" href="style.css" />
     <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css" />
</head>

<style>
    * {
  margin: 0;
  padding: 0;
  box-sizing: border-box;
  font-family: "Ubuntu", sans-serif;
}

body {
  display: flex;
  height: 100vh;
  align-items: center;
  justify-content: center;
  background: linear-gradient(to right,  #2b40ff,#07121a);
}

.mainContainer {
  width: 25rem;
  height: auto;
  border-radius: 1rem;
  background: #fff;
  box-shadow: 0 14px 28px rgba(0,0,0,0.25), 
			0 10px 10px rgba(0,0,0,0.22);
}

.searchInput {
  width: 100%;
  display: flex;
  padding: 1rem 1rem;
  justify-content: center;
}

.searchInput input {
  width: 100%;
  height: 2rem;
  outline: none;
  font-size: 1rem;
  color: #525050;
  padding: 0.2rem 0.5rem;
  border-radius: 1.5rem;
  border: 1px solid #b3b3b3;
}

.searchInput input:focus {
  border: 1px solid #9c9dde;
}

.searchInput button {
  width: 2.2rem;
  height: 2rem;
  cursor: pointer;
  color: #9b9b9b;
  border-radius: 50%;
  margin-left: 0.4rem;
  transition: all 0.3s ease;
  background-color: #fff;
  border: 1px solid #b3b3b3;
}

.searchInput button:hover {
  color: #fff;
  background-color: #9c9dde;
  border: 1px solid #9c9dde;
}

.weatherIcon {
  display: flex;
  padding-top: 0.5rem;
  padding-bottom: 0.5rem;
  justify-content: center;
}

.weatherIcon img {
  max-width: 100%;
  width: 8rem;
}

.weatherDetails .temp{
 font-size: 2rem;
}
.cityDetails {
  color: #323232;
  font-size: 2.5rem;
  text-align: center;
  margin-bottom: 0.5rem;
}

.cityDetails .date {
  color: #323232;
  font-size: 1.5rem;
  text-align: center;
  margin-bottom: 0.5rem;
}

.windDetails {
  display: flex;
  margin-top: 1rem;
  margin-bottom: 1.5rem;
  justify-content: space-around;
}

.windDetails .humidityBox {
  display: flex;
  font-size: 1rem;
  color: #323232;
}

.windDetails .humidity .humidityValue {
 text-align: center;
  font-size: 2rem;
  color: #323232;
}

.windDetails .humidityBox img {
  max-height: 3rem;
  margin-right: 0.5rem;
}

.windDetails .windSpeed {
  display: flex;
  font-size: 1rem;
  color: #323232;
}

.windDetails .windSpeed img {
  max-height: 3rem;
  margin-right: 0.5rem;
}


image-logo{
        height: auto;
        width: auto;
        filter: drop-shadow(20px 10px 10px black);
      }
</style>

<body>
     
 <%-- Retrieve weather data from request attributes --%>
    <% 
        // Initialize variables with default values
        String city = "";
        int temperature = 0;
        String weatherCondition = "";
        int humidity = 0;
        double windSpeed = 0.0;
        String weatherData = "";

        // Check if attributes are present and set them accordingly
        if (request.getAttribute("city") != null) {
            city = (String) request.getAttribute("city");
        }
        if (request.getAttribute("temperature") != null) {
            temperature = (int) request.getAttribute("temperature");
        }
        if (request.getAttribute("weatherCondition") != null) {
            weatherCondition = (String) request.getAttribute("weatherCondition");
        }
        if (request.getAttribute("humidity") != null) {
            humidity = (int) request.getAttribute("humidity");
        }
        if (request.getAttribute("windSpeed") != null) {
            windSpeed = (double) request.getAttribute("windSpeed");
        }
        if (request.getAttribute("weatherData") != null) {
            weatherData = (String) request.getAttribute("weatherData");
        }
    %>

    <h3>City: <%= city %></h3><br>
    <h3>Temperature: <%= temperature %>°C</h3><br>
    <h3>Weather Condition: <%= weatherCondition %></h3><br>
    <h3>Humidity: <%= humidity %>%</h3><br>
    <h3>Wind Speed: <%= windSpeed %> m/s</h3><br>
    <h3>Additional Weather Data: <%= weatherData %></h3>><br>

</body>

</html>