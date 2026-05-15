<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
    <title>Nearby Hospitals</title>
    <link rel="stylesheet" href="https://unpkg.com/leaflet/dist/leaflet.css" />
    <style>
        #map {
        margin-left:60px;
        border:2px #fff solid;
         height: 600px; width: 90%;
                     border-radius: 10px;
                     box-shadow: 0 4px 10px rgba(0,0,0,0.1);
                     transition: transform 0.3s, box-shadow 0.3s;
          }
           .header-title{
                     text-align: center;
                                font-size: 2rem;
                                font-weight: bold;
                                color: #002874;

                                text-transform: uppercase;
                                background-color: #a7cbf0;
                                padding: 10px;

                                box-shadow: 0 2px 5px rgba(0, 0, 0, 0.1);
                                margin-bottom: 20px;
                     }
    </style>
</head>
<body>
<h2 class="header-title" >Nearby Hospitals</h2>
<div id="map"></div>

<script src="https://unpkg.com/leaflet/dist/leaflet.js"></script>
<script>
    // User location from controller
    var userLat = ${userLat};
    var userLon = ${userLon};

    // Parse hospital JSON from controller
    var hospitals = JSON.parse('<c:out value="${hospitalsJson}" escapeXml="false"/>');

    // Initialize map
    var map = L.map('map').setView([userLat, userLon], 14);

    // OpenStreetMap tiles
    L.tileLayer('https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png', {
        attribution: '&copy; OpenStreetMap contributors'
    }).addTo(map);

    // Custom user icon
    var userIcon = L.icon({
        iconUrl: 'https://cdn-icons-png.flaticon.com/512/149/149071.png',
        iconSize: [40, 40],
        iconAnchor: [20, 40],
        popupAnchor: [0, -35]
    });

    // Add user marker
    L.marker([userLat, userLon], {icon: userIcon})
        .addTo(map)
        .bindPopup("You are here")
        .openPopup();

    // Custom hospital icon
   var hospitalIcon = L.icon({
       iconUrl: '${pageContext.request.contextPath}/Images/user.png', // local icon
       iconSize: [32, 32],        // size of the icon
       iconAnchor: [16, 32],      // point of the icon which corresponds to marker's location
       popupAnchor: [0, -32]      // point from which popup opens relative to the icon
   });

    // Add hospital markers
    hospitals.forEach(function(h) {
        L.marker([h.lat, h.lon], {icon: hospitalIcon})
            .addTo(map)
            .bindPopup("<b>" + h.name + "</b>");
    });
</script>

<br>
</body>
</html>
