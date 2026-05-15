package com.Hospital_Management_System.Hospital_Management_System.service;

import com.Hospital_Management_System.Hospital_Management_System.model.Hospital;
import com.google.gson.*;
import org.springframework.stereotype.Service;

import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.URL;
import java.net.URLEncoder;
import java.util.ArrayList;
import java.util.List;

@Service
public class HospitalService {

    public List<Hospital> fetchNearbyHospitals(double lat, double lon) {
        List<Hospital> hospitals = new ArrayList<>();
        double radius = 5000; // in meters

        try {
            String query = "[out:json];" +
                    "node[\"amenity\"=\"hospital\"](around:" + radius + "," + lat + "," + lon + ");out;";
            String urlStr = "https://overpass-api.de/api/interpreter?data=" + URLEncoder.encode(query, "UTF-8");

            URL url = new URL(urlStr);
            HttpURLConnection conn = (HttpURLConnection) url.openConnection();
            conn.setRequestMethod("GET");

            BufferedReader br = new BufferedReader(new InputStreamReader(conn.getInputStream()));
            StringBuilder sb = new StringBuilder();
            String line;
            while ((line = br.readLine()) != null) {
                sb.append(line);
            }
            br.close();

            JsonObject jsonResponse = JsonParser.parseString(sb.toString()).getAsJsonObject();
            JsonArray elements = jsonResponse.getAsJsonArray("elements");

            for (JsonElement element : elements) {
                JsonObject obj = element.getAsJsonObject();
                JsonObject tags = obj.has("tags") ? obj.getAsJsonObject("tags") : null;
                String name = (tags != null && tags.has("name")) ? tags.get("name").getAsString() : "Unknown Hospital";
                double hLat = obj.get("lat").getAsDouble();
                double hLon = obj.get("lon").getAsDouble();
                hospitals.add(new Hospital(name, hLat, hLon));
            }

        } catch (Exception e) {
            e.printStackTrace();
        }

        return hospitals;
    }
}
