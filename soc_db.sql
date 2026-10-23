-- soc_db · SQL Casefiles / SQL Agent
PRAGMA foreign_keys=OFF;
BEGIN TRANSACTION;

DROP TABLE IF EXISTS usuarios;
CREATE TABLE usuarios (
  id_usuario INTEGER PRIMARY KEY,
  nombre TEXT NOT NULL,
  departamento TEXT,
  email TEXT
);

INSERT INTO usuarios (id_usuario, nombre, departamento, email) VALUES (1, 'Ana Torres', 'Finanzas', 'ana.torres@corp.local');
INSERT INTO usuarios (id_usuario, nombre, departamento, email) VALUES (2, 'Luis García', 'TI', 'luis.garcia@corp.local');
INSERT INTO usuarios (id_usuario, nombre, departamento, email) VALUES (3, 'María López', 'RRHH', 'maria.lopez@corp.local');
INSERT INTO usuarios (id_usuario, nombre, departamento, email) VALUES (4, 'Carlos Ruiz', 'Ventas', 'carlos.ruiz@corp.local');
INSERT INTO usuarios (id_usuario, nombre, departamento, email) VALUES (5, 'Sofía Núñez', 'Marketing', 'sofia.nunez@corp.local');
INSERT INTO usuarios (id_usuario, nombre, departamento, email) VALUES (6, 'Diego Pérez', 'Finanzas', 'diego.perez@corp.local');
INSERT INTO usuarios (id_usuario, nombre, departamento, email) VALUES (7, 'Elena Vidal', 'TI', 'elena.vidal@corp.local');
INSERT INTO usuarios (id_usuario, nombre, departamento, email) VALUES (8, 'Javier Soto', 'Legal', 'javier.soto@corp.local');
INSERT INTO usuarios (id_usuario, nombre, departamento, email) VALUES (9, 'Lucía Ramos', 'Ventas', 'lucia.ramos@corp.local');
INSERT INTO usuarios (id_usuario, nombre, departamento, email) VALUES (10, 'Pablo Mena', 'Ingeniería', 'pablo.mena@corp.local');
INSERT INTO usuarios (id_usuario, nombre, departamento, email) VALUES (11, 'Marta Ríos', 'Ingeniería', 'marta.rios@corp.local');
INSERT INTO usuarios (id_usuario, nombre, departamento, email) VALUES (12, 'Andrés Gil', 'Soporte', 'andres.gil@corp.local');
INSERT INTO usuarios (id_usuario, nombre, departamento, email) VALUES (13, 'Rocío Cano', 'Soporte', 'rocio.cano@corp.local');
INSERT INTO usuarios (id_usuario, nombre, departamento, email) VALUES (14, 'Iván Bravo', 'Dirección', 'ivan.bravo@corp.local');
INSERT INTO usuarios (id_usuario, nombre, departamento, email) VALUES (15, 'Nuria Pardo', 'Legal', 'nuria.pardo@corp.local');
INSERT INTO usuarios (id_usuario, nombre, departamento, email) VALUES (16, 'Óscar Vega', 'Marketing', 'oscar.vega@corp.local');
INSERT INTO usuarios (id_usuario, nombre, departamento, email) VALUES (17, 'Clara Ibáñez', 'RRHH', 'clara.ibanez@corp.local');
INSERT INTO usuarios (id_usuario, nombre, departamento, email) VALUES (18, 'Raúl Herrera', 'Ingeniería', 'raul.herrera@corp.local');
INSERT INTO usuarios (id_usuario, nombre, departamento, email) VALUES (19, 'Sara Molina', 'Ventas', 'sara.molina@corp.local');
INSERT INTO usuarios (id_usuario, nombre, departamento, email) VALUES (20, 'Tomás Vera', 'TI', 'tomas.vera@corp.local');

DROP TABLE IF EXISTS dispositivos;
CREATE TABLE dispositivos (
  id_dispositivo INTEGER PRIMARY KEY,
  id_usuario INTEGER,
  tipo_dispositivo TEXT,
  sistema_operativo TEXT,
  FOREIGN KEY (id_usuario) REFERENCES usuarios(id_usuario)
);

