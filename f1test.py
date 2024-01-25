pip download fastf1
import pandas as pd
import numpy
pip install fastf1
import fastf1
import matplotlib.pyplot as plt
import fastf1.plotting


fastf1.Cache.enable_cache('../doc_cache')  # replace with your cache directory

# enable some matplotlib patches for plotting timedelta values and load
# FastF1's default color scheme
fastf1.plotting.setup_mpl()

# load a session and its telemetry data
session = fastf1.get_session(2021, 'Spanish Grand Prix', 'Q')
session.load()

import fastf1
fastf1.Cache.enable_cache('/Users/guaarmstrong/opt/anaconda3/lib/python3.9/site-packages/fastf1/__pycache__')  
session = fastf1.get_session(2019, 'Monza', 'Q')
session.load(telemetry=False, laps=False, weather=False)
vettel = session.get_driver('VET')
print(f"Pronto {vettel['FirstName']}?")

from matplotlib import pyplot as plt
import fastf1
import fastf1.plotting

fastf1.plotting.setup_mpl()

session = fastf1.get_session(2019, 'Monza', 'Q')

session.load()
fast_leclerc = session.laps.pick_driver('LEC').pick_fastest()
lec_car_data = fast_leclerc.get_car_data()
t = lec_car_data['Time']
vCar = lec_car_data['Speed']

# The rest is just plotting
fig, ax = plt.subplots()
ax.plot(t, vCar, label='Fast')
ax.set_xlabel('Time')
ax.set_ylabel('Speed [Km/h]')
ax.set_title('Leclerc is')
ax.legend()
plt.show()
df = pd.DataFrame(lec_car_data)
df.to_csv('/Users/guaarmstrong/example.csv', index = False)


session = fastf1.get_session(2019, 'Montmeló', 'Q')
session.load()
fast_2019 = session.laps.pick_driver('PER').pick_fastest()
lap19 = fast_2019.get_car_data().add_distance()
df = pd.DataFrame(lap19)
df.to_csv('/Users/guaarmstrong/downloads/Secondlap19.csv', index = False)
event = fastf1.get_event(2020, 7)
event

session = fastf1.get_session(2020, 'Montmeló', 'Q')
session.load()
fast_2020 = session.laps.pick_driver('PER').pick_fastest()
lap20 = fast_2020.get_car_data().add_distance()
df = pd.DataFrame(lap20)
df.to_csv('/Users/guaarmstrong/downloads/Secondlap20.csv', index = False)

session = fastf1.get_session(2019, 'Spielberg', 'Q')
session.load()
fast_2020 = session.laps.pick_driver('PER').pick_fastest()
lap19 = fast_2020.get_car_data().add_distance()
df = pd.DataFrame(lap19)
df.to_csv('/Users/guaarmstrong/downloads/Thirdlap19.csv', index = False)

session = fastf1.get_session(2020, 'Spielberg', 'Q')
session.load()
fast_2020 = session.laps.pick_driver('PER').pick_fastest()
lap20 = fast_2020.get_car_data().add_distance()
df = pd.DataFrame(lap20)
df.to_csv('/Users/guaarmstrong/downloads/Thirdlap20.csv', index = False)

session = fastf1.get_session(2019, 'Budapest', 'Q')
session.load()
fast_2020 = session.laps.pick_driver('PER').pick_fastest()
lap19 = fast_2020.get_car_data().add_distance()
df = pd.DataFrame(lap19)
df.to_csv('/Users/guaarmstrong/downloads/Forthlap19.csv', index = False)

session = fastf1.get_session(2020, 'Budapest', 'Q')
session.load()
fast_2020 = session.laps.pick_driver('PER').pick_fastest()
lap20 = fast_2020.get_car_data().add_distance()
df = pd.DataFrame(lap20)
df.to_csv('/Users/guaarmstrong/downloads/Forthlap20.csv', index = False)

session = fastf1.get_session(2019, 'Abu Dhabi', 'Q')
session.load()
fast_2020 = session.laps.pick_driver('PER').pick_fastest()
lap19 = fast_2020.get_car_data().add_distance()
df = pd.DataFrame(lap19)
df.to_csv('/Users/guaarmstrong/downloads/Fifthlap19.csv', index = False)

session = fastf1.get_session(2020, 'Abu Dhabi', 'Q')
session.load()
fast_2020 = session.laps.pick_driver('PER').pick_fastest()
lap20 = fast_2020.get_car_data().add_distance()
df = pd.DataFrame(lap20)
df.to_csv('/Users/guaarmstrong/downloads/Fifthlap20.csv', index = False)

