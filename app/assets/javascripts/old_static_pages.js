// $(document).ready(function(){

//   handler = Gmaps.build('Google');
//   handler.buildMap({
//       provider: {
//         disableDefaultUI: true
//         // pass in other Google Maps API options here
//       },
//       internal: {
//         id: 'map'
//       }
//     },
//     function(){
//       markers = handler.addMarkers([
//         {
//           "lat": 22.275590,
//           "lng": 114.143910,
//           "picture": {
//             "url": "https://addons.cdn.mozilla.net/img/uploads/addon_icons/13/13028-64.png",
//             "width":  50,
//             "height": 50
//           },
//           "infowindow": "hello!"
//         }
//       ]);
//       handler.bounds.extendWith(markers);
//       handler.fitMapToBounds();
//     }
//   );

//   var styles = [
//     {
//       stylers: [
//         { hue: "#00ffe6" }, //color?
//         { saturation: -20 }
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
//     }
//   ];

//   handler.setOptions({styles: styles});
  


// })