INSERT INTO dispositivos (id_dispositivo, id_usuario, tipo_dispositivo, sistema_operativo) VALUES (101, 1, 'Portátil', 'Windows 11');
INSERT INTO dispositivos (id_dispositivo, id_usuario, tipo_dispositivo, sistema_operativo) VALUES (102, 2, 'Portátil', 'macOS 14');
INSERT INTO dispositivos (id_dispositivo, id_usuario, tipo_dispositivo, sistema_operativo) VALUES (103, 3, 'Sobremesa', 'Windows 10');
INSERT INTO dispositivos (id_dispositivo, id_usuario, tipo_dispositivo, sistema_operativo) VALUES (104, 4, 'Portátil', 'Windows 11');
INSERT INTO dispositivos (id_dispositivo, id_usuario, tipo_dispositivo, sistema_operativo) VALUES (105, 5, 'Portátil', 'macOS 14');
INSERT INTO dispositivos (id_dispositivo, id_usuario, tipo_dispositivo, sistema_operativo) VALUES (106, 6, 'Sobremesa', 'Windows 11');
INSERT INTO dispositivos (id_dispositivo, id_usuario, tipo_dispositivo, sistema_operativo) VALUES (107, 7, 'Portátil', 'Ubuntu 22.04');
INSERT INTO dispositivos (id_dispositivo, id_usuario, tipo_dispositivo, sistema_operativo) VALUES (108, 8, 'Portátil', 'Windows 11');
INSERT INTO dispositivos (id_dispositivo, id_usuario, tipo_dispositivo, sistema_operativo) VALUES (109, 9, 'Móvil', 'iOS 17');
INSERT INTO dispositivos (id_dispositivo, id_usuario, tipo_dispositivo, sistema_operativo) VALUES (110, 10, 'Portátil', 'Ubuntu 22.04');
INSERT INTO dispositivos (id_dispositivo, id_usuario, tipo_dispositivo, sistema_operativo) VALUES (111, 11, 'Portátil', 'Ubuntu 22.04');
INSERT INTO dispositivos (id_dispositivo, id_usuario, tipo_dispositivo, sistema_operativo) VALUES (112, 12, 'Sobremesa', 'Windows 10');
INSERT INTO dispositivos (id_dispositivo, id_usuario, tipo_dispositivo, sistema_operativo) VALUES (113, 13, 'Portátil', 'Windows 11');
INSERT INTO dispositivos (id_dispositivo, id_usuario, tipo_dispositivo, sistema_operativo) VALUES (114, 14, 'Portátil', 'macOS 14');
INSERT INTO dispositivos (id_dispositivo, id_usuario, tipo_dispositivo, sistema_operativo) VALUES (115, 15, 'Portátil', 'Windows 11');
INSERT INTO dispositivos (id_dispositivo, id_usuario, tipo_dispositivo, sistema_operativo) VALUES (116, 16, 'Portátil', 'macOS 14');
INSERT INTO dispositivos (id_dispositivo, id_usuario, tipo_dispositivo, sistema_operativo) VALUES (117, 17, 'Sobremesa', 'Windows 10');
INSERT INTO dispositivos (id_dispositivo, id_usuario, tipo_dispositivo, sistema_operativo) VALUES (118, 18, 'Portátil', 'Ubuntu 22.04');
INSERT INTO dispositivos (id_dispositivo, id_usuario, tipo_dispositivo, sistema_operativo) VALUES (119, 19, 'Móvil', 'Android 14');
INSERT INTO dispositivos (id_dispositivo, id_usuario, tipo_dispositivo, sistema_operativo) VALUES (120, 20, 'Portátil', 'Windows 11');

DROP TABLE IF EXISTS eventos_login;
CREATE TABLE eventos_login (
  id_evento INTEGER PRIMARY KEY,
  id_usuario INTEGER,
  id_dispositivo INTEGER,
  ip_origen TEXT,
  fecha_hora TEXT,
  resultado TEXT,
  FOREIGN KEY (id_usuario) REFERENCES usuarios(id_usuario),
  FOREIGN KEY (id_dispositivo) REFERENCES dispositivos(id_dispositivo)
);