session = fastf1.get_session(2019, 'Spa', 'Q')
session.load()
fast_2020 = session.laps.pick_driver('PER').pick_fastest()
lap19 = fast_2020.get_car_data().add_distance()
df = pd.DataFrame(lap19)
df.to_csv('/Users/guaarmstrong/downloads/Sixthlap19.csv', index = False)

session = fastf1.get_session(2020, 'Spa', 'Q')
session.load()
fast_2020 = session.laps.pick_driver('PER').pick_fastest()
lap20 = fast_2020.get_car_data().add_distance()
df = pd.DataFrame(lap20)
df.to_csv('/Users/guaarmstrong/downloads/Sixthlap20.csv', index = False)



fast_2019 = session.laps.pick_driver('PER').pick_fastest()
lap19 = fast_2019.get_car_data().add_distance()
df = pd.DataFrame(lap19)
df.to_csv('/Users/guaarmstrong/downloads/lap19.csv', index = False)
t = lap19['Time']
vCar = lap19['Speed']

# The rest is just plotting
fig, ax = plt.subplots()
ax.plot(t, vCar, label='Fast')
ax.set_xlabel('Time')
ax.set_ylabel('Speed [Km/h]')
ax.set_title('Car 2019 is')
ax.legend()
plt.show()

fast_2020 = session3.laps.pick_driver('PER').pick_fastest()
lap20 = fast_2020.get_car_data().add_distance()
df = pd.DataFrame(lap20)
df.to_csv('/Users/guaarmstrong/downloads/lap20.csv', index = False)
t = lap20['Time']
vCar = lap20['Speed']

# The rest is just plotting
fig, ax = plt.subplots()
ax.plot(t, vCar, label='Fast')
ax.set_xlabel('Time')
ax.set_ylabel('Speed [Km/h]')
ax.set_title('Car 2020 is')
ax.legend()
plt.show()

example2=fastf1.api.weather_data(session.api_path, response=None, livedata=None)
df2 = pd.DataFrame(example2)
df2.to_csv('/Users/guaarmstrong/downloads/example2.csv', index = False)


session3 = fastf1.get_session(2020, 'Monza', 'Q')
session3.load()
example3=fastf1.api.weather_data(session3.api_path, response=None, livedata=None)
df2 = pd.DataFrame(example3)
df2.to_csv('/Users/guaarmstrong/downloads/example3.csv', index = False)


session3 = fastf1.get_session(2019, 'Monza', 'Q')
session3.load()
example3=fastf1.api.weather_data(session3.api_path, response=None, livedata=None)
df2 = pd.DataFrame(example3)
df2.to_csv('/Users/guaarmstrong/downloads/TT1-2.csv', index = False)

session3 = fastf1.get_session(2018, 'Monza', 'Q')
session3.load()
example3=fastf1.api.weather_data(session3.api_path, response=None, livedata=None)
df2 = pd.DataFrame(example3)
df2.to_csv('/Users/guaarmstrong/downloads/TT1-3.csv', index = False)

session3 = fastf1.get_session(2020, 'Silverstone', 'Q')
session3.load()
example3=fastf1.api.weather_data(session3.api_path, response=None, livedata=None)
df2 = pd.DataFrame(example3)
df2.to_csv('/Users/guaarmstrong/downloads/TT2-1.csv', index = False)

session3 = fastf1.get_session(2019, 'Silverstone', 'Q')
session3.load()
example3=fastf1.api.weather_data(session3.api_path, response=None, livedata=None)
df2 = pd.DataFrame(example3)
df2.to_csv('/Users/guaarmstrong/downloads/TT2-2.csv', index = False)

session3 = fastf1.get_session(2018, 'Silverstone', 'Q')
session3.load()
example3=fastf1.api.weather_data(session3.api_path, response=None, livedata=None)
df2 = pd.DataFrame(example3)
df2.to_csv('/Users/guaarmstrong/downloads/TT2-3.csv', index = False)

session3 = fastf1.get_session(2020, 'Spa', 'Q')
session3.load()
example3=fastf1.api.weather_data(session3.api_path, response=None, livedata=None)
df2 = pd.DataFrame(example3)
df2.to_csv('/Users/guaarmstrong/downloads/TT3-1.csv', index = False)

session3 = fastf1.get_session(2019, 'Spa', 'Q')
session3.load()
example3=fastf1.api.weather_data(session3.api_path, response=None, livedata=None)
df2 = pd.DataFrame(example3)
df2.to_csv('/Users/guaarmstrong/downloads/TT3-2.csv', index = False)

