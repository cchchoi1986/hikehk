
// $(document).ready(function(){
  
//   var mapOptions;
//   var map;

//   function initialize(){
//     var mapOptions = {
//       center: { 
//         lat: 22.275590, 
//         lng: 114.143910
//       }, 
//       zoom: 15,
//       // mapTypeId: google.maps.MapTypeId.TERRAIN,
//     };

//     var map = new google.maps.Map(document.getElementById('map-canvas'),
//       mapOptions);
  
//   };

//     var styles = [
//     {
//       stylers: [
//         { hue: "#00ffe6" },
//         { saturation: -20 },
//         { lightness: -20 },
//         { gamma: 1.51 }
//       ]
//     },{
//       featureType: "road",
//       elementType: "geometry",
//       stylers: [
//         { lightness: 100 },
//         { visibility: "simplified" }
//       ]
//     },{
//       featureType: "road",
//       elementType: "labels",
//       stylers: [
//         { visibility: "off" }
//       ]
//     },{
//       featureType:"all",
//       elementType:"geometry",
//       stylers:[
//         {gamma:0.82}
//       ]
//     },{
//       featureType:"all",
//       elementType:"geometry.fill",
//       stylers:[
//         {gamma:1.21}
//       ]
//     },{
//       featureType:"all",
//       elementType:"labels",
//       stylers:[
//         {lightness:-60}
//       ]
//     },{
//       featureType:"all",
//       elementType:"labels.text",
//       stylers:[
//         {gamma:5.37}
//       ]
//     },{
//       featureType:"all",
//       elementType:"labels.text.fill",
//       stylers:[
//         {color:"#419d8c"},
//         {lightness:-39}
//       ]
//     },{
//       featureType:"all",
//       elementType:"labels.text.stroke",
//       stylers:[
//         {visibility:"on"},
//         {color:"#ffffff"},
//         {lightness:16}
//       ]
//     },{
//       featureType:"all",
//       elementType:"labels.icon",
//       stylers:[
//         {visibility:"off"}
//         ]
//     },{
//       featureType:"administrative",
//       elementType:"geometry.fill",
//       stylers:[
//         {color:"#fefefe"},
//         {lightness:20}
//       ]
//     },{
//       featureType:"administrative",
//       elementType:"geometry.stroke",
//       stylers:[
//         {color:"#fefefe"},
//         {lightness:17},
//         {weight:1.2}
//       ]
//     },{
//       featureType:"landscape",
//       elementType:"geometry",
//       stylers:[
//         {color:"#f5f5f5"},
//         {lightness:20}
//       ]
//     },{
//       featureType:"landscape.natural",
//       elementType:"geometry.fill",
//       stylers:[
//         {saturation:0}
//       ]
//     },{
//       featureType:"poi",
//       elementType:"geometry",
//         stylers:[
//           {color:"#f5f5f5"},
//           {lightness:21}
//         ]
//     },{
//       featureType:"poi.park",
//       elementType:"geometry",
//       stylers:[
//         {color:"#dedede"},
//         {lightness:21}
//       ]
//     },{
//       featureType:"road.highway",
//       elementType:"geometry.fill",
//       stylers:[
//         {color:"#ffffff"},
//         {lightness:17}
//       ]
//     },{
//       featureType:"road.highway",
//       elementType:"geometry.stroke",
//       stylers:[
//         {color:"#ffffff"},
//         {lightness:29},
//         {weight:0.2}
//       ]
//     },{
//       featureType:"road.arterial",
//       elementType:"geometry",
//       stylers:[
//         {color:"#ffffff"},
//         {lightness:18}
//       ]
//     },{
//       featureType:"road.local",
//       elementType:"geometry",
//       stylers:[
//         {color:"#ffffff"},
//         {lightness:16}
//       ]
//     },{
//       featureType:"transit",
//       elementType:"geometry",
//       stylers:[
//         {color:"#f2f2f2"},
//         {lightness:19}
//       ]
//     },{
//       featureType:"water",
//       elementType:"geometry",
//       stylers:[
//         {color:"#e9e9e9"},
//         {lightness:17}
//       ]
//     },{
//       featureType:"water",
//       elementType:"geometry.fill",
//       stylers:[
//         {color:"#42738d"},
//         {gamma:5.37}
//       ]
//     }
//     ];
//     map.setOptions({styles: styles});

//   google.maps.event.addDomListener(window, 'load', initialize);

//     // function initialize() {
//   //   var mapOptions = {
//   //     center: {lat: 22.241165, lng: 114.241569},
//   //     zoom: 15,
//   //     mapTypeId: google.maps.MapTypeId.TERRAIN
//   //   };
//   //   map = new google.maps.Map(document.getElementById('map-canvas'), mapOptions);

//   //   for (var i = 0; i < trails.length; i++) {
//   //     marker = new google.maps.Marker({
//   //       position: new google.maps.LatLng(trails[i].latitude,trails[i].longitude),
//   //       map: map,
//   //       title: trails[i].name,
//   //       animation: google.maps.Animation.DROP,
//   //       // position: parliament,
//   //     });
//   //   }
//   //   google.maps.event.addListener(marker, 'click', toggleBounce);
//   // }

//   // function toggleBounce() {
//   //   if (marker.getAnimation() != null) {
//   //     marker.setAnimation(null);
//   //   } else {
//   //     marker.setAnimation(google.maps.Animation.BOUNCE);
//   //   }
//   // }


//   //   google.maps.event.addDomListener(window, 'load', initialize);
//   // })

// });

