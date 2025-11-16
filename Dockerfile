# Usamos Amazon Corretto como base (JDK 21 sobre Alpine)
FROM amazoncorretto:17-alpine
# Directorio de trabajo dentro del contenedor# Directorio de trabajo dentro del contenedor
WORKDIR /app
# Copia el JAR generado por Maven en tu máquina/Jenkins
# Asegúrate de que ya exista target/*.jar antes de hacer docker build
COPY target/*.jar app.jar
# Establecer zona horaria
ENV TZ=America/Mexico_City
RUN apk add --no-cache tzdata && cp /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone
# Exponer el puerto donde escucha tu Spring Boot (por defecto 8080)
EXPOSE 8080
# Comando de arranque
ENTRYPOINT ["java", "-jar", "/app/app.jar"]