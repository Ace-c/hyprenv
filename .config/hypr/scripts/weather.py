#!/usr/bin/env python3

import datetime
import json
import requests
import statistics
import sys


### CONSTANTS ###

# api key - get it at https://openweathermap.org/
API_KEY = 'Enter your api'

# latitude and longitude of the city you want to query
# can be obtained through `./weather.py geocoding <city[,state,country]>`
LATITUDE  = 
LONGITUDE = 

# waybar colors
GRAY   = '#859289'
DARK   = "#9e9d9b"
GREEN  = '#a7c080'
YELLOW = '#dbbc7f'
ORANGE = '#e69875'
RED    = '#e67e80'
PURPLE = '#d699b6'
BLUE   = '#7fbbb3'



### UTILITIES ###

def print_error(msg: str):
    '''
    print an error message with appropriate prefix.

    @param str: the message to print
    '''
    print('\x1b[90m[\x1b[31merr\x1b[90m]\x1b[0m', msg)


def print_help():
    '''
    print help message, to be used for the `--help` flag and as response to
    incorrect usage
    '''
    print('usage: \x1b[33m./weather.py <subcommand> [options]\x1b[0m')
    print()
    print('available subcommands:')
    print(' - \x1b[32mgeocoding\x1b[0m <city[,state][,country]> : search for city to get its coordinates')
    print(' - \x1b[32mcurrent\x1b[0m                            : print current weather information')
    print(' - \x1b[32mwaybar\x1b[0m                             : get output for usage with waybar')


def make_request(call: str) -> list | dict:
    '''
    make a request to an openweathermap api and returns the response as either
    a list or a dictionary. the api key is added automatically. quits on error.

    @param call: the api path, e.g. `data/2.5/weather?...`

    @return response of the api request as a list or dict
    '''
    try:
        req = requests.get(f'https://api.openweathermap.org/{call}&appid={API_KEY}')
        return req.json()
    except:
        print_error(f'failed to make request to `/{call}`')
        quit(1)


def get_wind_direction(deg: int) -> str:
    '''
    turn a wind direction specified by meteorological degrees into a
    human-readable form

    @param deg: degrees. expected to be in range [0..360]

    @return human-readable form (e.g. 'NE' for `deg == 45`)
    '''
    if deg < 22.5:  return 'N'
    if deg < 67.5:  return 'NE'
    if deg < 112.5: return 'E'
    if deg < 157.5: return 'SE'
    if deg < 202.5: return 'S'
    if deg < 247.5: return 'SW'
    if deg < 292.5: return 'W'
    if deg < 337.5: return 'NW'
    else:           return 'N'


def print_entry(label: str, content: str, indent: int = 0, label_width: int = 8):
    '''
    print an 'entry' that consists of a label (printed in gray) and some
    content. the labels are automatically filled with whitespace to align
    multiple lines properly.

    @param label:       the label of the line
    @param content:     content, printed after the label
    @param indent:      number of spaces to indent with
    @param label_width: width of label
    '''
    label_with_whitespace = label.ljust(label_width)
    print(f'{" " * indent}\x1b[90m{label_with_whitespace}\x1b[0m  {content}')


def get_weekday(date: str) -> str:
    '''
    get weekday from date

    @param date: date as ISO-8601-formatted string (YYYY-mm-dd)

    @return weekday as lowercase string (e.g. 'monday')
    '''
    return datetime.datetime.strptime(date, '%Y-%m-%d').strftime('%A').lower()


def colorize(text: str, color: str) -> str:
    '''
    wrap `text` with pango markup to colorize it for usage with waybar.

    @param text: the text to colorize
    @param color: the color as string ('#rrggbb')
    '''
    return f'<span foreground="{color}">{text}</span>'


def waybar_entry(label: str, content: str, indent: int = 2, label_width: int = 9):
    '''
    create an 'entry' for a waybar tooltip that consists of a label (printed in
    gray) and some content. the labels are automatically filled with whitespace
    to align multiple lines properly.

    @param label:       the label of the line
    @param content:     content, printed after the label
    @param indent:      number of spaces to indent with
    @param label_width: width of label

    @return the entry for use within waybar
    '''

    label_with_whitespace = label.ljust(label_width)
    return f'{" " * indent}{colorize(label_with_whitespace, GRAY)}  {content}\n'



### GEOCODING ###

def geocoding(search: str):
    '''
    call openweathermap's geocoding api to find the coordinates of cities. can
    be used to find the values required for the `LATITUDE` and `LONGITUDE`
    constants within this script. the results are printed.

    @param: search term in the format 'city[,state][,country]'
    '''

    res = make_request(f'geo/1.0/direct?q={search}&limit=5')
    num_results = len(res)

    if (num_results == 0):
        print_error('no results found')
    else:
        print(f'found {num_results} result{"" if num_results == 1 else "s"}:')
        for entry in res:
            # obtain data
            name      = entry['name']
            state     = entry['state'] if 'state' in entry.keys() else None
            country   = entry['country']
            latitude  = entry['lat']
            longitude = entry['lon']

            # print data
            print(f' - \x1b[32m{name}\x1b[90m',
                  f'({f"{state}, " if state else ""}{country})\x1b[0m:',
                  f'latitude = \x1b[35m{latitude}\x1b[0m,',
                  f'longitude = \x1b[35m{longitude}\x1b[0m')


