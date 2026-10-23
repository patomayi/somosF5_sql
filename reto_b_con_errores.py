# Reto avanzado B: este programa tiene DOS errores. ¡A encontrarlos!
import sqlite3

conexion = sqlite3.connect(":memory:")
cursor = conexion.cursor()

cursor.execute("CREATE TABLE peliculas (id INTEGER PRIMARY KEY, titulo TEXT, anio INTEGER)")
cursor.execute("INSERT INTO peliculas VALUES (1, 'El faro de cristal', 2018)")
cursor.execute("INSERT INTO peliculas VALUES (2, 'Mar de silicio', 2023)")
conexion.commit()

cursor.execute("SELECT titulo, anio FROM pelicula ORDER BY anio")
conexion.close()
resultados = cursor.fetchall()

for fila in resultados:
    print(fila)
