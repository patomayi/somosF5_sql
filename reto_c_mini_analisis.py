# Reto avanzado C: mini análisis de datos con SQLite y Python
# Calculo la puntuación media de las películas de dos maneras y busco la mejor.
import sqlite3

conexion = sqlite3.connect(":memory:")
cursor = conexion.cursor()

cursor.execute("CREATE TABLE peliculas (id INTEGER PRIMARY KEY, titulo TEXT, genero TEXT, anio INTEGER, puntuacion REAL)")
cursor.execute("INSERT INTO peliculas VALUES (1, 'El faro de cristal', 'Drama', 2018, 8.1)")
cursor.execute("INSERT INTO peliculas VALUES (2, 'Códigos en la niebla', 'Misterio', 2021, 7.4)")
cursor.execute("INSERT INTO peliculas VALUES (3, 'La última estación', 'Drama', 2015, 7.9)")
cursor.execute("INSERT INTO peliculas VALUES (4, 'Risas en Barcelona', 'Comedia', 2019, 6.8)")
cursor.execute("INSERT INTO peliculas VALUES (5, 'Mar de silicio', 'Ciencia ficción', 2023, 8.5)")
conexion.commit()

# 1. Recupero todas las puntuaciones y calculo la media con Python
cursor.execute("SELECT puntuacion FROM peliculas")
filas = cursor.fetchall()

total = 0
for fila in filas:
    total = total + fila[0]  # fila es una tupla, la puntuación está en la posición 0
media_python = total / len(filas)
print("Media calculada con Python:", round(media_python, 2))

# 2. La misma media, pero calculada por SQL con AVG()
cursor.execute("SELECT AVG(puntuacion) FROM peliculas")
media_sql = cursor.fetchone()[0]
print("Media calculada con SQL (AVG):", round(media_sql, 2))

# 3. La película mejor puntuada
cursor.execute("SELECT titulo, puntuacion FROM peliculas ORDER BY puntuacion DESC LIMIT 1")
mejor = cursor.fetchone()
print("Mejor puntuada:", mejor[0], "con", mejor[1])

# 4. Cuántas películas hay por género
cursor.execute("SELECT genero, COUNT(*) FROM peliculas GROUP BY genero ORDER BY COUNT(*) DESC")
for fila in cursor.fetchall():
    print(fila[0], "->", fila[1])

conexion.close()
