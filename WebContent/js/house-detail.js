let map = L.map('mapid',{
    center:[25.04828, 121.51435],
    zoom:17
});

L.tileLayer('https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png',{
    attribution: '© OpenStreetMap'
}).addTo(map);

let marker = L.marker([25.04828, 121.51435]).addTo(map);


$( function() {
  $( "#datepicker" ).datepicker({
    showOn: "button",
    buttonImage: "images/calendar.gif",
    buttonImageOnly: true,
    buttonText: "Select date"
  });
} );
