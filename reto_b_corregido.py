# Reto avanzado B: versión corregida
import sqlite3

conexion = sqlite3.connect(":memory:")
cursor = conexion.cursor()

cursor.execute("CREATE TABLE peliculas (id INTEGER PRIMARY KEY, titulo TEXT, anio INTEGER)")
cursor.execute("INSERT INTO peliculas VALUES (1, 'El faro de cristal', 2018)")
cursor.execute("INSERT INTO peliculas VALUES (2, 'Mar de silicio', 2023)")
conexion.commit()

# Error 1 corregido: la tabla se llama peliculas (en plural), no pelicula
cursor.execute("SELECT titulo, anio FROM peliculas ORDER BY anio")

# Error 2 corregido: primero recupero los resultados y DESPUÉS cierro la conexión
resultados = cursor.fetchall()
conexion.close()

for fila in resultados:
    print(fila)
