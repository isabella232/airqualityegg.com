
def egg_json
  <<-EOF
{
  "tags":["device:type=Air Quality Egg","device:type=airqualityegg"],
  "description":"NO2 CO Temp Humidity. Outdoor location",
  "created":"2012-12-03T19:24:21.777445Z",
  "location":{"exposure":"outdoor","lon":-2.5,"domain":"physical","ele":"69.118","lat":53.4},
  "datastreams":[
    {
      "tags":["aqe:data_origin=computed","aqe:firmware_version=3","aqe:sensor_address=00:04:a3:27:bc:2c","aqe:sensor_index=1","aqe:sensor_type=CO"],
      "current_value":"270023",
      "at":"2013-01-03T17:32:19.161216Z",
      "unit":{"symbol":"ppb","label":"ppb"},
      "max_value":"357250.0",
      "id":"CO_00-04-a3-27-bc-2c_1",
      "min_value":"0.0"
    },{
      "tags":["aqe:data_origin=raw","aqe:firmware_version=3","aqe:sensor_address=00:04:a3:27:bc:2c","aqe:sensor_index=1","aqe:sensor_type=CO"],
      "current_value":"310307",
      "at":"2013-01-03T17:32:14.095585Z",
      "unit":{"symbol":"ohms","label":"ohms"},
      "max_value":"6305417.0",
      "id":"CO_raw_00-04-a3-27-bc-2c_1",
      "min_value":"0.0"
    },{
      "tags":["aqe:data_origin=computed","aqe:firmware_version=0","aqe:sensor_address=00:04:a3:9f:c4:66","aqe:sensor_index=1","aqe:sensor_type=Humidity"],
      "current_value":"70",
      "at":"2013-01-10T09:50:50.465317Z",
      "unit":{"symbol":"%","label":"%"},
      "max_value":"143.0",
      "id":"Humidity_00-04-a3-9f-c4-66_1",
      "min_value":"51.0"
    },{
      "tags":["aqe:data_origin=computed","aqe:firmware_version=3","aqe:sensor_address=00:04:a3:27:bc:2c","aqe:sensor_index=0","aqe:sensor_type=NO2"],
      "current_value":"125",
      "at":"2013-01-03T17:32:09.059023Z",
      "unit":{"symbol":"ppb","label":"ppb"},
      "max_value":"641.0",
      "id":"NO2_00-04-a3-27-bc-2c_0",
      "min_value":"0.0"
    },{
      "tags":["aqe:data_origin=raw","aqe:firmware_version=3","aqe:sensor_address=00:04:a3:27:bc:2c","aqe:sensor_index=0","aqe:sensor_type=NO2"],
      "current_value":"0",
      "at":"2013-01-03T17:33:03.965814Z",
      "unit":{"symbol":"ohms","label":"ohms"},
      "max_value":"1356112.0",
      "id":"NO2_raw_00-04-a3-27-bc-2c_0",
      "min_value":"0.0"
    },{
      "tags":["aqe:data_origin=computed","aqe:firmware_version=0","aqe:sensor_address=00:04:a3:9f:c4:66","aqe:sensor_index=0","aqe:sensor_type=Temperature"],
      "current_value":"22",
      "at":"2013-01-10T09:50:45.141901Z",
      "unit":{"symbol":"deg C","label":"deg C"},
      "max_value":"37777777777.0",
      "id":"Temperature_00-04-a3-9f-c4-66_0",
      "min_value":"14.0"}
    ],
  "feed":"https://api.cosm.com/v2/feeds/101.json",
  "version":"1.0.0",
  "private":"false",
  "updated":"2013-01-10T09:50:50.583541Z",
  "id":101,
  "creator":"https://cosm.com/users/airqualityegg",
  "title":"Joe's Air Quality Egg"
}
EOF
end
