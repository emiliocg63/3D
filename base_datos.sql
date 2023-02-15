CREATE TABLE usuarios (
    id_usuario INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    nombre_usuario VARCHAR(50) NOT NULL,
    correo_electronico VARCHAR(100) NOT NULL,
    contrasena VARCHAR(100) NOT NULL,
    direccion_envio VARCHAR(200) NOT NULL,
    informacion_facturacion VARCHAR(200) NOT NULL,
    metodo_pago_preferido VARCHAR(50) NOT NULL,
    fecha_registro TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE modelos (
    id_modelo INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    nombre_modelo VARCHAR(100) NOT NULL,
    descripcion_modelo TEXT NOT NULL,
    archivo_stl BLOB NOT NULL,
    precio DECIMAL(10, 2) NOT NULL,
    categoria VARCHAR(50) NOT NULL,
    palabras_clave VARCHAR(200) NOT NULL,
    fecha_creacion TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    id_autor INT NOT NULL,
    FOREIGN KEY (id_autor) REFERENCES usuarios(id_usuario)
);

CREATE TABLE pedidos (
    id_pedido INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    id_usuario INT NOT NULL,
    fecha_pedido TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    estado_pedido VARCHAR(50) NOT NULL,
    metodo_envio VARCHAR(50) NOT NULL,
    direccion_envio VARCHAR(200) NOT NULL,
    total_pedido DECIMAL(10, 2) NOT NULL,
    notas_adicionales TEXT,
    FOREIGN KEY (id_usuario) REFERENCES usuarios(id_usuario)
);

CREATE TABLE revisiones (
    id_revision INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    id_modelo INT NOT NULL,
    id_usuario INT NOT NULL,
    comentario TEXT NOT NULL,
    puntuacion INT NOT NULL,
    fecha_revision TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (id_modelo) REFERENCES modelos(id_modelo),
    FOREIGN KEY (id_usuario) REFERENCES usuarios(id_usuario)
);
