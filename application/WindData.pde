import org.apache.http.HttpEntity;
import org.apache.http.HttpResponse;
import org.apache.http.client.methods.HttpPut;
import org.apache.http.impl.client.DefaultHttpClient;

class WindData {
  String windDataUrl;

  WindData(String _windDataUrl) {
    windDataUrl = _windDataUrl;
  }

  void sendData (String command) {                                          // sends JSON commands via PUT request
    try
    {
      HttpPut httpPut = new HttpPut( windDataUrl );                               // set HTTP put address to light being accessed
      DefaultHttpClient httpClient = new DefaultHttpClient();

      httpPut.addHeader("Accept", "application/json");                  // tell everyone we are talking JSON
      httpPut.addHeader("Content-Type", "application/json");

      StringEntity entity = new StringEntity(command, "UTF-8");         // pull in the command set already in JSON
      entity.setContentType("application/json");
      httpPut.setEntity(entity); 

      HttpResponse response = httpClient.execute( httpPut );            // check to make sure it went well
      println( response.getStatusLine());

      //      httpClient.getConnectionManager().shutdown();
    } 
    catch( Exception e ) { 
      e.printStackTrace();
    }
  }

  void getData()
  {
    JSONObject wind = loadJSONObject( windDataUrl);   //// Substring aanpassen aan url

      println(wind); 

    float speed = wind.getFloat("speed"); // Load speed
    println("Speed is: " + speed);

    // Load angle
    float angle = wind.getFloat("angle");
    println("angle: " + angle);
  }

  float getSpeed()
  {
    JSONObject wind = loadJSONObject( windDataUrl);   //// Substring aanpassen aan url
    float speed = wind.getFloat("speed"); // Load speed
    return speed;
  }


  float getAngle()
  {
    JSONObject wind = loadJSONObject( windDataUrl);   //// Substring aanpassen aan url
    // Load angle
    float angle = wind.getFloat("angle");
    float speed = wind.getFloat("speed"); // Load speed

    return angle;
  }
}