INSERT INTO eventos_login (id_evento, id_usuario, id_dispositivo, ip_origen, fecha_hora, resultado) VALUES (1, 1, 101, '10.0.0.15', '2025-06-30 08:12:04', 'exito');
INSERT INTO eventos_login (id_evento, id_usuario, id_dispositivo, ip_origen, fecha_hora, resultado) VALUES (2, 2, 102, '10.0.0.16', '2025-06-30 08:22:11', 'exito');
INSERT INTO eventos_login (id_evento, id_usuario, id_dispositivo, ip_origen, fecha_hora, resultado) VALUES (3, 3, 103, '10.0.0.17', '2025-06-30 08:45:33', 'exito');
INSERT INTO eventos_login (id_evento, id_usuario, id_dispositivo, ip_origen, fecha_hora, resultado) VALUES (4, 4, 104, '10.0.0.18', '2025-06-30 09:01:22', 'exito');
INSERT INTO eventos_login (id_evento, id_usuario, id_dispositivo, ip_origen, fecha_hora, resultado) VALUES (5, 5, 105, '10.0.0.19', '2025-06-30 09:15:41', 'exito');
INSERT INTO eventos_login (id_evento, id_usuario, id_dispositivo, ip_origen, fecha_hora, resultado) VALUES (6, 6, 106, '10.0.0.20', '2025-06-30 09:20:02', 'exito');
INSERT INTO eventos_login (id_evento, id_usuario, id_dispositivo, ip_origen, fecha_hora, resultado) VALUES (7, 7, 107, '10.0.0.21', '2025-06-30 09:32:18', 'exito');
INSERT INTO eventos_login (id_evento, id_usuario, id_dispositivo, ip_origen, fecha_hora, resultado) VALUES (8, 1, 101, '10.0.0.15', '2025-06-30 13:05:44', 'exito');
INSERT INTO eventos_login (id_evento, id_usuario, id_dispositivo, ip_origen, fecha_hora, resultado) VALUES (9, 2, 102, '10.0.0.16', '2025-06-30 13:12:33', 'exito');
INSERT INTO eventos_login (id_evento, id_usuario, id_dispositivo, ip_origen, fecha_hora, resultado) VALUES (10, 8, 108, '10.0.0.22', '2025-06-30 14:00:11', 'exito');
INSERT INTO eventos_login (id_evento, id_usuario, id_dispositivo, ip_origen, fecha_hora, resultado) VALUES (11, 9, 109, '10.0.0.23', '2025-06-30 14:22:04', 'exito');
INSERT INTO eventos_login (id_evento, id_usuario, id_dispositivo, ip_origen, fecha_hora, resultado) VALUES (12, 10, 110, '10.0.0.24', '2025-06-30 15:44:19', 'exito');
INSERT INTO eventos_login (id_evento, id_usuario, id_dispositivo, ip_origen, fecha_hora, resultado) VALUES (13, 4, 104, '10.0.0.18', '2025-06-30 16:10:02', 'fallo');
INSERT INTO eventos_login (id_evento, id_usuario, id_dispositivo, ip_origen, fecha_hora, resultado) VALUES (14, 4, 104, '10.0.0.18', '2025-06-30 16:10:35', 'exito');
INSERT INTO eventos_login (id_evento, id_usuario, id_dispositivo, ip_origen, fecha_hora, resultado) VALUES (15, 11, 111, '10.0.0.25', '2025-06-30 17:03:00', 'exito');
INSERT INTO eventos_login (id_evento, id_usuario, id_dispositivo, ip_origen, fecha_hora, resultado) VALUES (16, 6, 106, '203.0.113.77', '2025-07-01 02:14:03', 'fallo');
INSERT INTO eventos_login (id_evento, id_usuario, id_dispositivo, ip_origen, fecha_hora, resultado) VALUES (17, 6, 106, '203.0.113.77', '2025-07-01 02:14:41', 'fallo');
INSERT INTO eventos_login (id_evento, id_usuario, id_dispositivo, ip_origen, fecha_hora, resultado) VALUES (18, 6, 106, '203.0.113.77', '2025-07-01 02:15:12', 'fallo');
INSERT INTO eventos_login (id_evento, id_usuario, id_dispositivo, ip_origen, fecha_hora, resultado) VALUES (19, 6, 106, '203.0.113.77', '2025-07-01 02:15:58', 'fallo');
INSERT INTO eventos_login (id_evento, id_usuario, id_dispositivo, ip_origen, fecha_hora, resultado) VALUES (20, 6, 106, '203.0.113.77', '2025-07-01 02:16:33', 'fallo');
INSERT INTO eventos_login (id_evento, id_usuario, id_dispositivo, ip_origen, fecha_hora, resultado) VALUES (21, 6, 106, '203.0.113.77', '2025-07-01 02:17:10', 'fallo');
INSERT INTO eventos_login (id_evento, id_usuario, id_dispositivo, ip_origen, fecha_hora, resultado) VALUES (22, 6, 106, '203.0.113.77', '2025-07-01 02:17:52', 'fallo');
INSERT INTO eventos_login (id_evento, id_usuario, id_dispositivo, ip_origen, fecha_hora, resultado) VALUES (23, 6, 106, '203.0.113.77', '2025-07-01 02:18:40', 'exito');
INSERT INTO eventos_login (id_evento, id_usuario, id_dispositivo, ip_origen, fecha_hora, resultado) VALUES (24, 12, 112, '10.0.0.26', '2025-07-01 08:02:11', 'exito');
INSERT INTO eventos_login (id_evento, id_usuario, id_dispositivo, ip_origen, fecha_hora, resultado) VALUES (25, 13, 113, '10.0.0.27', '2025-07-01 08:15:44', 'exito');
INSERT INTO eventos_login (id_evento, id_usuario, id_dispositivo, ip_origen, fecha_hora, resultado) VALUES (26, 14, 114, '10.0.0.28', '2025-07-01 08:30:02', 'exito');
INSERT INTO eventos_login (id_evento, id_usuario, id_dispositivo, ip_origen, fecha_hora, resultado) VALUES (27, 15, 115, '10.0.0.29', '2025-07-01 08:45:19', 'exito');
INSERT INTO eventos_login (id_evento, id_usuario, id_dispositivo, ip_origen, fecha_hora, resultado) VALUES (28, 16, 116, '10.0.0.30', '2025-07-01 09:01:07', 'exito');
INSERT INTO eventos_login (id_evento, id_usuario, id_dispositivo, ip_origen, fecha_hora, resultado) VALUES (29, 17, 117, '10.0.0.31', '2025-07-01 09:12:44', 'exito');
INSERT INTO eventos_login (id_evento, id_usuario, id_dispositivo, ip_origen, fecha_hora, resultado) VALUES (30, 18, 118, '10.0.0.32', '2025-07-01 09:22:03', 'exito');
INSERT INTO eventos_login (id_evento, id_usuario, id_dispositivo, ip_origen, fecha_hora, resultado) VALUES (31, 19, 119, '10.0.0.33', '2025-07-01 09:33:18', 'exito');
INSERT INTO eventos_login (id_evento, id_usuario, id_dispositivo, ip_origen, fecha_hora, resultado) VALUES (32, 20, 120, '10.0.0.34', '2025-07-01 09:44:22', 'exito');
INSERT INTO eventos_login (id_evento, id_usuario, id_dispositivo, ip_origen, fecha_hora, resultado) VALUES (33, 3, 103, '10.0.0.17', '2025-07-01 10:05:44', 'fallo');
INSERT INTO eventos_login (id_evento, id_usuario, id_dispositivo, ip_origen, fecha_hora, resultado) VALUES (34, 3, 103, '10.0.0.17', '2025-07-01 10:06:02', 'exito');
INSERT INTO eventos_login (id_evento, id_usuario, id_dispositivo, ip_origen, fecha_hora, resultado) VALUES (35, 7, 107, '10.0.0.21', '2025-07-01 11:22:11', 'exito');
INSERT INTO eventos_login (id_evento, id_usuario, id_dispositivo, ip_origen, fecha_hora, resultado) VALUES (36, 6, 106, '10.0.0.20', '2025-07-01 12:30:04', 'exito');
INSERT INTO eventos_login (id_evento, id_usuario, id_dispositivo, ip_origen, fecha_hora, resultado) VALUES (37, 5, 105, '10.0.0.19', '2025-07-01 13:15:33', 'exito');
INSERT INTO eventos_login (id_evento, id_usuario, id_dispositivo, ip_origen, fecha_hora, resultado) VALUES (38, 10, 110, '10.0.0.24', '2025-07-01 14:44:19', 'exito');
INSERT INTO eventos_login (id_evento, id_usuario, id_dispositivo, ip_origen, fecha_hora, resultado) VALUES (39, 11, 111, '10.0.0.25', '2025-07-01 15:03:00', 'fallo');
INSERT INTO eventos_login (id_evento, id_usuario, id_dispositivo, ip_origen, fecha_hora, resultado) VALUES (40, 11, 111, '10.0.0.25', '2025-07-01 15:03:22', 'exito');

COMMIT;
