# YAK Achievements
Achievement-System for YAKs

## Usage
_Root-Route_ <br>
__GET__ http://127.0.0.1/


_Checkin-Route_ (Trigger Achievement-Process)  <br>
__POST__ http://127.0.0.1/checkin(.json)  <br>
__Parameters__: {resource: RESOURCE\_KEY, yak_uid: YAK\_ID}

*Info*:
* __YAK-ID__ will be created in the Database, the first Time a YAK\_ID is posted
* __RESOURCE\_KEY__ can be retrieved from Database

*Note*: _HOST_ (here http://127.0.0.1/) must be changed to whatever your Host is ;)


#### More to come

