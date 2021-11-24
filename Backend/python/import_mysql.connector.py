# import mysql.connector
from mysql.connector import connect, Error
from dotenv import dotenv_values


def load_knih():
    """
        Funkcia nacita vsetky existujuce knihy
    """

    config = dotenv_values(".env")
    # print(config)

    HOST=config["HOST"]
    USER=config["USER"]
    PWD=config["PASSWORD"]
    DATABASE=config["DATABASE"]


    vsetky_knihy=[]
    

    try:
        # skusam sa pripojit do DB
        my_db = connect(host=HOST, user=USER, password=PWD, database=DATABASE) 
        cursor = my_db.cursor()

        query = 
            SELECT kniha_template.nazov as nazov, kniha_template.rok_vydania as rok_vydania, kniha.dostupnost as dostupnost FROM kniha_template INNER join kniha on kniha_template.id_template = kniha.id_template WHERE nazov like  "%[formular]%"
                
        cursor.execute(query)
        available_knihy = cursor.fetchall()

        
        for jedna_kniha in available_knihy:
    
            kniha = {
                "nazov": jedna_kniha[0],
                "rok_vydania": jedna_kniha[1],
                "dostupnost":  jedna_kniha[2],
                
            }
        
            vsetky_knihy.append(kniha)

        
        cursor.close()

        return vsetky_knihy


    except Error as e:
        print(e)
    


def load_single_book(id_book):
    """
      funkcia ktora vrati jednu konkretnu knihu
    """
    config = dotenv_values(".env")
    # print(config)

    HOST=config["HOST"]
    USER=config["USER"]
    PWD=config["PASSWORD"]
    DATABASE=config["DATABASE"]

   # vsetky_knihy = []
   # try:
        # skusam sa pripojit do DB
      #  my_db = connect(host=HOST, user=USER, password=PWD, database=DATABASE) 
       # cursor = my_db.cursor()

       # query = f"""
          #  select sensor_id, sensor_type, sensor_value, sensor_unit, Max(time_stamp) AS latest_datetime 
          #  from sensors            
           # where sensors.sensor_id = {sensor_id} 
          #  group by sensor_type 
                
        # print(query)

       # cursor.execute(query)
      #  available_sensors = cursor.fetchall()
        

        # prejdem vsetkymi vysledkami 'available_sensors' z DB 
        # a spravim z kazdeho JSON 'sensor' (=dictionary)
        # a hotovy element pridam do tuple 'all_sensors'
        for single_sensor in available_sensors:
            # print(single_sensor)    # test print
            sensor = {
                "sensor_id": single_sensor[0],
                "sensor_type": single_sensor[1],
                "sensor_value": single_sensor[2],
                "sensor_unit": single_sensor[3], 
                "latest_datetime": single_sensor[4]
            }
            #print(sensor)           # test print
            #print(type(sensor))
            
            all_sensors.append(sensor)

        
        cursor.close()

        return all_sensors


    except Error as e:
        print("error")



if __name__ == "__main__":
    # x = load_all_sensors()
    # print("all sensors result:")
    # print(x)
    
    sensor_id = 1
    y = load_single_sensor(sensor_id)
    print("Data from sensor no: "+str(sensor_id))
    print(y)