session3 = fastf1.get_session(2018, 'Spa', 'Q')
session3.load()
example3=fastf1.api.weather_data(session3.api_path, response=None, livedata=None)
df2 = pd.DataFrame(example3)
df2.to_csv('/Users/guaarmstrong/downloads/TT3-3.csv', index = False)



session4 = fastf1.get_session(2021, 'Monza', 'Q')

session4.load()
example4=fastf1.api.weather_data(session4.api_path, response=None, livedata=None)
df2 = pd.DataFrame(example4)
df2.to_csv('/Users/guaarmstrong/downloads/example4.csv', index = False)

import matplotlib.pyplot as plt
import fastf1.plotting


fastf1.Cache.enable_cache('/Users/guaarmstrong/opt/anaconda3/lib/python3.9/site-packages/fastf1/__pycache__')  # replace with your cache directory

# enable some matplotlib patches for plotting timedelta values and load
# FastF1's default color scheme
fastf1.plotting.setup_mpl()

# load a session and its telemetry data
session = fastf1.get_session(2021, 'Spanish Grand Prix', 'Q')
session.load()
ver_lap = session.laps.pick_driver('VER').pick_fastest()
ham_lap = session.laps.pick_driver('HAM').pick_fastest()
ver_tel = ver_lap.get_car_data().add_distance()
ham_tel = ham_lap.get_car_data().add_distance()
rbr_color = fastf1.plotting.team_color('RBR')
mer_color = fastf1.plotting.team_color('MER')

fig, ax = plt.subplots()
ax.plot(ver_tel['Distance'], ver_tel['Speed'], color=rbr_color, label='VER')
ax.plot(ham_tel['Distance'], ham_tel['Speed'], color=mer_color, label='HAM')

ax.set_xlabel('Distance in m')
ax.set_ylabel('Speed in km/h')

ax.legend()
plt.suptitle(f"Fastest Lap Comparison \n "
             f"{session.event['EventName']} {session.event.year} Qualifying")

plt.show()



import matplotlib.pyplot as plt
import fastf1.plotting


fastf1.Cache.enable_cache('/Users/guaarmstrong/opt/anaconda3/lib/python3.9/site-packages/fastf1/__pycache__')  # replace with your cache directory

# enable some matplotlib patches for plotting timedelta values and load
# FastF1's default color scheme
fastf1.plotting.setup_mpl()

# load a session and its telemetry data
session1 = fastf1.get_session(2022, 'Spanish Grand Prix', 'Q')
session1.load()
session2=fastf1.get_session(2021, 'Spanish Grand Prix', 'Q')
session2.load()

##############################################################################
# First, we select the two laps that we want to compare

STR22_lap = session1.laps.pick_driver('STR').pick_fastest()
STR21_lap = session2.laps.pick_driver('STR').pick_fastest()

##############################################################################
# Next we get the telemetry data for each lap. We also add a 'Distance' column
# to the telemetry dataframe as this makes it easier to compare the laps.

STR22_tel = STR22_lap.get_car_data().add_distance()
STR21_tel = STR21_lap.get_car_data().add_distance()

##############################################################################
# Finally, we create a plot and plot both speed traces.
# We color the individual lines with the driver's team colors.

rbr_color = fastf1.plotting.team_color('RBR')
mer_color = fastf1.plotting.team_color('MER')

fig, ax = plt.subplots()
ax.plot(STR22_tel['Distance'], STR22_tel['Speed'], color=rbr_color, label='VER')
ax.plot(STR21_tel['Distance'], STR21_tel['Speed'], color=mer_color, label='HAM')

ax.set_xlabel('Distance in m')
ax.set_ylabel('Speed in km/h')

ax.legend()
plt.suptitle(f"Fastest Lap Comparison \n "
             f"{session.event['EventName']} {session.event.year} Qualifying")

plt.show()



from matplotlib import pyplot as plt
import fastf1
import fastf1.plotting

fastf1.plotting.setup_mpl()

session = fastf1.get_session(2021, 'Monza', 'Q')

session.load()
fast_leclerc = session.laps.pick_driver('HAM').pick_fastest()
lec_car_data = fast_leclerc.get_car_data()
t = lec_car_data['Time']
vCar = lec_car_data['Speed']

# The rest is just plotting
fig, ax = plt.subplots()
ax.plot(t, vCar, label='Fast')
ax.set_xlabel('Time')
ax.set_ylabel('Speed [Km/h]')
ax.set_title('Leclerc is')
ax.legend()
plt.show()


