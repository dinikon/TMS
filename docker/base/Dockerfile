# Используем официальный образ Python как базовый
FROM python:3.12-slim
LABEL authors="inikon"

# Устанавливаем рабочую директорию в контейнере
WORKDIR /tms-app

# Копируем зависимости
COPY ./app/requirements.txt /tms-app/requirements.txt

# Устанавливаем зависимости
RUN pip install --no-cache-dir -r /tms-app/requirements.txt

# Копируем остальные файлы проекта
COPY ./app /tms-app/

# Собираем статические файлы
RUN python manage.py collectstatic --noinput

# Указываем порт, который будет слушать контейнер
EXPOSE 8000

# Запускаем Django-приложение
CMD ["python", "manage.py", "runserver", "0.0.0.0:8000"]