### CURRENT WEATHER ###

def get_current_weather_data() -> dict:
    '''
    get current weather data from openweathermap api. when the `rain` is not
    set (due to there not being any rain), it will be added with a rain amount
    of 0 mm over the last hour.

    @return api response
    '''

    res = make_request(f'data/2.5/weather?lat={LATITUDE}&lon={LONGITUDE}&units=metric')

    if 'rain' not in res.keys():
        res['rain'] = { '1h': 0 }

    return res


def current_weather():
    '''
    print current weather information
    '''

    data = get_current_weather_data()

    # collect relevant data
    weather          = data['weather'][0]['description'].lower()
    temperature      = round(data['main']['temp'], 1)
    temperature_felt = round(data['main']['feels_like'], 1)
    humidity         = data['main']['humidity']
    wind_speed       = round(data['wind']['speed'], 1)
    wind_direction   = get_wind_direction(data['wind']['deg'])
    rainfall         = data['rain']['1h']

    # print data
    print_entry('weather',  f'\x1b[32m{weather}\x1b[0m')
    print_entry('temp',     f'\x1b[33m{temperature} °C\x1b[90m, feels like \x1b[33m{temperature_felt} °C\x1b[0m')
    print_entry('humidity', f'\x1b[31m{humidity} % RH\x1b[0m')
    print_entry('wind',     f'\x1b[35m{wind_speed} m/s\x1b[90m ({wind_direction})\x1b[0m')
    print_entry('rain',     f'\x1b[34m{rainfall} mm\x1b[0m')



### WAYBAR ###

def waybar_widget(data: dict) -> str:
    '''
    get the widget component of the waybar output. contains the current weather
    group and temperature.

    @param current weather data

    @return widget component
    '''

    weather = data['weather'][0]['main'].lower()   #Change upper or lower case of weather name
    temperature = round(data['main']['temp'])

    return f'{weather} {temperature}°'


def waybar_current(data: dict) -> str:
    '''
    get the current weather overview for the tooltip of the waybar output.

    @param current weather data

    @return formatted current weather overview
    '''

    # retrieve relevant data
    weather          = data['weather'][0]['description'].lower()
    temperature      = round(data['main']['temp'], 1)
    temperature_felt = round(data['main']['feels_like'], 1)
    humidity         = data['main']['humidity']
    wind_speed       = round(data['wind']['speed'], 1)
    wind_direction   = get_wind_direction(data['wind']['deg'])
    rainfall         = data['rain']['1h']

    # generate output
    output = ''
    output += waybar_entry('weather      ',  colorize(weather, GREEN))
    output += waybar_entry('temp            ',  colorize(f'{temperature} °C', YELLOW))
    output += waybar_entry('feels-like    ',  colorize(f'{temperature_felt} °C', ORANGE))                       
    output += waybar_entry('humidity      ',  colorize(f'{humidity} % RH', RED))
    output += waybar_entry('wind             ',f'{colorize(f"{wind_speed} m/s", PURPLE)} {colorize(f"({wind_direction})", GRAY)}')
    output += waybar_entry('rain               ',    colorize(f"{rainfall} mm", BLUE))
    return output



def waybar():
    '''
    get current and forecast weather data and output it formatted in a way that
    allows it to be included as a widget in waybar. only shows weather category
    and temperature in the widget, but reveals detailed weather information and
    a ~5 day forecast in the tooltip.
    '''

    current_data = get_current_weather_data()

    widget = waybar_widget(current_data)
    current = waybar_current(current_data)
    tooltip = colorize('         ', BLUE) + '\n' + current  
              

    print(json.dumps({
        'text': widget,
        'tooltip': tooltip,
    }))



### MAIN ###

def main():
    '''
    main function
    '''

    # no parameters or `--help`
    if len(sys.argv) == 1 or sys.argv[1] in ('help', '-h', '--help'):
        print_help()

    # >= 1 parameter provided
    else:
        # geocoding
        if sys.argv[1] == 'geocoding':
            if len(sys.argv) == 3:
                geocoding(sys.argv[2])
            else:
                print_error('expected argument `<city[,state][,country]>`')
                print_help()
        # constants not set
        elif API_KEY is None or LATITUDE is None or LONGITUDE is None:
            print_error('please modify the constants within the script before use.')
        # current weather
        elif sys.argv[1] == 'current':
            current_weather()
        # waybar
        elif sys.argv[1] == 'waybar':
            waybar()
        # unknown command
        else:
            print_error(f'unknown command `{sys.argv[1]}`')
            print_help()

if __name__ == '__main__':
    main()
