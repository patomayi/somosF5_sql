# Ejemplo mínimo: consultar una base de datos SQLite desde Python
# Autora: Emma Choque Sandoval
# Los datos son ficticios y la base de datos vive en memoria (no crea ningún archivo).

import sqlite3  # módulo que viene con Python para trabajar con SQLite

# 1. Conectarse a la base de datos
conexion = sqlite3.connect(":memory:")
cursor = conexion.cursor()  # el cursor es el que ejecuta las consultas

# 2. Crear una tabla de películas y meter cinco registros ficticios
cursor.execute("""
    CREATE TABLE peliculas (
        id INTEGER PRIMARY KEY,
        titulo TEXT,
        genero TEXT,
        anio INTEGER,
        puntuacion REAL
    )
""")
cursor.execute("INSERT INTO peliculas VALUES (1, 'El faro de cristal', 'Drama', 2018, 8.1)")
cursor.execute("INSERT INTO peliculas VALUES (2, 'Códigos en la niebla', 'Misterio', 2021, 7.4)")
cursor.execute("INSERT INTO peliculas VALUES (3, 'La última estación', 'Drama', 2015, 7.9)")
cursor.execute("INSERT INTO peliculas VALUES (4, 'Risas en Barcelona', 'Comedia', 2019, 6.8)")
cursor.execute("INSERT INTO peliculas VALUES (5, 'Mar de silicio', 'Ciencia ficción', 2023, 8.5)")
conexion.commit()  # guarda los cambios

# 3. La consulta SQL está escrita aquí, dentro de un texto
consulta = "SELECT titulo, anio FROM peliculas WHERE genero = 'Drama' ORDER BY anio"

# 4. Esta línea ejecuta la consulta
cursor.execute(consulta)

# 5. Aquí recibo los resultados: fetchall() devuelve una lista de tuplas
resultados = cursor.fetchall()

for fila in resultados:
    print(fila)

# 6. Cerrar la conexión cuando termino
conexion.close()
