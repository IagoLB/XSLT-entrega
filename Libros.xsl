<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet
    version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
    <!-- Define una clave para el atributo id de los elementos Titulo -->
    <xsl:key name="titulo-key" match="Titulo" use="@id"/>
    <xsl:variable
    name="descuento" select=".1"/>
    <!-- Elimina espacios en blanco innecesarios -->
    <xsl:strip-space elements="*"/>
    <xsl:output method="html" version="1.0" encoding="UTF-8" indent="yes"/>
    <xsl:template match="Libros">
        <html>
            <xsl:comment>
                Soy un comentario
            </xsl:comment>
            <head>
                <title>Libros de Brandon Sanderson</title>
                <style>
                    h1 {
                        text-align: center;
                    }
                    td {
                        text-align: center;
                    }
                    table {
                        margin: 0 auto;
                    }
                </style>
            </head>
            <body>
                <h1>Libros de Brandon Sanderson</h1>
                <table border="1">
                    <tr bgcolor="#9acd32">
                        <th>Título</th>
                        <th>Autor</th>
                        <th>Editorial</th>
                        <th>Fecha de publicación</th>
                        <th>Género</th>
                        <th>Precio</th>
                        <th>Precio con Descuento</th>
                    </tr>
                    <!-- Recorre todos los elementos "Libro" -->
                    <xsl:for-each select="Libro">
                        <tr>
                            <!-- Crea una celda para la etiqueta "Titulo" -->
                            <td><xsl:value-of select="Titulo"/></td>
                            <!-- Crea una celda para la etiqueta "Autor" -->
                            <td><xsl:value-of select="Autor"/></td>
                            <!-- Crea una celda para la etiqueta "Editorial" -->
                            <td><xsl:value-of select="Editorial"/></td>
                            <!-- Crea una celda para la etiqueta "FechaPublicacion" -->
                            <td><xsl:value-of select="FechaPublicacion"/></td>
                            <!-- Crea una celda para la etiqueta "Genero" -->
                            <td><xsl:value-of select="Genero"/></td>
                            <!-- Crea una celda para la etiqueta "Precio" -->
                            <td>
                                <xsl:choose>
                                    <xsl:when test="Precio &gt; 30">
                                        <xsl:value-of select="concat(Precio,'€')"/>
                                        (Caro do carallo¡)
                                    </xsl:when>
                                    <xsl:otherwise>
                                        <xsl:value-of select="concat(Precio,'€')"/>
                                    </xsl:otherwise>
                                </xsl:choose>
                            </td>
                            <td><xsl:value-of select="concat(Precio * (1 - $descuento), ' €')"/></td>
                        </tr>
                    </xsl:for-each>
                </table>
            </body>
        </html>
    </xsl:template>
</xsl:stylesheet>