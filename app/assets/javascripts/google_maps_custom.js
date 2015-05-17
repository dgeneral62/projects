/**
 * Created by dgeneral62 on 5/17/15.
 */

function gmap_show(gamer) {
    if ((gamer.lat == null) || (gamer.lng == null) ) {    // validation check if coordinates are there
        return 0;
    }

    handler = Gmaps.build('Google');    // map init
    handler.buildMap({ provider: {}, internal: {id: 'map'}}, function(){
        markers = handler.addMarkers([    // put marker method
            {
                "lat": gamer.lat,    // coordinates from parameter gamer
                "lng": gamer.lng,
                "picture": {    // setup marker icon
                    "url": 'http://www.planet-action.org/img/2009/interieur/icons/orange-dot.png',
                    "width":  32,
                    "height": 32
                },
                "infowindow": "<b>" + gamer.name + "</b> " + gamer.address + ", " + gamer.postal_code + " " + gamer.city
            }
        ]);
        handler.bounds.extendWith(markers);
        handler.fitMapToBounds();
        handler.getMap().setZoom(12);    // set the default zoom of the map
    });
}

function gmap_form(gamer) {
    handler = Gmaps.build('Google');    // map init
    handler.buildMap({ provider: {}, internal: {id: 'map'}}, function(){
        if (gamer && gamer.lat && gamer.lng) {    // statement check - new or edit view
            markers = handler.addMarkers([    // print existent marker
                {
                    "lat": gamer.lat,
                    "lng": gamer.lng,
                    "picture": {
                        "url": 'http://www.planet-action.org/img/2009/interieur/icons/orange-dot.png',
                        "width":  32,
                        "height": 32
                    },
                    "infowindow": "<b>" + gamer.name + "</b> " + gamer.address + ", " + gamer.postal_code + " " + gamer.city
                }
            ]);
            handler.bounds.extendWith(markers);
            handler.fitMapToBounds();
            handler.getMap().setZoom(12);
        }
        else {    // show the empty map
            handler.fitMapToBounds();
            handler.map.centerOn([52.10, 19.30]);
            handler.getMap().setZoom(6);
        }
    });

    var markerOnMap;

    function placeMarker(location) {    // simply method for put new marker on map
        if (markerOnMap) {
            markerOnMap.setPosition(location);
        }
        else {
            markerOnMap = new google.maps.Marker({
                position: location,
                map: handler.getMap()
            });
        }
    }

    google.maps.event.addListener(handler.getMap(), 'click', function(event) {    // event for click-put marker on map and pass coordinates to hidden fields in form
        placeMarker(event.latLng);
        document.getElementById("map_lat").value = event.latLng.lat();
        document.getElementById("map_lng").value = event.latLng.lng();
    });
}