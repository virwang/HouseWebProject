let map = L.map('mapid',{
    center:[25.0462237096147, 121.517455589434],
    zoom:15
});

L.tileLayer('https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png',{
    attribution: '© <a href="https://www.openstreetmap.org/copyright">OpenStreetMap</a> contributors'
}).addTo(map);

//let marker = L.marker(['${housedt.lat}', '${housedt.lon}]).addTo(map);

//捷運文湖線站點
// let BR01 = L.marker([24.998282,121.57981]).addTo(map);
// let BR02 = L.marker([24.998189,121.573418]).addTo(map);
// let BR03 = L.marker([24.998664,121.568307]).addTo(map);
// let BR04 = L.marker([24.999349,121.557849]).addTo(map);
// let BR05 = L.marker([25.00508,121.556875]).addTo(map);
// let BR06 = L.marker([25.018343,121.558392]).addTo(map);
// let BR07 = L.marker([25.023746,121.552814]).addTo(map);
// let BR08 = L.marker([25.026109,121.543613]).addTo(map);
// let BR09 = L.marker([25.033134,121.543973]).addTo(map);
// let BR10 = L.marker([25.041492,121.543326]).addTo(map);
// let BR11 = L.marker([25.052028,121.544295]).addTo(map);
// let BR12 = L.marker([25.060776,121.543942]).addTo(map);
// let BR13 = L.marker([25.063194,121.551946]).addTo(map);
// let BR14 = L.marker([25.079576,121.546619]).addTo(map);
// let BR15 = L.marker([25.084129,121.55395]).addTo(map);
// let BR16 = L.marker([25.082017,121.567304]).addTo(map);
// let BR17 = L.marker([25.080153,121.575516]).addTo(map);
// let BR18 = L.marker([25.078329,121.584616]).addTo(map);
// let BR19 = L.marker([25.083787,121.594238]).addTo(map);
// let BR20 = L.marker([25.08338,121.602626]).addTo(map);
// let BR21 = L.marker([25.072577,121.607114]).addTo(map);
// let BR22 = L.marker([25.067167,121.611604]).addTo(map);
// let BR23 = L.marker([25.060047,121.616061]).addTo(map);
// let BR24 = L.marker([25.055351,121.617613]).addTo(map);

// marker.bindPopup("<b>內湖五期遠雄紐約全新小豪宅</b><br>台北市內湖區新豐街").openPopup();

//捷運文湖線
let BRLines = [{
    "type": "LineString",
    "coordinates": [
    [121.57981,24.998282],
    [121.573418,24.998189],
    [121.568307,24.998664],
    [121.557849,24.999349],
    [121.556875,25.00508],
    [121.558392,25.018343],
    [121.552814,25.023746],
    [121.543613,25.026109],
    [121.543973,25.033134],
    [121.543326,25.041492],
    [121.544295,25.052028],
    [121.543942,25.060776],
    [121.551946,25.063194],
    [121.546619,25.079576],
    [121.55395,25.084129],
    [121.567304,25.082017],
    [121.575516,25.080153],
    [121.584616,25.078329],
    [121.594238,25.083787],
    [121.602626,25.08338],
    [121.607114,25.072577],
    [121.611604,25.067167],
    [121.616061,25.060047],
    [121.617613,25.055351],
    ]
}];
var BRStyle = {
    "color": "#9F5000",
    "weight": 5,
    "opacity": 0.65
};
L.geoJSON(BRLines, {
    style: BRStyle
}).addTo(map);

//捷運淡水信義線
let RLines = [{
    "type": "LineString",
    "coordinates": [
    [121.57,25.032464],
    [121.563709,25.032704],
    [121.551996,25.033037],
    [121.542337,25.033207],
    [121.536566,25.033252],
    [121.529439,25.033693],
    [121.518085,25.032578],
    [121.515793,25.040942],
    [121.517665,25.047068],
    [121.520266,25.052442],
    [121.52055,25.057797],
    [121.519486,25.062635],
    [121.520064,25.070773],
    [121.525165,25.083574],
    [121.526266,25.092369],
    [121.52263,25.102162],
    [121.51913,25.109303],
    [121.515171,25.115006],
    [121.506413,25.120863],
    [121.500948,25.126152],
    [121.498136,25.132122],
    [121.503383,25.137048],
    [121.498136,25.132122],
    [121.485312,25.137682],
    [121.473239,25.131175],
    [121.467239,25.125895],
    [121.4596753,25.13697113],
    [121.4590104,25.1544886],
    [121.4455543,25.16823193],
    ]
}];

