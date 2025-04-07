# DB redes sociales

## Modelo OLTP

![image](https://github.com/user-attachments/assets/c3459e61-c9c8-4195-a85b-213be2e1209e)

<table>
  <tr>
    <td>
      <pre><code class="language-sql">
id_usuario INT PRIMARY KEY IDENTITY(1,1),
username VARCHAR(50) UNIQUE NOT NULL,
email VARCHAR(100) UNIQUE NOT NULL,
telefono VARCHAR(20) NULL,
pais VARCHAR(50) NULL,
direccion VARCHAR(255) NULL,
created_at DATETIME DEFAULT GETDATE()
      </code></pre>
    </td>
    <td>
      <img src="https://github.com/user-attachments/assets/95802cdf-1741-4fe1-8b4e-738a1dc68320" width="300" alt="Modelo OLTP">
    </td>
  </tr>
  <tr>
    <td>
      <pre><code class="language-sql">
id_publicacion INT PRIMARY KEY IDENTITY(1,1),
id_usuario INT NOT NULL, -- Relación con Usuario
contenido NVARCHAR(MAX) NOT NULL,
created_at DATETIME DEFAULT GETDATE(),
FOREIGN KEY (id_usuario) REFERENCES Usuario(id_usuario) 
      </code></pre>
    </td>
    <td>
      <img src="https://github.com/user-attachments/assets/13a5a3bf-8fe8-4d45-a84f-41602166beee" width="300" alt="Modelo OLTP">
    </td>
  </tr>
  <tr>
    <td>
      <pre><code class="language-sql">
id_imagen INT PRIMARY KEY IDENTITY(1,1),
id_publicacion INT NOT NULL, -- Relación con Publicación
url VARCHAR(255) NOT NULL,  -- URL de la imagen
created_at DATETIME DEFAULT GETDATE(),
FOREIGN KEY (id_publicacion) REFERENCES Publicacion(id_publicacion) 
      </code></pre>
    </td>
      <td>
        <img src="https://github.com/user-attachments/assets/55f57864-fd70-479a-ae8f-043a78a11000" width="300" alt="Modelo OLTP">
      </td>
  </tr>
  <tr>
    <td>
      <pre><code class="language-sql">
id_comentario INT PRIMARY KEY IDENTITY(1,1),
id_usuario INT NOT NULL, -- Usuario que comenta
id_publicacion INT NOT NULL, -- Publicación comentada
comentario NVARCHAR(MAX) NOT NULL,
created_at DATETIME DEFAULT GETDATE(),
id_Comentario_r INT NULL,  -- Para la relación recursiva
FOREIGN KEY (id_Comentario_r) REFERENCES Comentario(id_comentario),
FOREIGN KEY (id_usuario) REFERENCES Usuario(id_usuario),
FOREIGN KEY (id_publicacion) REFERENCES Publicacion(id_publicacion)
      </code></pre>
    </td>
    <td>
      <img src="https://github.com/user-attachments/assets/070ad307-c282-4784-a21c-e627354e76d8" width="300" alt="Modelo OLTP">
    </td>
  </tr>
  <tr>
    <td>
      <pre><code class="language-sql">
id_like INT PRIMARY KEY IDENTITY(1,1),
id_usuario INT NOT NULL,
id_publicacion INT NOT NULL,
created_at DATETIME DEFAULT GETDATE(),
FOREIGN KEY (id_usuario) REFERENCES Usuario(id_usuario),
FOREIGN KEY (id_publicacion) REFERENCES Publicacion(id_publicacion)
      </code></pre>
    </td>
    <td>
      <img src="https://github.com/user-attachments/assets/76da1182-6690-4d8b-964a-d58ad1d740d6" width="300" alt="Modelo OLTP">
    </td>
  </tr>
  <tr>
    <td>
      <pre><code class="language-sql">
id_seguimiento INT PRIMARY KEY IDENTITY(1,1),
id_seguidor INT NOT NULL,
id_seguido INT NOT NULL,
created_at DATETIME DEFAULT GETDATE(),
FOREIGN KEY (id_seguidor) REFERENCES Usuario(id_usuario),
FOREIGN KEY (id_seguido) REFERENCES Usuario(id_usuario) 
      </code></pre>
    </td>
    <td>
      <img src="https://github.com/user-attachments/assets/f9bca087-4a39-4c90-96c6-6ba4d5b28d22" width="300" alt="Modelo OLTP">
    </td>
  </tr>
  
</table>


# Modelo Dimensional

![image](https://github.com/user-attachments/assets/604216d2-f9dc-4e14-9306-72afe391242a)

# Poblando Modelo Dimensional

## Flujo general

![image](https://github.com/user-attachments/assets/6f6b9481-6009-4179-aa95-892888abecd1)

## Poblando las dimensiones

![image](https://github.com/user-attachments/assets/fd9257fb-f117-4855-9c83-98a8414327ad)

## Poblando la tabla FactLikes

![image](https://github.com/user-attachments/assets/9707ccc5-ec9f-4301-8d41-7b74b7510568)

## Poblando la tabla FactComentarios

![image](https://github.com/user-attachments/assets/a08c93df-0020-4e16-bf9b-793876881a86)

## Poblando la tabla FactSeguimientos

![image](https://github.com/user-attachments/assets/ff1f6741-838e-4479-9fd5-595623a05010)


# Analisis Services

## Vista del origen de datos

![image](https://github.com/user-attachments/assets/44bb655c-8a29-4159-95bc-901f1c71d69d)

## Vista del cubo

![image](https://github.com/user-attachments/assets/727f842f-398c-4ecc-a80f-5f5d6187af20)

### Explorando el cubo

#### Total de comentarios realizados

![image](https://github.com/user-attachments/assets/d94538b1-8546-4500-bb2c-2e39178dabdb)

#### Total de replicas realizadas

![image](https://github.com/user-attachments/assets/b349d99b-d169-4544-9685-b5673485b950)

#### Cantidad de Likes

![image](https://github.com/user-attachments/assets/1edf5241-750c-4db2-8d99-c9f34c2802e7)

### Cantidad de Likes y Comentarios por Usuario

![image](https://github.com/user-attachments/assets/a2596e0b-03c0-4ef0-a8d5-2f89149dec3e)

### Cantidad de Likes y Comentarios por País

![image](https://github.com/user-attachments/assets/c694d909-bb71-4c1b-88a3-de7240f819d7)

### Cantidad de Likes y Comentarios Replica por País

![image](https://github.com/user-attachments/assets/7a47fa5d-8355-4445-b82c-cb6d713d99a9)

## Indicadores que se podrian analizar

- Likes por usuario y mes
- Comentarios por país
- Duración de seguimientos
- Tasa de respuesta (porcentaje de comentarios con respuesta por creador)

# Reporting Services

![image](https://github.com/user-attachments/assets/51905ff9-be29-4379-be8b-bc1c550f8e8c)






