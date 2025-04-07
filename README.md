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