var RStyle = {
    "color": "#FF0000",
    "weight": 5,
    "opacity": 0.65
};

L.geoJSON(RLines, {
    style: RStyle
}).addTo(map);

//捷運松山信義線
let GLines = [{
    "type": "LineString",
    "coordinates": [
    [121.537768,24.957888],
    [121.541099,24.967454],
    [121.543113,24.975013],
    [121.529914,24.973113],
    [121.543113,24.975013],
    [121.541457,24.983615],
    [121.540663,24.99318],
    [121.538522,25.002547],
    [121.534193,25.014575],
    [121.52769,25.02061],
    [121.523252,25.02556],
    [121.518085,25.032578],
    [121.511048,25.035275],
    [121.508736,25.041803],
    [121.510162,25.049556],
    [121.519382,25.053025],
    [121.532728,25.052743],
    [121.544295,25.052028],
    [121.552505,25.05143],
    [121.564701,25.051657],
    [121.577851,25.05054],
    ]
}];

var GStyle = {
    "color": "	#006000",
    "weight": 5,
    "opacity": 0.65
};

L.geoJSON(GLines, {
    style: GStyle
}).addTo(map);

//捷運中和新蘆線
let OLines = [{
    "type": "LineString",
    "coordinates": [
    [121.509743,24.98961],
    [121.504567,24.993764],
    [121.510952,25.002364],
    [121.51549,25.013021],
    [121.523252,25.02556],
    [121.529439,25.033693],
    [121.533119,25.042058],
    [121.532728,25.052743],
    [121.532809,25.060515],
    [121.526854,25.062832],
    [121.519486,25.062635],
    [121.513126,25.063229],
    [121.49685,25.070565],
    [121.486525,25.077063],
    [121.479849,25.080471],
    [121.472667,25.085687],
    [121.464707,25.091377],
    [121.472667,25.085687],
    [121.479849,25.080471],
    [121.486525,25.077063],
    [121.49685,25.070565],
    [121.513126,25.063229],
    [121.500907,25.06323],
    [121.49132,25.059574],
    [121.484491,25.055649],
    [121.471568,25.046514],
    [121.460733,25.039628],
    [121.452492,25.036364],
    [121.435106,25.032974],
    [121.42221,25.028961],
    [121.410871,25.021664],
    ]
}];

var OStyle = {
    "color": "#FF9224",
    "weight": 5,
    "opacity": 0.65
};

L.geoJSON(OLines, {
    style: OStyle
}).addTo(map);

//捷運板南線
let BLLines = [{
    "type": "LineString",
    "coordinates": [
    [121.419574,24.959567],
    [121.43559,24.96609],
    [121.443752,24.972786],
    [121.4494847,24.98661959],
    [121.452955,24.999374],
    [121.458555,25.008034],
    [121.462264,25.013961],
    [121.46813,25.024205],
    [121.472211,25.029575],
    [121.499448,25.035885],
    [121.508736,25.041803],
    [121.517665,25.047068],
    [121.523519,25.044597],
    [121.533119,25.042058],
    [121.544952,25.041776],
    [121.551692,25.041298],
    [121.55786,25.041159],
    [121.564775,25.040956],
    [121.576494,25.041025],
    [121.583029,25.045311],
    [121.593766,25.050616],
    [121.606488,25.051872],
    [121.616822,25.054875],
    ]
}];

var BLStyle = {
    "color": "#005AB5",
    "weight": 5,
    "opacity": 0.65
};

L.geoJSON(BLLines, {
    style: BLStyle
}).addTo(map);

//捷運環狀線
let YLines = [{
    "type": "LineString",
    "coordinates": [
    [121.541457,24.983615],
    [121.5276,24.984655],
    [121.524837,24.990645],
    [121.515774,24.991998],
    [121.504567,24.993764],
    [121.49651,25.002227],
    [121.49035,25.004828],
    [121.484147,25.008386],
    [121.472455,25.01424],
    [121.464812,25.015233],
    [121.466946,25.025862],
    [121.460507,25.039866],
    [121.460254,25.049945],
    [121.459606,25.061494],
    ]
}];

var YStyle = {
    "color": "#F2FF00",
    "weight": 5,
    "opacity": 0.65
};

L.geoJSON(YLines, {
    style: YStyle
}).addTo(map);