#!/usr/bin/env bash
set -euo pipefail

get_icon() {
    case $1 in
        01d) icon="🟠";;
        01n) icon="⚫";;
        02d) icon="⛅";;
        02n) icon="⛅";;
        04d) icon="🌥️";;
        04n) icon="🌥️";;
        09d) icon="🌧️";;
        09n) icon="🌧️";;
        10d) icon="🌦️";;
        10n) icon="🌦️";;
        11d) icon="🌩️";;
        11n) icon="🌩️";;
        13d) icon="❄️";;
        13n) icon="❄️";;
        50d) icon="🌫️";;
        50n) icon="🌫️";;
        *) icon="☁️";
    esac

    echo $icon
}

get_duration() {

    osname=$(uname -s)

    case $osname in
        *BSD) date -r "$1" -u +%H:%M;;
        *) date --date="@$1" -u +%H:%M;;
    esac

}

KEY=""
CITY=""
UNITS="metric"
SYMBOL="°"

API="https://api.openweathermap.org/data/2.5"

if [ ! -z $CITY ]; then
    if [ "$CITY" -eq "$CITY" ] 2>/dev/null; then
        CITY_PARAM="id=$CITY"
    else
        CITY_PARAM="q=$CITY"
    fi

    current=$(curl -sf "$API/weather?appid=$KEY&$CITY_PARAM&units=$UNITS")
    #curl -s "https://api.openweathermap.org/data/2.5/onecall?lat=0&lon=0&appid=TOKEN&units=metric" | jq -r '.daily[1].temp.day'
    forecast=$(curl -sf "$API/forecast?appid=$KEY&$CITY_PARAM&units=$UNITS&cnt=1")
else
    location=$(curl -sf https://location.services.mozilla.com/v1/geolocate?key=geoclue)

    if [ ! -z "$location" ]; then
        location_lat="$(echo "$location" | jq '.location.lat')"
        location_lon="$(echo "$location" | jq '.location.lng')"

        current=$(curl -sf "$API/weather?appid=$KEY&lat=$location_lat&lon=$location_lon&units=$UNITS")
        forecast=$(curl -sf "$API/forecast?appid=$KEY&lat=$location_lat&lon=$location_lon&units=$UNITS&cnt=1")
    fi
fi

if [ ! -z "$current" ] && [ ! -z "$forecast" ]; then
    current_temp=$(printf "%.0f" $(echo "$current" | jq ".main.temp"))
    current_icon=$(echo "$current" | jq -r ".weather[0].icon")

    forecast_temp=$(printf "%.0f" $(echo "$forecast" | jq ".list[].main.temp"))
    forecast_icon=$(echo "$forecast" | jq -r ".list[].weather[0].icon")

    sun_rise=$(echo "$current" | jq ".sys.sunrise")
    sun_set=$(echo "$current" | jq ".sys.sunset")
    now=$(date +%s)

    if [ "$sun_rise" -gt "$now" ]; then
        daytime="🌅 $(get_duration "$((sun_rise-now))")"
    elif [ "$sun_set" -gt "$now" ]; then
        daytime="🌇 $(get_duration "$((sun_set-now))")"
    else
        daytime="🌅 $(get_duration "$((sun_rise-now))")"
    fi

    echo "$(get_icon "$current_icon") $current_temp$SYMBOL $(get_icon "$forecast_icon") $forecast_temp$SYMBOL  $daytime"
fi
