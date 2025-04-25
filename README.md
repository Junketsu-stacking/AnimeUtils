# AnimeUtils

## Deploy

```
cp .envExample .env
nano .env  # заполните значения
chmod 600 .env
chmod +x *.sh
./deploy.sh
```


```
./stop.sh    # остановка
./start.sh   # перезапуск
```

## Transfer format

### Format

```json
{
    "title_en":"Mo Dao Zu Shi",
    "title_ru":"Магистр дьявольского культа",
    "alternative_titles":[],
    "id":1,
    "type":"Anime",
    "score":0,
    "status":"planned",
    "rewatches":0,
    "count":0,
    "from_service":"",
    "text":""
}
```

### Describe format

|name   |type   |description   |
|---|---|---|
|title_en   |string   |name of title on eng lang   |
|title_ru   |string   |name of title on ru lang   |
|alternative_titles   |list[string]   |alternative names of title that using for this title   |
|id   |int   |unic numb for our db   |
|type   |string   |type of title : manga/anime/ranobe   |
|score   |int   |score that user has aprove to this title range: 0-10   |
|rewatcher   |int   |rewatches of anime   |
|count   |float   |titel viewing percentage 6/10 = 0.6   |
|from_service   |string   |name of service that given info   |
|text   |string   |some info   |
