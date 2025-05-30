# 🌸 AnimeUtils <img align="right" width="190" height="41" src="./assets/logo.png">

[![License](https://img.shields.io/github/license/Junketsu-stacking/AnimeUtils?style=flat-square)](LICENSE)
[![Stars](https://img.shields.io/github/stars/Junketsu-stacking/AnimeUtils?style=flat-square)](https://github.com/Junketsu-stacking/AnimeUtils/stargazers)
[![Contributors](https://img.shields.io/github/contributors/Junketsu-stacking/AnimeUtils?style=flat-square)](https://github.com/Junketsu-stacking/AnimeUtils/graphs/contributors)
[![Languages](https://img.shields.io/github/languages/top/Junketsu-stacking/AnimeUtils?style=flat-square)](https://github.com/Junketsu-stacking/AnimeUtils)
[![Repo size](https://img.shields.io/github/repo-size/Junketsu-stacking/AnimeUtils?style=flat-square)](https://github.com/Junketsu-stacking/AnimeUtils)

> **AnimeUtils** — мультисервисный REST API и UI для синхронизации списков аниме и манги между популярными сервисами, такими как: Shikimori, AniList и Remanga

---

## 📌 О проекте

AnimeUtils позволяет:
- 🔄 Синхронизировать данные между платформами
- 🔐 Авторизоваться через внешние сервисы (OAuth2)
- 📥 Импортировать и 📤 экспортировать списки
- 🖥️ Использовать единый веб-интерфейс

---

## 🛠️ Используемые технологии

| Технология                                                                          | Применение                                                    |
|-------------------------------------------------------------------------------------|---------------------------------------------------------------|
| ![](https://img.shields.io/badge/-Python-3776AB?logo=python&logoColor=white)        | Язык программирования для микросервисов и обработки данных    |
| ![](https://img.shields.io/badge/-FastAPI-009688?logo=fastapi&logoColor=white)      | Основной REST API фреймворк                                   |
| ![](https://img.shields.io/badge/-Flask-000000?logo=flask&logoColor=white)          | Дополнительные вспомогательные сервисы                        |
| ![](https://img.shields.io/badge/-TypeScript-3178C6?logo=typescript&logoColor=white) | Типизированный язык для клиентской и служебной логики         |
| ![](https://img.shields.io/badge/-React-61DAFB?logo=react&logoColor=black)          | Фронтенд-интерфейс (SPA)                                      |
| ![](https://img.shields.io/badge/-PostgreSQL-336791?logo=postgresql&logoColor=white) | Основная реляционная база данных                              |
| ![](https://img.shields.io/badge/-Redis-DC382D?logo=redis&logoColor=white)          | Хранилище кеша и вспомогательных структур                     |
| ![](https://img.shields.io/badge/-Kafka-231F20?logo=apache-kafka&logoColor=white)   | Очереди сообщений и микросервисное взаимодействие             |
| ![](https://img.shields.io/badge/-Nginx-009639?logo=nginx&logoColor=white)          | Веб-сервер и обратный прокси                                  |
| ![](https://img.shields.io/badge/-OAuth2-4A90E2?logo=oauth&logoColor=white)         | Авторизация через внешние платформы (Shikimori, AniList, Remanga) |
| ![](https://img.shields.io/badge/-MongoDB-47A248?logo=mongodb&logoColor=white)      | Локальное хранилище списка манги и аниме                      |
| ![](https://img.shields.io/badge/-C%23-239120?logo=c-sharp&logoColor=white)       | Язык программирования для микросервисов и обработки данных                                                              |

---

## 🧩 Сервисы

| Сервис | Стек                          | Описание                 | Документация |
|--------|-------------------------------|--------------------------|--|
| **Frontend** | React, TypeScript             | UI-интерфейс пользователя | [Docs](https://github.com/Junketsu-stacking/WebSiteFrontend) |
| **Backend API** | FastAPI, Kafka, PostgreSQL    | Работа с пользователем в нашей системе | <!-- TODO: docs link --> |
| **Shikimori API Service** | Flask, OAuth, GraphQL         | Интеграция и импорт/экспорт из Shikimori | <!-- TODO --> |
| **AniList API Service** | DotNet, GraphQL               | Интеграция с AniList (GraphQL) | <!-- TODO --> |
| **Remanga API Service** | TypeScript, NodeJS            | Работа с мангой: главы, истории | <!-- TODO --> |
| **MAL API Service** | DotNet                        | Поддержка MyAnimeList    | <!-- TODO --> |
| **Access Controller** | TypeScript, NodeJS, Redis     | Генерация и валидация токенов | <!-- TODO --> |
| **Anime Syncer** | Kafka, Redis, TypeScript, NodeJS | Асинхронная синхронизация данных | <!-- TODO --> |
| **Remanga Job** | TypeScript, NodeJS, Cron, Redis, MongoDB | Джобы на прочтения манги | <!-- TODO --> |

---

## 📊 Архитектура микросервисов

<details open>
<summary>👁️ Нажмите, чтобы раскрыть архитектурную схему</summary>

<img src="./assets/junketsu.png" alt="Architecture diagram" width="100%">

</details>

---

## 🖼️ Примеры интерфейса

<details>
<summary>🧪 Визуальный интерфейс (скриншоты)</summary>

<table>
  <tr>
    <td align="center">
      <strong>Главная страница</strong><br>
      <img width="400" src="<!-- TODO: dashboard screenshot -->" alt="Dashboard" />
    </td>
    <td align="center">
      <strong>Профиль пользователя</strong><br>
      <img width="400" src="<!-- TODO: profile screenshot -->" alt="Profile" />
    </td>
  </tr>
</table>

</details>

---

## 📚 Основные возможности

- 🔐 Авторизация через Shikimori / AniList / Remanga
- 🔄 Синхронизация и кеширование данных
- 📥 Импорт / 📤 Экспорт контента
- 🖼️ UI-фильтры, сортировка, теги
- 👥 Связывание аккаунтов
- 📈 Расширяемая архитектура

---

## 🛣️ Дорожная карта

| Фича                     | Статус        |
|--------------------------|---------------|
| Поддержка MAL            | ⏳ В планах    |
| Telegram-бот             | ⏳ В планах |
| Админка и модерация      | ⏳ В планах |
| UI-фильтры и тёмная тема | ⏳ В планах      |
| CI/CD + Docker сборка    | 🚧 В разработке      |
| Поддержка AniList        | ⏳ В планах      |


---

## 🛡️ Безопасность

- 🧾 JWT токены
- 🔐 OAuth2 авторизация
- 📡 Все соединения через HTTPS
- 🧊 Хеширование чувствительных данных

---

## 🙌 Вклад

Мы открыты к любому вкладу!  
Присоединяйтесь к разработке через [Pull Requests](https://github.com/Junketsu-stacking/AnimeUtils/pulls) или оставляйте [Issues](https://github.com/Junketsu-stacking/AnimeUtils/issues).

📘 См. [CONTRIBUTING.md](./CONTRIBUTING.md)

---

## 📜 Лицензия

MIT License © [Junketsu Team](https://github.com/Junketsu-stacking)

---
