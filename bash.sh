#!/bin/bash

# Установка версии. Это может быть автоматизировано через систему CI или вводом пользователя.
VERSION="v0.0.13"

# Название проекта
PROJECT_NAME="dinikon/tms-backend"

docker login

# Сборка образа
docker build -f docker/base/Dockerfile -t ${PROJECT_NAME}:${VERSION} .
docker tag ${PROJECT_NAME}:${VERSION} ${PROJECT_NAME}:latest

# Запуск образа для тестирования (опционально)
#docker run --name ${PROJECT_NAME} -d ${PROJECT_NAME}:${VERSION}

# Пуш образов в репозиторий
docker push ${PROJECT_NAME}:${VERSION}
docker push ${PROJECT_NAME}:latest

# Очистка локальных образов после пуша (опционально)
docker rmi ${PROJECT_NAME}:${VERSION}
docker rmi ${PROJECT_NAME}:latest
